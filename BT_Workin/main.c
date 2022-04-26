/************************************************************************/
/*																		*/
/*	main.c	--	Main program module for project							*/
/*																		*/
/************************************************************************/
/*	Author: 	Dion Moses												*/
/*	Copyright 2009, Digilent Inc.										*/
/************************************************************************/
/*  Module Description: 												*/
/*																		*/
/*	This program is a reference design for the Digilent	Basic			*/
/*	Robotic Development Kit (RDK-Basic) with the Cerebot 32MX4 			*/
/*	Microcontroller board.  It uses two timers to drive two motors 		*/
/*	with output compare modules.										*/
/*																		*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/*																		*/
/*	 12/09/09(DionM): created											*/
/*   12/29/09(LeviB): altered to add movement functions and PmodBtn and */
/*					  PmodSwt functionality								*/
/*	 12/08/10(AaronO): renamed to RDK_Basic								*/	
/************************************************************************/

/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include <plib.h>
#include "stdtypes.h"
#include "config.h"
#include "MtrCtrl.h"
#include "spi.h"
#include "util.h"
//#include "opt_sensor.h"
#include "OPTICAL_SENSOR.h"
//#include "PID.h"
#include "DISPLAY.h"
#include "PID_CTRL.h"
#include "string.h"
/* ------------------------------------------------------------ */
/*				Local Type Definitions							*/
/* ------------------------------------------------------------ */

#define		TCKPS22 			6
#define 	TCKPS21				5
#define 	TCKPS20				4

#define		TCKPS32 			6
#define 	TCKPS31				5
#define 	TCKPS30				4
/* ------------------------------------------------------------ */
/*				Global Variables								*/
/* ------------------------------------------------------------ */
#ifndef OVERRIDE_CONFIG_BITS

#pragma config ICESEL   = ICS_PGx2		// ICE/ICD Comm Channel Select
#pragma config BWP      = OFF			// Boot Flash Write Protect
#pragma config CP       = OFF			// Code Protect
#pragma config FNOSC    = PRIPLL		// Oscillator Selection
#pragma config FSOSCEN  = OFF			// Secondary Oscillator Enable
#pragma config IESO     = OFF			// Internal/External Switch-over
#pragma config POSCMOD  = HS			// Primary Oscillator
#pragma config OSCIOFNC = OFF			// CLKO Enable
#pragma config FPBDIV   = DIV_8			// Peripheral Clock divisor
#pragma config FCKSM    = CSDCMD		// Clock Switching & Fail Safe Clock Monitor
#pragma config WDTPS    = PS1			// Watchdog Timer Postscale
#pragma config FWDTEN   = OFF			// Watchdog Timer 
#pragma config FPLLIDIV = DIV_2			// PLL Input Divider
#pragma config FPLLMUL  = MUL_16		// PLL Multiplier
#pragma config UPLLIDIV = DIV_2			// USB PLL Input Divider
#pragma config UPLLEN   = OFF			// USB PLL Enabled
#pragma config FPLLODIV = DIV_1			// PLL Output Divider
#pragma config PWP      = OFF			// Program Flash Write Protect
#pragma config DEBUG    = OFF			// Debugger Enable/Disable
    
#endif

/* ------------------------------------------------------------ */
/*				Local Variables									*/
/* ------------------------------------------------------------ */

#define	stPressed	1
#define	stReleased	0

#define	cstMaxCnt	10 // number of consecutive reads required for
					   // the state of a button to be updated

#define OC2_WHEEL_DUTY_CYCLE    2000     // KZ 2/16/22     Affects PWM signal to front right wheel on a scale of 0 to 9999
#define OC3_WHEEL_DUTY_CYCLE    2000     // KZ 2/16/22     Affects PWM signal to front left wheel on a scale of 0 to 9999

#define PBCLK 8000000
#define BAUDRATE 9600//115200

#define UPPER_TOL 0.5f
#define LOWER_TOL -0.5f
//#define MAX_WALL_DIST 16
#define MIN_WALL_DIST 3
#define TARGET_DIST 6

#define PUPPY_TARGET_DIST 3

//Puppy Dog States
#define IDLE                0
#define STOP                1
#define FORWARD             2
#define BACKWARD            3
#define BACKWARD_LEFT       4
#define BACKWARD_RIGHT      5
#define DANCE               6

