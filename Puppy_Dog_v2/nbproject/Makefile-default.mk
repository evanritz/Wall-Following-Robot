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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Puppy_Dog_v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Puppy_Dog_v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=main.c MtrCtrl.c spi.c util.c DISPLAY.c LEDS.c OPTICAL_SENSOR.c PID_CTRL.c MTR_CTRL.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/MtrCtrl.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/util.o ${OBJECTDIR}/DISPLAY.o ${OBJECTDIR}/LEDS.o ${OBJECTDIR}/OPTICAL_SENSOR.o ${OBJECTDIR}/PID_CTRL.o ${OBJECTDIR}/MTR_CTRL.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/MtrCtrl.o.d ${OBJECTDIR}/spi.o.d ${OBJECTDIR}/util.o.d ${OBJECTDIR}/DISPLAY.o.d ${OBJECTDIR}/LEDS.o.d ${OBJECTDIR}/OPTICAL_SENSOR.o.d ${OBJECTDIR}/PID_CTRL.o.d ${OBJECTDIR}/MTR_CTRL.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/MtrCtrl.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/util.o ${OBJECTDIR}/DISPLAY.o ${OBJECTDIR}/LEDS.o ${OBJECTDIR}/OPTICAL_SENSOR.o ${OBJECTDIR}/PID_CTRL.o ${OBJECTDIR}/MTR_CTRL.o

# Source Files
SOURCEFILES=main.c MtrCtrl.c spi.c util.c DISPLAY.c LEDS.c OPTICAL_SENSOR.c PID_CTRL.c MTR_CTRL.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Puppy_Dog_v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/8ec9deb9533b5e0e4904ead59edc897a9b961df9 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/MtrCtrl.o: MtrCtrl.c  .generated_files/flags/default/4ff69e06cc3860b99dbfc1b47be1cd6f51738b7 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MtrCtrl.o.d 
	@${RM} ${OBJECTDIR}/MtrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/MtrCtrl.o.d" -o ${OBJECTDIR}/MtrCtrl.o MtrCtrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/default/9a3b01b79c3be12be3661576b92dc2fbd81f85e6 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/spi.o.d" -o ${OBJECTDIR}/spi.o spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/util.o: util.c  .generated_files/flags/default/c6e58f821cc679ad0083f5b420924eaa2b9bcef .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/util.o.d" -o ${OBJECTDIR}/util.o util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/DISPLAY.o: DISPLAY.c  .generated_files/flags/default/88edfb89d005b186f57e25d7fc51e1517933be8f .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DISPLAY.o.d 
	@${RM} ${OBJECTDIR}/DISPLAY.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/DISPLAY.o.d" -o ${OBJECTDIR}/DISPLAY.o DISPLAY.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/LEDS.o: LEDS.c  .generated_files/flags/default/8136f4d90d72275bca054b95065e99c40cd24843 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LEDS.o.d 
	@${RM} ${OBJECTDIR}/LEDS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/LEDS.o.d" -o ${OBJECTDIR}/LEDS.o LEDS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/OPTICAL_SENSOR.o: OPTICAL_SENSOR.c  .generated_files/flags/default/21b8104e4cd176b229f6ee1a96af08eb3a9c54e8 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/OPTICAL_SENSOR.o.d 
	@${RM} ${OBJECTDIR}/OPTICAL_SENSOR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/OPTICAL_SENSOR.o.d" -o ${OBJECTDIR}/OPTICAL_SENSOR.o OPTICAL_SENSOR.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/PID_CTRL.o: PID_CTRL.c  .generated_files/flags/default/b733fb26fbcb1caaf46b5543185536c93103de03 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PID_CTRL.o.d 
	@${RM} ${OBJECTDIR}/PID_CTRL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/PID_CTRL.o.d" -o ${OBJECTDIR}/PID_CTRL.o PID_CTRL.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/MTR_CTRL.o: MTR_CTRL.c  .generated_files/flags/default/db07eac549b9b1771f239e5d3d87e49f93436040 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MTR_CTRL.o.d 
	@${RM} ${OBJECTDIR}/MTR_CTRL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/MTR_CTRL.o.d" -o ${OBJECTDIR}/MTR_CTRL.o MTR_CTRL.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/7d0a830533c9115870c30bb2d0accf19960c467f .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/MtrCtrl.o: MtrCtrl.c  .generated_files/flags/default/50d39dfd41a98a3fd062fc6ac2ba7e0fbf1286d2 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MtrCtrl.o.d 
	@${RM} ${OBJECTDIR}/MtrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/MtrCtrl.o.d" -o ${OBJECTDIR}/MtrCtrl.o MtrCtrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/default/2278b588fb61dce4d2c3b324960edbbae58d4530 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/spi.o.d" -o ${OBJECTDIR}/spi.o spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/util.o: util.c  .generated_files/flags/default/80d40ce8c04313968b98f9875c729ec95c82df6 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/util.o.d" -o ${OBJECTDIR}/util.o util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/DISPLAY.o: DISPLAY.c  .generated_files/flags/default/220839a330b0a2643b5065265ed673380549326f .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DISPLAY.o.d 
	@${RM} ${OBJECTDIR}/DISPLAY.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/DISPLAY.o.d" -o ${OBJECTDIR}/DISPLAY.o DISPLAY.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/LEDS.o: LEDS.c  .generated_files/flags/default/e19d920f7fa35c4e13369a3dbd3af0e66c539c1a .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LEDS.o.d 
	@${RM} ${OBJECTDIR}/LEDS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/LEDS.o.d" -o ${OBJECTDIR}/LEDS.o LEDS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/OPTICAL_SENSOR.o: OPTICAL_SENSOR.c  .generated_files/flags/default/28f4f7ff7ee221ffa3e17f21a68347c025720269 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/OPTICAL_SENSOR.o.d 
	@${RM} ${OBJECTDIR}/OPTICAL_SENSOR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/OPTICAL_SENSOR.o.d" -o ${OBJECTDIR}/OPTICAL_SENSOR.o OPTICAL_SENSOR.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/PID_CTRL.o: PID_CTRL.c  .generated_files/flags/default/bd0dcbdcf49f76dc9f4125541c886b2c41ebfde5 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PID_CTRL.o.d 
	@${RM} ${OBJECTDIR}/PID_CTRL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/PID_CTRL.o.d" -o ${OBJECTDIR}/PID_CTRL.o PID_CTRL.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/MTR_CTRL.o: MTR_CTRL.c  .generated_files/flags/default/5e345399a94ac9517d2f9431d2dfdd32900a6074 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MTR_CTRL.o.d 
	@${RM} ${OBJECTDIR}/MTR_CTRL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/MTR_CTRL.o.d" -o ${OBJECTDIR}/MTR_CTRL.o MTR_CTRL.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Puppy_Dog_v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Puppy_Dog_v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/lib",-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/pic32mx/lib",-L".",-Map="${DISTDIR}/workin_v5_cleaning.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Puppy_Dog_v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Puppy_Dog_v1.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/lib",-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/pic32mx/lib",-L".",-Map="${DISTDIR}/workin_v5_cleaning.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Puppy_Dog_v1.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
