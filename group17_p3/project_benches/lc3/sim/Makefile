
#
#----------------------------------------------------------------------
# Project         :  LC3 Simulation Bench 
# Unit            : Bench makefile
# File            : Makefile
#----------------------------------------------------------------------
#                                          
# DESCRIPTION: This makefile includes the shared makefile and contains
#   bench level make targets.
#


# *********************************************************************************************
# UVMF library directory:
# This variable points to the UVMF release where uvmf_base_pkg directory resides.
# This variable points to release code that is not user modified.
# This variable allows for UVMF release directories to reside independent of project related verification_ip and project_benches directories.
# This code below looks "upward" for directory starting with UVMF_* and returns first match for use with the release examples.
export UVMF_HOME ?= ../../../UVMF_2023.3
#
# Project(s) specific verification_ip library:
# Directory where reusable verification packages for interfaces, environments, utilities, etc. reside.
# This variable allows for verification_ip to reside independent of project bench and UVMF release directories.
# For examples deployed with UVMF this will be $(UVMF_HOME)/<example_group>/verification_ip
# export UVMF_VIP_LIBRARY_HOME ?= ../../../verification_ip
export UVMF_VIP_LIBRARY_HOME ?= $(PWD)/../../../verification_ip
#
# Project specific bench:
# Directory where bench specific code is located.
# This variable allows for project_benches to reside independent of verification_ip and UVMF release directories.
# For examples deployed with UVMF this will be $(UVMF_HOME)/<example_group>/project_benches/<example_bench>
# export UVMF_PROJECT_DIR ?= ../../../project_benches/decode
export UVMF_PROJECT_DIR ?= $(PWD)/..
#
#
# *********************************************************************************************

## Check PATH for required vinfo scripts
PVAL := $(shell command -v make_filelist.py 2> /dev/null)
ifndef PVAL
  MFLIST = $(UVMF_HOME)/scripts/make_filelist.py
else
  MFLIST = make_filelist.py
endif

# Set test case specific Variables
TEST_NAME            ?= test_top

TEST_SEED            ?= random  
UVM_CLI_ARGS         = +UVM_VERBOSITY=UVM_MEDIUM

# Usage of Veloce, etc. to be input by the user (subject to defaults)
USE_VELOCE          ?= 0

# Usage of vinfo flow for generating file list
USE_VINFO           ?= 0

# Usage of Veloce and Questa profilers
USE_VELOCE_PROFILER ?= 0
USE_QUESTA_PROFILER ?= 0
CODE_COVERAGE_ENABLE ?=1


# Set project Variables
TEST_PLAN_NAME       = LC3_test_plan
REPORTING_DO_FILE    = LC3_reports_script

# Include makefile that includes targets for UVM_VIP_Library packages
include $(UVMF_HOME)/scripts/Makefile


# Include all requisite interface package targets for this bench
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/fetch_in_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/fetch_out_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/environment_packages/lc3_prediction_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/decode_in_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/decode_out_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/execute_in_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/execute_out_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/writeback_in_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/writeback_out_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/memaccess_in_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/memaccess_out_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/control_in_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/control_out_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/imem_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/interface_packages/dmem_pkg/Makefile
include $(UVMF_VIP_LIBRARY_HOME)/environment_packages/lc3_env_pkg/Makefile

# Include all requisite environment package targets for this bench

# Add to default compile/load/run arguments
VCOM_ARGS             += 

# Note: vsim-3009 error can be eliminated by adding -timescale 1ps/1ps to VLOG_ARGS
VLOG_ARGS             += +define+UVM_REPORT_DISABLE_FILE_LINE
VELANALYZE_ARGS       +=
VELANALYZE_HVL_ARGS   +=

BATCH_VOPT_ARGS       +=
DEBUG_VOPT_ARGS       +=
EXTRA_VOPT_TOPS       +=

COMMON_VSIM_ARGS      +=  
COMMON_VSIM_ARGS      +=  


BATCH_VSIM_ARGS       += #-uvmlc3=none
DEBUG_VSIM_ARGS       += 
EXTRA_VSIM_TOPS       += 

lc3_TEST_PKG =\
$(UVMF_PROJECT_DIR)/tb/tests/lc3_test_pkg.sv

lc3_PARAMETERS_PKG =\
$(UVMF_PROJECT_DIR)/tb/parameters/lc3_parameters_pkg.sv

lc3_SEQUENCE_PKG =\
$(UVMF_PROJECT_DIR)/tb/sequences/lc3_sequences_pkg.sv

lc3_VERILOG_DUT =\
$(UVMF_PROJECT_DIR)/rtl/verilog/*.v

comp_lc3_tests_pkg:
	$(HVL_COMP_CMD) +incdir+$(UVMF_PROJECT_DIR)/tb/tests $(lc3_TEST_PKG)

comp_lc3_parameters_pkg:
	$(HVL_COMP_CMD) +incdir+$(UVMF_PROJECT_DIR)/tb/sequences $(lc3_PARAMETERS_PKG)

comp_lc3_sequence_pkg:
	$(HVL_COMP_CMD) +incdir+$(UVMF_PROJECT_DIR)/tb/sequences $(lc3_SEQUENCE_PKG)

comp_lc3_dut: 
	$(HDL_COMP_CMD) +incdir+$(UVMF_PROJECT_DIR)/rtl/verilog $(lc3_VERILOG_DUT)

comp_hvl : comp_hvl_core

comp_hvl_core :   \
	comp_fetch_in_pkg \
	comp_fetch_out_pkg \
	comp_decode_in_pkg \
	comp_decode_out_pkg \
	comp_execute_in_pkg \
	comp_execute_out_pkg \
	comp_writeback_in_pkg \
	comp_writeback_out_pkg \
	comp_memaccess_in_pkg \
	comp_memaccess_out_pkg \
	comp_control_in_pkg \
	comp_control_out_pkg \
	comp_imem_pkg \
	comp_dmem_pkg  \
	comp_lc3_prediction_pkg \
	comp_lc3_env_pkg \
	comp_lc3_parameters_pkg \
	comp_lc3_sequence_pkg \
	comp_lc3_tests_pkg 	

comp_uvmf_core : comp_uvm_pkg comp_fli_pkg comp_uvmf_base_pkg 

build: comp_lc3_dut comp_uvmf_core comp_hvl comp_test_bench  

merge_coverage:
	xml2ucdb -format Excel ./LC3_test_plan.xml ./lc3_test_plan.ucdb
	vcover merge -stats=none -strip 0 -totals lc3_test_plan_merged.ucdb *.ucdb

coverage_results:
	vsim -viewcov ./lc3_test_plan_merged.ucdb

regress:
	./regress.sh

regress_with_transcript:
	./regress_with_transcript.sh
	
coverage_report:
	vcover report -details -html -output covhtmlreport -assert -directive -cvg -code bcfs -threshL 50 -threshH 90 lc3_test_plan_merged.ucdb