const struct Puppy_State {
    uint16_t Left_Wheel_Speed; //Must be written to OC3R and OC3RS
    uint16_t Right_Wheel_Speed; //Must be written to OC2R and OC3RS
    //Wheel Direction will be written to dirMtrLeft and dirMtrRight 
    // Left: 1 = forward, 0 = backward
    //Right: 0 = forward, 1 = backward
    uint16_t Left_Wheel_Direction;
    uint16_t Right_Wheel_Direction; //Always opposite to Left_Wheel_Direction when moving straight
};
typedef const struct Puppy_State State;

struct btn {
	BYTE	stBtn;	// status of the button (pressed or released)
	BYTE	stCur;  // current read state of the button
	BYTE	stPrev; // previous read state of the button
	BYTE	cst;	// number of consecutive reads of the same button 
					// state
};


/* ------------------------------------------------------------ */
/*				Global Variables				                */
/* ------------------------------------------------------------ */

volatile	struct btn	btnBtn1;
volatile	struct btn	btnBtn2;

volatile	struct btn	PmodBtn1;
volatile	struct btn	PmodBtn2;
volatile	struct btn	PmodBtn3;
volatile	struct btn	PmodBtn4;

volatile	struct btn	PmodSwt1;
volatile	struct btn	PmodSwt2;
volatile	struct btn	PmodSwt3;
volatile	struct btn	PmodSwt4;

uint32_t ic2Counter = 0;
uint32_t ic2CounterExtra = 0;           //KZ added 2/16/22 as a test variable to make sure counter is accurate both in and out of the while loop in the IC2 
uint32_t ic3Counter = 0;

pid_i PID_CTRL_R;
pid_i PID_CTRL_L;

char algo[30];

int currentState = 0;   //Initialized to IDLE state
int nextState = 0;

char rx = 'Z';

State FSM[6] = {
    //IDLE
    {0, 0, 1, 0},
    //STOP
    {0, 0, 1, 0},
    //Move FORWARD
    {3000, 4000, 1, 0},
    //Move BACKWARD
    {3000, 4000, 0, 1},
    //Move BACKWARD_LEFT
    {1000, 4000, 0, 1},
    //Move BACKWARD_RIGHT
    {4000, 1000, 0, 1}        
};


/* ------------------------------------------------------------ */
/*				Forward Declarations							*/
/* ------------------------------------------------------------ */

void	DeviceInit(void);
void	AppInit(void);
void	Wait_ms(WORD ms);

void ADC_INIT(void);
void UART_INIT(void);
void INIT_OUTPUT_COMPARE(void);
void INIT_INPUT_CAPTURE(void);
void INIT_INT_TIMERS(void);

/* ------------------------------------------------------------ */
/*				Interrupt Service Routines						*/
/* ------------------------------------------------------------ */
/***	Timer5Handler
**
**	Parameters:
**		none
**
**	Return Value:
**		none
**
**	Errors:
**		none
**
**	Description:
**		Interrupt service routine for Timer 5 interrupt. Timer 5
**		is used to perform software debouncing of the on-board
**		buttons. It is also used as a time base for updating
**		the on-board LEDs and the Pmod8LD LEDs at a regular interval.
*/

void __ISR(_UART2_VECTOR, ipl4) IntUart2Handler(void) {
    LED4_on();
    IFS1CLR = (1 << 9);
    char rx_temp = U2RXREG;
    // 0x0D - /r
    // 0x0A - /n
    if (rx_temp != 0x0D && rx_temp != 0x0A)
        rx = rx_temp;
    //LED4_off();
}


void __ISR(_ADC_VECTOR, ipl3) _ADC_IntHandler(void) 
{

//   ADC CONVERSION
//   ISR is written assuming that ADC channels are scanned and the interrupt is thrown after all the conversions are complete
//

	prtLed3Set = (1 << bnLed3);   		// turn LED3 on in the beginning of interrupt
	IFS1CLR = ( 1 << 1 );  			// clear interrupt flag for ADC1 Convert Done

//  Read the a/d buffers and convert to voltages
//	ADCValue0 = (float)ADC1BUF0*3.3/1023.0;	// Reading AN0(zero), pin 1 of connector JJ -- servo sensor (center)
//	ADCValue1 = (float)ADC1BUF1*3.3/1023.0;
//    ADCValue2 = (float)ADC1BUF2*3.3/1023.0;
    
	//get_ADC_val();
    ADC_QUERY();
	prtLed3Clr = (1 << bnLed3);   // turn LED3 off at the end of interrupt
}

