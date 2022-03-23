/* 
 * File:   LEDS.c
 * Author: Evan
 *
 * Ease of use functions for LEDS
 * 
 * Created on March 22, 2022, 6:30 PM
 */

#include "LEDS.h"
#include "config.h"

// LED1 //////////////////////////////////
void LED1_on(void) {
    prtLed1Set = (1 << bnLed1);
}
void LED1_off(void) {
    prtLed1Clr	= (1 << bnLed1);
}

// LED2 //////////////////////////////////
void LED2_on(void) {
    prtLed2Set = (1 << bnLed2);
}
void LED2_off(void) {
    prtLed2Clr	= (1 << bnLed2);
}


// LED3 //////////////////////////////////
void LED3_on(void) {
    prtLed3Set = (1 << bnLed3);
}
void LED3_off(void) {
    prtLed3Clr	= (1 << bnLed3);
}

// LED4 //////////////////////////////////
void LED4_on(void) {
    prtLed4Set = (1 << bnLed4);
}
void LED4_off(void) {
    prtLed4Clr	= (1 << bnLed4);
}
