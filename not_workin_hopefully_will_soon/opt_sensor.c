#include "opt_sensor.h"

float ADC_Value0;
float ADC_Value1;
float ADC_Value2;

void get_ADC_val(){
    ADC_Value0 = (float)ADC1BUF0*3.3/1023.0;	// Reading AN0(zero), pin 1 of connector JJ -- servo sensor (center)
	ADC_Value1 = (float)ADC1BUF1*3.3/1023.0;
    ADC_Value2 = (float)ADC1BUF2*3.3/1023.0;
}
//Front left optical sensor
float get_opt0_distance(void){
    float distance_cm = 17.451 * powf(ADC_Value0, -1.552);
    float distance_inch = distance_cm * 0.3937;
    return distance_inch;
}

float get_opt1_distance(void){
    return 0;
}
//Front right optical sensor
float get_opt2_distance(void){
    float distance_cm = 14.548 * powf(ADC_Value2, -1.601);
    float distance_inch = distance_cm * 0.3937;
    return distance_inch;
}