void __ISR(_TIMER_5_VECTOR, ipl7) Timer5Handler(void)
{    
	static	WORD tusLeds = 0;
	
	mT5ClearIntFlag();
	prtLed1Set = (1<<bnLed1); //change JMH 2/2/22
   
    /*
    if (PID_CTRL_R.IC_update) {
        PID_UPDATE(&PID_CTRL_R);
        PWM_UPDATE(&PID_CTRL_R);
    }
    
    if (PID_CTRL_L.IC_update) {
        PID_UPDATE(&PID_CTRL_L);
        PWM_UPDATE(&PID_CTRL_L);
    }
     */
    
    //PUPPT DOG ALGORITHM
    
    //Pulling ADC Inputs
    float FRONT_CENTER =OPT0_DIST();
    float FRONT_RIGHT = OPT2_DIST();
    float FRONT_LEFT =  OPT1_DIST();
        
    //Assign Wheel Speed based on current state
    OC2R  = FSM[currentState].Left_Wheel_Speed;
    OC2RS = FSM[currentState].Left_Wheel_Speed;
    OC3R  = FSM[currentState].Right_Wheel_Speed;
    OC3RS = FSM[currentState].Right_Wheel_Speed;
    
    //Assign Wheel direction based on current state
    dirMtrLeft  = FSM[currentState].Left_Wheel_Direction;
    dirMtrRight = FSM[currentState].Right_Wheel_Direction;
    
    if(dirMtrLeft){
		trisMtrLeftDirClr	= ( 1 << bnMtrLeftDir );
		prtMtrLeftDirClr	= ( 1 << bnMtrLeftDir );	// forward
		trisMtrRightDirClr	= ( 1 << bnMtrRightDir );	
		prtMtrRightDirSet	= ( 1 << bnMtrRightDir );	// forward
	}
    else if(dirMtrRight){
		trisMtrRightDirClr	= ( 1 << bnMtrRightDir );	
		prtMtrRightDirClr	= ( 1 << bnMtrRightDir );	// backward
		trisMtrLeftDirClr	= ( 1 << bnMtrLeftDir );
		prtMtrLeftDirSet	= ( 1 << bnMtrLeftDir );	// backward
	}
    
    
    
    switch (currentState){
        //IDLE STATE
        case IDLE: 
            strcpy(&algo, "IDLE");
            if( (FRONT_CENTER < MIN_WALL_DIST) && (FRONT_RIGHT < MIN_WALL_DIST) ){
                nextState = STOP;
            }
            else
                nextState = IDLE;
        break;
        //STOP STATE
        case STOP:
            strcpy(&algo, "STOPPED");
            //If in deadzone stop
            if((FRONT_CENTER >= PUPPY_TARGET_DIST + LOWER_TOL) && (FRONT_CENTER <= PUPPY_TARGET_DIST + UPPER_TOL) ){
                nextState = STOP;
            }
            //If below lower tolerance, reverse
            else if (FRONT_CENTER < PUPPY_TARGET_DIST + LOWER_TOL){
                nextState = BACKWARD;
            }
            //If above upper tolerance, go forward
            else if (FRONT_CENTER > PUPPY_TARGET_DIST + UPPER_TOL){
                nextState = FORWARD;
            }
        break;
        //CASE FORWARD
        case FORWARD:
            strcpy(&algo, "MOVING FORWARD");
            //If distance is above upper threshold stay in forward state
            if (FRONT_CENTER > PUPPY_TARGET_DIST + UPPER_TOL){
                nextState = FORWARD;
            }
            //If distance is below upper tolerance, stop
            else if (FRONT_CENTER < PUPPY_TARGET_DIST + UPPER_TOL){
                nextState = STOP;
            }
        break;
        //CASE BACKWARD
        case BACKWARD:
            strcpy(&algo, "MOVING BACKWARD");
            //If distance is below lower threshold stay in backward state
            if (FRONT_CENTER <= PUPPY_TARGET_DIST + LOWER_TOL && FRONT_RIGHT >= PUPPY_TARGET_DIST + UPPER_TOL && FRONT_LEFT >= PUPPY_TARGET_DIST + UPPER_TOL){
                nextState = BACKWARD;                
            }
            else if (FRONT_RIGHT < PUPPY_TARGET_DIST + LOWER_TOL){
                nextState = BACKWARD_LEFT;
            }
            else if (FRONT_LEFT < PUPPY_TARGET_DIST + LOWER_TOL){
                nextState = BACKWARD_RIGHT;
            }
            //If distance is above lower tolerance, stop            
            
            else {
                //if (FRONT_CENTER > PUPPY_TARGET_DIST - LOWER_TOL){
                nextState = STOP;
            }
        break;
        //CASE BACK_LEFT
        case BACKWARD_LEFT:
            strcpy(&algo, "MOVING BACK LEFT");
            if(FRONT_RIGHT <= PUPPY_TARGET_DIST + LOWER_TOL){
                nextState = BACKWARD_LEFT;
            }
            else{
               nextState = STOP; 
            }

        break;
        //CASE BACK_RIGHT
        case BACKWARD_RIGHT:
            strcpy(&algo, "MOVING BACK RIGHT");
            if(FRONT_LEFT <= PUPPY_TARGET_DIST + LOWER_TOL){
                nextState = BACKWARD_RIGHT;
            }
            else {
               nextState = STOP; 
            }
        break;
    }
       
    currentState = nextState;
        
	// Read the raw state of the button pins.
	btnBtn1.stCur = ( prtBtn1 & ( 1 << bnBtn1 ) ) ? stPressed : stReleased;
	btnBtn2.stCur = ( prtBtn2 & ( 1 << bnBtn2 ) ) ? stPressed : stReleased;
	
	//Read the raw state of the PmodBTN pins
	PmodBtn1.stCur = ( prtJE1 & ( 1 << bnJE1 ) ) ? stPressed : stReleased;
	PmodBtn2.stCur = ( prtJE2 & ( 1 << bnJE2 ) ) ? stPressed : stReleased;
	PmodBtn3.stCur = ( prtJE3 & ( 1 << bnJE3 ) ) ? stPressed : stReleased;
	PmodBtn4.stCur = ( prtJE4 & ( 1 << bnJE4 ) ) ? stPressed : stReleased;

	//Read the raw state of the PmodSWT pins
	PmodSwt1.stCur = ( prtJA1 & ( 1 << swtJA1 ) ) ? stPressed : stReleased;
	PmodSwt2.stCur = ( prtJA2 & ( 1 << swtJA2 ) ) ? stPressed : stReleased;
	PmodSwt3.stCur = ( prtJA3 & ( 1 << swtJA3 ) ) ? stPressed : stReleased;
	PmodSwt4.stCur = ( prtJA4 & ( 1 << swtJA4 ) ) ? stPressed : stReleased;

	// Update state counts.
	btnBtn1.cst = ( btnBtn1.stCur == btnBtn1.stPrev ) ? btnBtn1.cst + 1 : 0;
	btnBtn2.cst = ( btnBtn2.stCur == btnBtn2.stPrev ) ? btnBtn2.cst + 1 : 0;

	//Update state counts for PmodBTN
	PmodBtn1.cst = (PmodBtn1.stCur == PmodBtn1.stPrev) ? PmodBtn1.cst +1 : 0;
	PmodBtn2.cst = (PmodBtn2.stCur == PmodBtn2.stPrev) ? PmodBtn2.cst +1 : 0;
	PmodBtn3.cst = (PmodBtn3.stCur == PmodBtn3.stPrev) ? PmodBtn3.cst +1 : 0;
	PmodBtn4.cst = (PmodBtn4.stCur == PmodBtn4.stPrev) ? PmodBtn4.cst +1 : 0;

	//Update state counts for PmodSWT
	PmodSwt1.cst = (PmodSwt1.stCur == PmodSwt1.stPrev) ? PmodSwt1.cst +1 : 0;
	PmodSwt2.cst = (PmodSwt2.stCur == PmodSwt2.stPrev) ? PmodSwt2.cst +1 : 0;
	PmodSwt3.cst = (PmodSwt3.stCur == PmodSwt3.stPrev) ? PmodSwt3.cst +1 : 0;
	PmodSwt4.cst = (PmodSwt4.stCur == PmodSwt4.stPrev) ? PmodSwt4.cst +1 : 0;
	
	// Save the current state.
	btnBtn1.stPrev = btnBtn1.stCur;
	btnBtn2.stPrev = btnBtn2.stCur;

	// Save the current state for PmodBTN
	PmodBtn1.stPrev = PmodBtn1.stCur;
	PmodBtn2.stPrev = PmodBtn2.stCur;
	PmodBtn3.stPrev = PmodBtn3.stCur;
	PmodBtn4.stPrev = PmodBtn4.stCur;

	// Save the current state for PmodSWT
	PmodSwt1.stPrev = PmodSwt1.stCur;
	PmodSwt2.stPrev = PmodSwt2.stCur;
	PmodSwt3.stPrev = PmodSwt3.stCur;
	PmodSwt4.stPrev = PmodSwt4.stCur;
	
	// Update the state of button 1 if necessary.
	if ( cstMaxCnt == btnBtn1.cst ) {
		btnBtn1.stBtn = btnBtn1.stCur;
		btnBtn1.cst = 0;
	}
	
	// Update the state of button 2 if necessary.
	if ( cstMaxCnt == btnBtn2.cst ) {
		btnBtn2.stBtn = btnBtn2.stCur;
		btnBtn2.cst = 0;
	}

	//if statements for buttons

	// Update the state of PmodBTN1 if necessary.
	if ( cstMaxCnt == PmodBtn1.cst ) {
		PmodBtn1.stBtn = PmodBtn1.stCur;
		PmodBtn1.cst = 0;
	}
	
	// Update the state of PmodBTN2 if necessary.
	if ( cstMaxCnt == PmodBtn2.cst ) {
		PmodBtn2.stBtn = PmodBtn2.stCur;
		PmodBtn2.cst = 0;
        
	}

	// Update the state of PmodBTN3 if necessary.
	if ( cstMaxCnt == PmodBtn3.cst ) {
		PmodBtn3.stBtn = PmodBtn3.stCur;
		PmodBtn3.cst = 0;
        
	}

	// Update the state of PmodBTN4 if necessary.
	if ( cstMaxCnt == PmodBtn4.cst ) {
		PmodBtn4.stBtn = PmodBtn4.stCur;
		PmodBtn4.cst = 0;
	}

	//if statements for switches

	// Update the state of PmodSWT1 if necessary.
	if ( cstMaxCnt == PmodSwt1.cst ) {
		PmodSwt1.stBtn = PmodSwt1.stCur;
		PmodSwt1.cst = 0;
	}
	
	// Update the state of PmodSWT2 if necessary.
	if ( cstMaxCnt == PmodSwt2.cst ) {
		PmodSwt2.stBtn = PmodSwt2.stCur;
		PmodSwt2.cst = 0;
	}

	// Update the state of PmodSWT3 if necessary.
	if ( cstMaxCnt == PmodSwt3.cst ) {
		PmodSwt3.stBtn = PmodSwt3.stCur;
		PmodSwt3.cst = 0;
	}

	// Update the state of PmodSWT4 if necessary.
	if ( cstMaxCnt == PmodSwt4.cst ) {
		PmodSwt4.stBtn = PmodSwt4.stCur;
		PmodSwt4.cst = 0;
	}
       
    prtLed1Clr	= ( 1 << bnLed1 ); //change JMH 2/2/22
}

