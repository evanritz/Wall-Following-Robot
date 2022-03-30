/* 
 * File:   DISPLAY.c
 * Author: Evan
 *
 * Ease of use function for PmodCLS Display
 * 
 * Created on March 22, 2022, 7:40 PM
 */

#include "spi.h"

//PmodCLS instructions
static char szClearScreen[] = {0x1B, '[', 'j', 0};

static char szCursorOff[] = {0x1B, '[', '0', 'c', 0};
static char szBacklightOn[] = {0x1B, '[', '3', 'e', 0};

static char szScrollLeft[] = {0x1B, '[', '1', '@', 0};
static char szScrollRight[] = {0x1B, '[', '1', 'A', 0};
static char szWrapMode[] = {0x1B, '[', '0', 'h', 0};

static char szCursorPos[] = {0x1B, '[', '1', ';', '0', 'H', 0};
static char szNextLineCursorPos[] = {0x1B, '[', '8', ';', '0', 'H', 0}; 

void DISPLAY_print(char *output) {
    SpiPutBuff(szClearScreen, 3);
    DelayMs(4);
    SpiPutBuff(szBacklightOn, 4);
    DelayMs(4);
    SpiPutBuff(szCursorOff, 4);
    DelayMs(4);
    // SpiPutBuff takes char array pointer, so does strlen
    SpiPutBuff(output, strlen(output));
    DelayMs(4);
    SpiPutBuff(szCursorPos, 6);
    DelayMs(250);
}

void DISPLAY_print_double(char *output_1, char *output_2) {
    SpiPutBuff(szClearScreen, 3);
    DelayMs(4);
    SpiPutBuff(szBacklightOn, 4);
    DelayMs(4);
    SpiPutBuff(szCursorOff, 4);
    DelayMs(4);
    // SpiPutBuff takes char array pointer, so does strlen
    SpiPutBuff(output_1, strlen(output_1));
    DelayMs(4);
    SpiPutBuff(szCursorPos, 6);
    DelayMs(4);
    SpiPutBuff(output_2, strlen(output_2));
    DelayMs(250);
}