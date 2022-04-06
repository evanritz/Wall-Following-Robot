/* 
 * File:   OPTICAL_SENSOR.h
 * Author: Team
 *
 * Querys ADC and returns distance (in Inches) from each Optical sensor
 * 
 * Created on March 22, 2022, 8:27 PM
 */

#include "OPTICAL_SENSOR.h"
#include <math.h>
#include <plib.h>

float ADC0_VAL, ADC1_VAL, ADC2_VAL, ADC3_VAL;

void ADC_QUERY(void) {
    ADC0_VAL = (float) ADC1BUF0*3.3/1023.0;
    ADC1_VAL = (float) ADC1BUF1*3.3/1023.0;
    ADC2_VAL = (float) ADC1BUF2*3.3/1023.0;
    ADC3_VAL = (float) ADC1BUF3*3.3/1023.0;
}

//Front Center Sensor
float OPT0_DIST(void) {
    //return ADC0_VAL;  //For characterization
    return 4.0478 * powf(ADC0_VAL, -0.6640); // equation here
}

//Back Right Sensor
float OPT1_DIST(void) {
    //return ADC1_VAL;  //For characterization
    return 7.5739 * powf(ADC1_VAL, -0.929);
}

//Front Right Sensor
float OPT2_DIST(void) {
    //return ADC2_VAL;  //For characterization
    return 4.9806 * powf(ADC2_VAL, -0.8400); // equation here
}

//Front Left Sensor
float OPT3_DIST(void) {
    //return ADC2_VAL;  //For characterization
    return 4.9806 * powf(ADC3_VAL, -0.8400); // equation here
}