/***	Input Capture Interupts
**      Change JMH 2/7
**	Parameters:
**		none
**
*/
void __ISR(_INPUT_CAPTURE_2_VECTOR, ipl5) _IC2_IntHandler(void) 
{
    // ER 2/9 Hopefully this works
    mIC2ClearIntFlag();
    //ic2Counter++;
    LED2_on();
    
    
    uint16_t buffer_data;
    while(IC2CON & (0x0008)){
        //ic2CounterExtra++;        //KZ added 2/16/22 to compare to ic2Counter outside of while loop. Checks if 
        buffer_data = (uint16_t) IC2BUF;
    }
    
    IC_UPDATE(&PID_CTRL_R, buffer_data);
    
    //IC2_Prev_Data = IC2_Current_Data;
    //IC2_Current_Data = buffer_data;

    LED2_off();
}

void __ISR(_INPUT_CAPTURE_3_VECTOR, ipl5) _IC3_IntHandler(void) 
{
    mIC3ClearIntFlag();  
    //ic3Counter++;
    
    LED3_on();
    
    uint16_t buffer_data;
    while(IC3CON & (0x0008)){
	 buffer_data = (uint16_t) IC3BUF;
	 
    }
    
    IC_UPDATE(&PID_CTRL_L, buffer_data);

    //IC3_Prev_Data = IC3_Current_Data;
    //IC3_Current_Data = buffer_data;
    
    // clear interrupt flag for Input Capture 3
    // increment counter
    
    LED3_off();
}

