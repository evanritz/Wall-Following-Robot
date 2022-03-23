#ifndef PID_H
#define	PID_H

#include <plib.h>
#include "stdtypes.h"
#include "config.h"
#include "MtrCtrl.h"
#include "util.h"

#define kp                  1
#define ki                  5
#define kd                  1
#define CAPTURE_SIZE        100
#define MAX_MIN_EI          10000      // KZ 2/16/22     Max and min (negative) value of which the integrated error in the PID control is bound between
#define OC_MAX_DUTY_CYCLE   10000     // KZ 2/16/22 ER 2/23 
#define OC_MIN_DUTY_CYCLE   0        // KZ 2/16/22 ER 2/23
#define PULSE_PER_REV       137      // KZ 2/16/22     Possible motors have different gear ratio to give us lower than expected 160 Pulse/rev

uint16_t ic2TimeData[CAPTURE_SIZE]; //JMH change 2/7
int ic2TimeDataIdx;

uint16_t ic3TimeData[CAPTURE_SIZE]; //JMH change 2/7
int ic3TimeDataIdx;

float IC2_targetSpeed; // Max is 1.82 Min is 0
float IC3_targetSpeed; // Max is 1.82 Min is 0
float IC2_pid;
float IC3_pid;
float IC2_speed;
float IC3_speed;


void IC2_PID(int toggle);
void IC3_PID(int toggle);

#endif	/* PID_H */

