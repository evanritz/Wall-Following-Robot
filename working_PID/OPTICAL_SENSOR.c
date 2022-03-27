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

float ADC0_VAL, ADC1_VAL, ADC2_VAL;

void ADC_QUERY(void) {
    ADC0_VAL = (float) ADC1BUF0*3.3/1023.0;
    ADC1_VAL = (float) ADC1BUF1*3.3/1023.0;
    ADC2_VAL = (float) ADC1BUF2*3.3/1023.0;
}

//Front Center Sensor
float OPT0_DIST(void) {
    return 4.0478 * powf(ADC0_VAL, -0.6640); // equation here
}

//Back Right Sensor
float OPT1_DIST(void) {
    return 8.3846 * powf(ADC1_VAL, -0.7550); // equation here
}

//Front Right Sensor
float OPT2_DIST(void) {
    return 4.1493 * powf(ADC2_VAL, -0.7550); // equation here
}