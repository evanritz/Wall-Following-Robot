#include "PID.h"

void IC2_PID(int toggle){
   static float prev_err = 0;
    static float ei = 0;
    
    if (toggle && (ic2TimeDataIdx > 1))
    {
        float curr = ic2TimeData[ic2TimeDataIdx-1];
        float prev = ic2TimeData[ic2TimeDataIdx-2];
        
        float time = curr - prev;
        
        if (time < 0)
            time += 65000;
       
        // Grab most recent value
        // and convert to secs
        // The value is orig mirco seconds
        float secs = time * 0.000001;
        // using time find speed
        // X pulse * 1 rev / 137 pulse * 0.75 ft / 1 rev = 0.00547445255*X ft
        // speed = dist/time => ft/s
        IC2_speed = 0.00547445255/secs;
        
        // find err between curr and target
        float err = IC2_targetSpeed - IC2_speed; 
        
        // (dx) find diff between curr err and prev err
        float ed = err - prev_err;
        
        // (intx) sum err over time
        ei += ki * err;
        
        // bound ei
        if (ei > MAX_MIN_EI)
            ei = MAX_MIN_EI;
        else if (ei < -MAX_MIN_EI)
            ei = -MAX_MIN_EI;
        
        // calculate pid 
        IC2_pid = err * kp + ei + ed * kd;
         
        // store curr err in prev err
        prev_err = err;
        
        
        if (IC2_pid > OC_MAX_DUTY_CYCLE)
            IC2_pid = OC_MAX_DUTY_CYCLE;
        else if (IC2_pid < OC_MIN_DUTY_CYCLE)
            IC2_pid = OC_MIN_DUTY_CYCLE;
        
        OC2R = (uint32_t) IC2_pid;
        OC2RS = (uint32_t) IC2_pid;
        
    }
    else if (!toggle){
        OC2R = 0;
        OC2RS = 0;
    }
}

void IC3_PID(int toggle){
   static float prev_err = 0;
    static float ei = 0;
    
    if (toggle && (ic3TimeDataIdx > 1))
    {
        float curr = ic3TimeData[ic3TimeDataIdx-1];
        float prev = ic3TimeData[ic3TimeDataIdx-2];
        
        float time = curr - prev;
        
        if (time < 0)
            time += 65000;
       
        // Grab most recent value
        // and convert to secs
        // The value is orig mirco seconds
        float secs = time * 0.000001;
        // using time find speed
        // X pulse * 1 rev / 137 pulse * 0.75 ft / 1 rev = 0.00547445255*X ft
        // speed = dist/time => ft/s
        IC3_speed = 0.00547445255/secs;
        
        // find err between curr and target
        float err = IC3_targetSpeed - IC3_speed; 
        
        // (dx) find diff between curr err and prev err
        float ed = err - prev_err;
        
        // (intx) sum err over time
        ei += ki * err;
        
        // bound ei
        if (ei > MAX_MIN_EI)
            ei = MAX_MIN_EI;
        else if (ei < -MAX_MIN_EI)
            ei = -MAX_MIN_EI;
        
        // calculate pid 
        IC3_pid = err * kp + ei + ed * kd;
         
        // store curr err in prev err
        prev_err = err;
        
        
        if (IC3_pid > OC_MAX_DUTY_CYCLE)
            IC3_pid = OC_MAX_DUTY_CYCLE;
        else if (IC3_pid < OC_MIN_DUTY_CYCLE)
            IC3_pid = OC_MIN_DUTY_CYCLE;
        
        OC3R = (uint16_t) IC3_pid;
        OC3RS = (uint16_t) IC3_pid;
        
    }
    else if (!toggle){
        OC3R = 0;
        OC3RS = 0;
    }  
}
