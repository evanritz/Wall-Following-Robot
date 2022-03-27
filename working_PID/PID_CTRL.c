#include "PID_CTRL.h"

#include <stdint.h>
#include <plib.h>

pid_i PID_INIT(volatile int *OCXR, volatile int *OCXRS, float kp, float kd, float ki, float imax, float imin, float target_speed) {
    pid_i pid;
    pid.OCXR = OCXR;
    pid.OCXRS = OCXRS;
    pid.kp = kp;
    pid.kd = kd;
    pid.ki = ki;
    pid.imax = imax;
    pid.imin = imin;
    pid.target_speed = target_speed;
    
    pid.curr_speed = 0;
    
    pid.IC_curr = 0;
    pid.IC_prev = 0;
    pid.IC_new = 0;
    pid.IC_update = 0;
    pid.prev_err = 0;
    
    pid.ed = 0;
    pid.ei = 0;
    pid.err = 0;
    
    return pid;
}

void IC_UPDATE(pid_i* pid, uint16_t data) {
    // store data in new and raise update flag
    pid->IC_new = data;
    pid->IC_update = 1;
}

void PID_UPDATE(pid_i* pid) {
    
    // lower update flag
    pid->IC_update = 0;
    
    // store prev curr data in prev 
    pid->IC_prev = pid->IC_curr;
    // store new data in curr
    pid->IC_curr = pid->IC_new;
    
   
    float IC_time = pid->IC_curr - pid->IC_prev;
    
    if (IC_time < 0)
        IC_time += 65000;
    
    float secs = IC_time * 0.000001;
    
    pid->curr_speed = DIST/secs;
  
    pid->err = pid->target_speed - pid->curr_speed;
    
    pid->ed = pid->err - pid->prev_err;
    
    pid->ei += pid->ki * pid->err;
    
    if (pid->ei > pid->imax)
        pid->ei = pid->imax;
    else if (pid->ei < pid->imin)
        pid->ei = pid->imin;
    
    pid->pid_val = pid->err * pid->kp + pid->ei + pid->ed * pid->kd;
    
    if (pid->pid_val > MAX_DUTY_CYCLE)
        pid->pid_val = MAX_DUTY_CYCLE;
    else if (pid->pid_val < MIN_DUTY_CYCLE)
        pid->pid_val = MIN_DUTY_CYCLE;
    
    pid->prev_err = pid->err;
    
}

void PWM_UPDATE(pid_i* pid) {
    // deref pointers to OCXR regs and set with pwm pid val
    volatile int* OCXR = pid->OCXR;
    volatile int* OCXRS = pid->OCXRS;
    uint32_t pwm = (uint32_t) pid->pid_val;
    *OCXR = pwm;
    *OCXRS = pwm;
}