/* ------------------------------------------------------------ */
/*				Procedure Definitions							*/
/* ------------------------------------------------------------ */
/***	main
**
**	Synopsis:
**		st = main()
**
**	Parameters:
**		none
**
**	Return Values:
**		does not return
**
**	Errors:
**		none
**
**	Description:
**		Main program module. Performs basic board initialization
**		and then enters the main program loop.
*/


int main(void) {

	BYTE	stBtn1;
	BYTE	stBtn2;

	BYTE	stPmodBtn1;
	BYTE	stPmodBtn2;
	BYTE	stPmodBtn3;
	BYTE	stPmodBtn4;

	BYTE	stPmodSwt1;
	BYTE	stPmodSwt2;
	BYTE	stPmodSwt3;
	BYTE	stPmodSwt4;


	DeviceInit();
	AppInit();
    InitLeds(); //change JMH 2/2/22

	//INTDisableInterrupts();
	DelayMs(500);

	//write to PmodCLS
	//SpiEnable();
//	SpiPutBuff(szClearScreen, 3);
//	DelayMs(4);
//	SpiPutBuff(szBacklightOn, 4);
//	DelayMs(4);
//	SpiPutBuff(szCursorOff, 4);
//	DelayMs(4);
//	SpiPutBuff("Hello from", 10);
//	DelayMs(4);
//	SpiPutBuff(szCursorPos, 6);
//	DelayMs(4);
//	SpiPutBuff("Digilent!", 9);
//	DelayMs(2000);
    
    char strout[100];
    char strout_2[100];
	//SpiDisable();

    //Set target speed of PID control
    //IC2_targetSpeed = 1.5;
    //IC3_targetSpeed = 1.5;
    
    //IC2_Prev_Data = 0;
    //IC2_Current_Data = 0;
    //IC3_Prev_Data = 0;
    //IC3_Current_Data = 0;
    
    //LED1_on();
    //LED2_on();
    //LED3_on();
    //LED4_on();
    
	INTEnableInterrupts();
    
    //OC2R = 2000;
    //OC2RS = 2000;
    
    // IC2 Right Motor
    PID_CTRL_R.target_speed = 1.425;
    // IC3 Left Motor 
    PID_CTRL_L.target_speed = 1.5;
    
    
	while (fTrue)
	{	
        
		//INTDisableInterrupts();
        
        //sprintf(strout, "ADC0=%.2f ADC2=%.2f", OPT0_DIST(), OPT2_DIST());
        //sprintf(strout, "PID=%.2f", PID_CTRL_R.pid_val);  
        //char sym = '>';
        //if (PID_CTRL_R.IC_curr < PID_CTRL_R.IC_prev)
        //    sym = '<';
        //sprintf(strout_2, "CS=%.2f TS=%.2f", PID_CTRL_R.curr_speed, PID_CTRL_R.target_speed);
//        sprintf(strout, "Front=%.2f", OPT0_DIST());      
        //sprintf(strout_2, "FR=%.2f FL=%.2f", OPT2_DIST(), OPT1_DIST());
        //DISPLAY_print_double(strout, strout_2);
        //DISPLAY_print_double(algo, strout_2);
        sprintf(strout, "RX=%c", rx);
        DISPLAY_print(strout);
        
		stBtn1 = btnBtn1.stBtn;
		stBtn2 = btnBtn2.stBtn;

		stPmodBtn1 = PmodBtn1.stBtn;
		stPmodBtn2 = PmodBtn2.stBtn;
		stPmodBtn3 = PmodBtn3.stBtn;
		stPmodBtn4 = PmodBtn4.stBtn;

		stPmodSwt1 = PmodSwt1.stBtn;
		stPmodSwt2 = PmodSwt2.stBtn;
		stPmodSwt3 = PmodSwt3.stBtn;
		stPmodSwt4 = PmodSwt4.stBtn;
	}  //end while
}  //end main

