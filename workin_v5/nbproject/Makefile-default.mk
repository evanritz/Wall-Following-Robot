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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/workin_v4.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/workin_v4.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=main.c MtrCtrl.c spi.c util.c opt_sensor.c PID.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/MtrCtrl.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/util.o ${OBJECTDIR}/opt_sensor.o ${OBJECTDIR}/PID.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/MtrCtrl.o.d ${OBJECTDIR}/spi.o.d ${OBJECTDIR}/util.o.d ${OBJECTDIR}/opt_sensor.o.d ${OBJECTDIR}/PID.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/MtrCtrl.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/util.o ${OBJECTDIR}/opt_sensor.o ${OBJECTDIR}/PID.o

# Source Files
SOURCEFILES=main.c MtrCtrl.c spi.c util.c opt_sensor.c PID.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/workin_v4.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/a1e30c942ebee11a2548f6664557fcab8906a989 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/MtrCtrl.o: MtrCtrl.c  .generated_files/flags/default/62dfbd44a18bf552c3edd6551fd0ffaa26c55ee2 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MtrCtrl.o.d 
	@${RM} ${OBJECTDIR}/MtrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/MtrCtrl.o.d" -o ${OBJECTDIR}/MtrCtrl.o MtrCtrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/default/8c86ed1c89b65ebac0461dff3df7a585802efc69 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/spi.o.d" -o ${OBJECTDIR}/spi.o spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/util.o: util.c  .generated_files/flags/default/68de879ebb3f7124921e2c7e72ee7828584d68c .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/util.o.d" -o ${OBJECTDIR}/util.o util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/opt_sensor.o: opt_sensor.c  .generated_files/flags/default/e460b4acd0b2751254536d33a7adc23e31fbae23 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/opt_sensor.o.d 
	@${RM} ${OBJECTDIR}/opt_sensor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/opt_sensor.o.d" -o ${OBJECTDIR}/opt_sensor.o opt_sensor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/PID.o: PID.c  .generated_files/flags/default/16468a88e1030a64463faaa5be50cce9f98c1a6e .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PID.o.d 
	@${RM} ${OBJECTDIR}/PID.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/PID.o.d" -o ${OBJECTDIR}/PID.o PID.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/21dde862f29515da97ecf890f7bae92c45f0bf7c .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/MtrCtrl.o: MtrCtrl.c  .generated_files/flags/default/a8adf2f029e55990e8d5a5736363dfd1ec2509df .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MtrCtrl.o.d 
	@${RM} ${OBJECTDIR}/MtrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/MtrCtrl.o.d" -o ${OBJECTDIR}/MtrCtrl.o MtrCtrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/default/94ce3bf30ad6df613d90b1bfea1a6baff26c8bf4 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/spi.o.d" -o ${OBJECTDIR}/spi.o spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/util.o: util.c  .generated_files/flags/default/d383ba440f73039417c8efb36be06eb1ff74948a .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/util.o.d" -o ${OBJECTDIR}/util.o util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/opt_sensor.o: opt_sensor.c  .generated_files/flags/default/ec8da08ff5557912bed0611e802e1329c68b8718 .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/opt_sensor.o.d 
	@${RM} ${OBJECTDIR}/opt_sensor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/opt_sensor.o.d" -o ${OBJECTDIR}/opt_sensor.o opt_sensor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
${OBJECTDIR}/PID.o: PID.c  .generated_files/flags/default/5fc17ba2d5454052aee5e512d2c933d3c978223f .generated_files/flags/default/f2d2849a63ebd9d9bb029b271492fb5470a4c3d1
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PID.o.d 
	@${RM} ${OBJECTDIR}/PID.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -MP -MMD -MF "${OBJECTDIR}/PID.o.d" -o ${OBJECTDIR}/PID.o PID.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/workin_v4.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/workin_v4.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/lib",-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/pic32mx/lib",-L".",-Map="${DISTDIR}/workin_v4.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/workin_v4.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/workin_v4.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/lib",-L"../../../../../../Program Files (x86)/Microchip/MPLAB C32 Suite/pic32mx/lib",-L".",-Map="${DISTDIR}/workin_v4.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/workin_v4.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
