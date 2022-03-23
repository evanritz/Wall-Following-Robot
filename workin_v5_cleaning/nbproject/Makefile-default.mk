#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/workin_v5.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/workin_v5.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main.c MtrCtrl.c spi.c util.c ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/PID.c ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/opt_sensor.c ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/LEDS.c DISPLAY.c OPTICAL_SENSOR.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/MtrCtrl.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/util.o ${OBJECTDIR}/_ext/1605434052/PID.o ${OBJECTDIR}/_ext/1605434052/opt_sensor.o ${OBJECTDIR}/_ext/1605434052/LEDS.o ${OBJECTDIR}/DISPLAY.o ${OBJECTDIR}/OPTICAL_SENSOR.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/MtrCtrl.o.d ${OBJECTDIR}/spi.o.d ${OBJECTDIR}/util.o.d ${OBJECTDIR}/_ext/1605434052/PID.o.d ${OBJECTDIR}/_ext/1605434052/opt_sensor.o.d ${OBJECTDIR}/_ext/1605434052/LEDS.o.d ${OBJECTDIR}/DISPLAY.o.d ${OBJECTDIR}/OPTICAL_SENSOR.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/MtrCtrl.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/util.o ${OBJECTDIR}/_ext/1605434052/PID.o ${OBJECTDIR}/_ext/1605434052/opt_sensor.o ${OBJECTDIR}/_ext/1605434052/LEDS.o ${OBJECTDIR}/DISPLAY.o ${OBJECTDIR}/OPTICAL_SENSOR.o