/* ------------------------------------------------------------ */
/***	DeviceInit
**
**	Synopsis:
**		DeviceInit()
**
**	Parameters:
**		none
**
**	Return Values:
**		none
**
**	Errors:
**		none
**
**	Description:
**		Initializes on chip peripheral devices to the default
**		state.
*/

void DeviceInit() {

	// Configure left motor direction pin and set default direction.
	trisMtrLeftDirClr	= ( 1 << bnMtrLeftDir );
	prtMtrLeftDirClr	= ( 1 << bnMtrLeftDir );	// forward
	
	// Configure right motor direction pin and set default direction.
	trisMtrRightDirClr	= ( 1 << bnMtrRightDir );	
	prtMtrRightDirSet	= ( 1 << bnMtrRightDir );	// forward
    
    INIT_INT_TIMERS();
    INIT_OUTPUT_COMPARE();
    INIT_INPUT_CAPTURE();
    UART_INIT();
    ADC_INIT();
    
	SpiInit();
    SpiEnable();
    
	// Enable multi-vector interrupts.
	INTEnableSystemMultiVectoredInt();
}


/* ------------------------------------------------------------ */
/***	AppInit
**
**	Synopsis:
**		AppInit()
**
**	Parameters:
**		none
**
**	Return Values:
**		none
**
**	Errors:
**		none
**
**	Description:
**		Performs application specific initialization. Sets devices
**		and global variables for application.
*/

