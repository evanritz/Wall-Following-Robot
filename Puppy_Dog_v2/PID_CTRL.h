/* 
 * File:   PID_CTRL.h
 * Author: s224lab
 *
 * Created on March 24, 2022, 5:47 PM
 */

#ifndef PID_CTRL_H
#define	PID_CTRL_H

#include <stdint.h>

#define PULSE_PER_REV 137 
#define WHEEL_CIRC 0.75f // ft
#define DIST (float) (WHEEL_CIRC/PULSE_PER_REV)

#define MAX_DUTY_CYCLE 10000
#define MIN_DUTY_CYCLE 2000

typedef struct PID {
    volatile int* OCXR;
    volatile int* OCXRS;
    float kp, kd, ki;
    float imin, imax;
    float err, prev_err, ed, ei;
    uint16_t IC_curr, IC_prev, IC_update, IC_new, isStopped;
    float curr_speed, target_speed, pid_val;
} pid_i;

pid_i PID_INIT(volatile int*, volatile int*, float, float, float, float, float, float);
void PID_UPDATE(pid_i*);
void IC_UPDATE(pid_i*, uint16_t);
void PWM_UPDATE(pid_i*);

void PWM_STOP(pid_i*);
void PWM_START(pid_i*);

#endif	/* PID_CTRL_H */