# Source Files
SOURCEFILES=main.c MtrCtrl.c spi.c util.c ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/PID.c ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/opt_sensor.c ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/LEDS.c DISPLAY.c OPTICAL_SENSOR.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/workin_v5.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX460F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/8ce7feeea660730b80815ae9b63944dfcc6ae43 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/MtrCtrl.o: MtrCtrl.c  .generated_files/flags/default/2b1c0a6d6a998b7a7004959ecea93294f9925b9d .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MtrCtrl.o.d 
	@${RM} ${OBJECTDIR}/MtrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/MtrCtrl.o.d" -o ${OBJECTDIR}/MtrCtrl.o MtrCtrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/default/dfd58a523384b567f278ea2f4a808a5e9febbd3f .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/spi.o.d" -o ${OBJECTDIR}/spi.o spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/util.o: util.c  .generated_files/flags/default/f7599e3157cc7f35b85550495342f07e4550f815 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/util.o.d" -o ${OBJECTDIR}/util.o util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1605434052/PID.o: ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/PID.c  .generated_files/flags/default/2d6c142ddcb62e09fa2f5be8e2e0c1316435abde .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}/_ext/1605434052" 
	@${RM} ${OBJECTDIR}/_ext/1605434052/PID.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605434052/PID.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1605434052/PID.o.d" -o ${OBJECTDIR}/_ext/1605434052/PID.o ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/PID.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1605434052/opt_sensor.o: ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/opt_sensor.c  .generated_files/flags/default/c0a8778e238ac3637bc3a613cc4357e7462a1d72 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}/_ext/1605434052" 
	@${RM} ${OBJECTDIR}/_ext/1605434052/opt_sensor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605434052/opt_sensor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1605434052/opt_sensor.o.d" -o ${OBJECTDIR}/_ext/1605434052/opt_sensor.o ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/opt_sensor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1605434052/LEDS.o: ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/LEDS.c  .generated_files/flags/default/f4658f3d7d7dfae4457ec94c033319b3f2b537a2 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}/_ext/1605434052" 
	@${RM} ${OBJECTDIR}/_ext/1605434052/LEDS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605434052/LEDS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1605434052/LEDS.o.d" -o ${OBJECTDIR}/_ext/1605434052/LEDS.o ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/LEDS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/DISPLAY.o: DISPLAY.c  .generated_files/flags/default/ceffbf8b4eb9fbf80861ac20af5190dabddab97c .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DISPLAY.o.d 
	@${RM} ${OBJECTDIR}/DISPLAY.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/DISPLAY.o.d" -o ${OBJECTDIR}/DISPLAY.o DISPLAY.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/OPTICAL_SENSOR.o: OPTICAL_SENSOR.c  .generated_files/flags/default/b9356882abd612afde14be8d42898418968a228b .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/OPTICAL_SENSOR.o.d 
	@${RM} ${OBJECTDIR}/OPTICAL_SENSOR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/OPTICAL_SENSOR.o.d" -o ${OBJECTDIR}/OPTICAL_SENSOR.o OPTICAL_SENSOR.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/b2b65704bf770347ac5688d6cf78e9d1688b3129 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/MtrCtrl.o: MtrCtrl.c  .generated_files/flags/default/9db059dbe0fdb398935f0c771e71f687640af93b .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MtrCtrl.o.d 
	@${RM} ${OBJECTDIR}/MtrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/MtrCtrl.o.d" -o ${OBJECTDIR}/MtrCtrl.o MtrCtrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/default/57eb5bbb5925905c136ecd3df12f6af41dd81d5f .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/spi.o.d" -o ${OBJECTDIR}/spi.o spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/util.o: util.c  .generated_files/flags/default/775edc31b713be4e2420b70647980066d70957e7 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/util.o.d" -o ${OBJECTDIR}/util.o util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1605434052/PID.o: ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/PID.c  .generated_files/flags/default/f0d546bc77583307b2476718cc9b00487500aa28 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}/_ext/1605434052" 
	@${RM} ${OBJECTDIR}/_ext/1605434052/PID.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605434052/PID.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1605434052/PID.o.d" -o ${OBJECTDIR}/_ext/1605434052/PID.o ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/PID.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1605434052/opt_sensor.o: ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/opt_sensor.c  .generated_files/flags/default/85c770c24203e3d0d53d06400464a18f5c3acc67 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}/_ext/1605434052" 
	@${RM} ${OBJECTDIR}/_ext/1605434052/opt_sensor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605434052/opt_sensor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1605434052/opt_sensor.o.d" -o ${OBJECTDIR}/_ext/1605434052/opt_sensor.o ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/opt_sensor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1605434052/LEDS.o: ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/LEDS.c  .generated_files/flags/default/46de9678f03920668e94f55863fe9f6b0d7b1940 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}/_ext/1605434052" 
	@${RM} ${OBJECTDIR}/_ext/1605434052/LEDS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605434052/LEDS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1605434052/LEDS.o.d" -o ${OBJECTDIR}/_ext/1605434052/LEDS.o ../../../../Downloads/Wall-Following-Robot-main/Wall-Following-Robot-main/workin_v5/LEDS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/DISPLAY.o: DISPLAY.c  .generated_files/flags/default/64bd60fd2bcc6892f8c6970436eaac8b97e65a5 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DISPLAY.o.d 
	@${RM} ${OBJECTDIR}/DISPLAY.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/DISPLAY.o.d" -o ${OBJECTDIR}/DISPLAY.o DISPLAY.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/OPTICAL_SENSOR.o: OPTICAL_SENSOR.c  .generated_files/flags/default/43c67b45d7ba56f19e6aec285fb2c6c82cf5595c .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/OPTICAL_SENSOR.o.d 
	@${RM} ${OBJECTDIR}/OPTICAL_SENSOR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/OPTICAL_SENSOR.o.d" -o ${OBJECTDIR}/OPTICAL_SENSOR.o OPTICAL_SENSOR.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/workin_v5.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/workin_v5.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/lib",-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/pic32mx/lib",-L".",-Map="${DISTDIR}/workin_v5.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/workin_v5.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/workin_v5.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/lib",-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/pic32mx/lib",-L".",-Map="${DISTDIR}/workin_v5.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/workin_v5.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