void AppInit() {
    //                                  Kp  Kd  Ki
    PID_CTRL_R = PID_INIT(&OC2R, &OC2RS, 200, 50, 100, 10000, -10000, 1.5);
    PID_CTRL_L = PID_INIT(&OC3R, &OC3RS, 200, 50, 100, 10000, -10000, 1.5);
    
    
}


/* ------------------------------------------------------------ */
/***	Wait_ms
**
**	Synopsis:
**		Wait_ms(WORD)
**
**	Parameters:
**		WORD (range from 0 to 65535)
**
**	Return Values:
**		none
**
**	Errors:
**		none
**
**	Description:
**		Will wait for specified number of milliseconds.  Using a 
**		word variable allows for delays up to 65.535 seconds.  The value
**		in the for statement may need to be altered depending on how your
**		compiler translates this code into AVR assembly.  In assembly, it is
**		possible to generate exact delay values by counting the number of clock
**		cycles your loop takes to execute.  When writing code in C, the compiler
**		interprets the code, and translates it into assembly.  This process is 
**		notoriously inefficient and may vary between different versions of AVR Studio
**		and WinAVR GCC.  A handy method of calibrating the delay loop is to write a 
**		short program that toggles an LED on and off once per second using this 
**		function and using a watch to time how long it is actually taking to
**		complete. 
**
*/

void Wait_ms(WORD delay) {

	WORD i;

	while(delay > 0){

		for( i = 0; i < 375; i ++){
			;;
		}
		delay -= 1;
	}
}

/************************************************************************/
void InitLeds( void ) //change JMH 2/2/22
{
	// Configure LEDs as digital outputs.
	trisLed1Clr = ( 1 << bnLed1 );
	trisLed2Clr = ( 1 << bnLed2 );
	trisLed3Clr = ( 1 << bnLed3 );
	trisLed4Clr = ( 1 << bnLed4 );
	
	// Turn off the LEDs.
	prtLed1Clr	= ( 1 << bnLed1 );
	prtLed2Clr	= ( 1 << bnLed2 );
	prtLed3Clr	= ( 1 << bnLed3 );
	prtLed4Clr	= ( 1 << bnLed4 );
}	

void ADC_INIT(void){
//	CONFIGURE ADC
	AD1PCFG	= 0XFFF0;
	// CONFIGURE AN0, AN1, AN2, and AN3 AS ANALOG INPUTS
	AD1CON1	= 0X00E4;   
	// BIT 7-5 SSRC 111 = INTERNAL COUNTER ENDS SAMPLING AND STARTS CONVERSION
	// BIT 4 CLRASM 0 = Normal Operation, buffer contents will be overwritten by the next conversion sequence
	// BIT 2 ASAM 1 = SAMPLING BEGINS immediately after conversion completes; SAMP bit is automatically set
	// BIT 1 SAMP 0 = ADC IS NOT SAMPLING
	// BUT 0 DONE 0 = STATUS BIT
	AD1CON2	= 0X0408; // 0000 0100 0000 1000     				
	// BIT 10 CSCNA 1 = SCAN INPUTS
	// BIT 2-3 SMPL 1-1 = ONE INTERRUPT AFTER EVERY THIRD CONVERSION
	AD1CON3	= 0X1FFF;
	// BIT 15 ADRC 0 = CLOCK DERIVED FROM PERIPHERAL BUS CLOCK
	// SAMC AND ADCS - I NEED TO READ MORE ABOUT TIMING TO UNDERSTAND THE FUNCTION OF THESE TWO VARIABLES
	AD1CHS	= 0X00000000;   // 32 bit SFR  
	AD1CSSL	= 0X000F;  
	// CSSL = SCAN CHANNELS 3,2,1 and 0
	IPC6SET	= ( 1 << 27 ) | ( 1 << 26 ); // ADC interrupt priority level 3, sub 0
	IFS1CLR	= 2;    // CLEAR ADC INTERRUPT FLAG
	IEC1SET = 2;	// ENABLE ADC INTERRUPT
	AD1CON1SET = 0X8000;	// 	TURN ADC ON

}

