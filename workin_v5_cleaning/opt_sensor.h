#ifndef OPT_SENSOR_H
#define	OPT_SENSOR_H

#include <plib.h>
#include "stdtypes.h"
#include "config.h"
#include "MtrCtrl.h"
#include "util.h"
#include <math.h>

void get_ADC_val(void);
float get_opt0_distance(void);
float get_opt1_distance(void);
float get_opt2_distance(void);

#endif	/* OPT_SENSOR_H */

