/* 
 * File:   OPTICAL_SENSOR.h
 * Author: Team
 *
 * Querys ADC and returns distance (in Inches) from each Optical sensor
 * 
 * Created on March 22, 2022, 8:27 PM
 */

#include "OPTICAL_SENSOR.h"

#include <plib.h>

float ADC0_VAL, ADC1_VAL, ADC2_VAL;

void ADC_QUERY(void) {
    ADC0_VAL = (float) ADC1BUF0*3.3/1023.0;
    ADC1_VAL = (float) ADC1BUF1*3.3/1023.0;
    ADC2_VAL = (float) ADC1BUF2*3.3/1023.0;
}

float OPT0_DIST(void) {
    float dist_cm = ADC0_VAL; // equation here
    return dist_cm * CM_TO_IN;
}

float OPT1_DIST(void) {
    float dist_cm = ADC1_VAL; // equation here
    return dist_cm * CM_TO_IN;
}

float OPT2_DIST(void) {
    float dist_cm = ADC2_VAL; // equation here
    return dist_cm * CM_TO_IN;
}