void UART_INIT(void) {
    TRISFCLR = (1<<13)|(1<<5);
    
    TRISDCLR = (1<<0);
    
    PORTDSET=(1<<0);
    
    U2STASET = (1<<12);//Enable Transmit and Receive
    
    U2BRG = (PBCLK/(4*BAUDRATE))-1;
    //U2BRG = 51; //pg 14 tb 21-2
    
    U2MODESET = (1<<15)|(1<<8)|(1<<3);
     
    
    IFS1CLR = (1<<9);
    IEC1SET = (1<<9);

    IPC8SET = (1<<4)|(1<<1);

    TRISDCLR = (1<<14);
    PORTDSET = (1<<14);
}

void INIT_OUTPUT_COMPARE(void) {
    	// Configure Output Compare 2 to drive the left motor.
	OC2CON	= ( 1 << 3 ) | ( 1 << 2 ) | ( 1 << 1 );	// pwm set up
	//OC2R	= dtcMtrStopped; //original
	OC2R = OC2_WHEEL_DUTY_CYCLE;
    //OC2RS	= dtcMtrStopped;  //original
    OC2RS = OC2_WHEEL_DUTY_CYCLE;
    
	// Configure Output Compare 3.
	OC3CON = ( 1 << 3 ) | ( 1 << 2 ) | ( 1 << 1 );	// pwm
	//OC3R	= dtcMtrStopped;
	OC3R = OC3_WHEEL_DUTY_CYCLE;
    //OC3RS	= dtcMtrStopped;
    OC3RS = OC3_WHEEL_DUTY_CYCLE;
    
    OC2CONSET	= ( 1 << 15 );	// enable output compare module 2
	OC3CONSET	= ( 1 << 15 );	// enable output compare module 3
    
}

void INIT_INPUT_CAPTURE(void) {
    //Input capture 2 for timer 2
    IPC2SET	= ( 1 << 12 ) | ( 0 << 11 ) | ( 1 << 10 ) | ( 1 << 9 ) | ( 1 << 8 ); // interrupt priority level 5, sub 3
	IFS0CLR = ( 1 << 9 );
	IEC0SET	= ( 1 << 9 );
    
    IC2CON = (1<<7) | (1<<1) | (1<<0);  //2/16/22 KZ changed trigger from every edge to only rising edge

    
    //Input capture 3 for timer 2
    IPC3SET	= ( 1 << 12 ) | ( 0 << 11 ) | ( 1 << 10 ) | ( 1 << 9 ) | ( 1 << 8 ); // interrupt priority level 5, sub 3
	IFS0CLR = ( 1 << 13 );
	IEC0SET	= ( 1 << 13 );
    
    IC3CON = (1<<7) | (1<<1) | (1<<0);  //2/16/22 KZ changed trigger from every edge to only rising edge
    
    // turn on Input Capture 2 & 3
    IC2CONSET = (1<<15);
    IC3CONSET = (1<<15);
    
    
    // Configure Timer 2.
	TMR2	= 0;									// clear timer 2 count
	PR2		= 64999;
    
	// Configure Timer 3.
	TMR3	= 0;
	PR3		= 9999;
}

void INIT_INT_TIMERS(void) {
    
    T2CON		= ( 1 << 15 ) | ( 1 << TCKPS20 )|(1 << TCKPS21);		// timer 2 prescale = 8
    T3CON		= ( 1 << 15 ) | ( 1 << TCKPS31 ) | ( 1 << TCKPS30); 	// timer 3 prescale = 8
    
    // Configure Timer 5.
	TMR5	= 0;
	PR5		= 999; // period match every 1000 us
	IPC5SET	= ( 1 << 4 ) | ( 1 << 3 ) | ( 1 << 2 ) | ( 1 << 1 ) | ( 1 << 0 ); // interrupt priority level 7, sub 3
	IFS0CLR = ( 1 << 20);
	IEC0SET	= ( 1 << 20);
    
    T5CON = ( 1 << 15 ) | ( 1 << 5 ) | ( 1 << 4 ); // fTimer5 = fPb / 8
}