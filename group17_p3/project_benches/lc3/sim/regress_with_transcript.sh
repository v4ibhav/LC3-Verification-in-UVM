make clean
make cli TEST_SEED=1 TEST_NAME=alu_add_test CODE_COVERAGE_ENABLE=1 > transcript_alu_add_test.txt
make run_cli TEST_SEED=2 TEST_NAME=alu_and_test CODE_COVERAGE_ENABLE=1 > transcript_alu_and_test.txt
make run_cli TEST_SEED=3 TEST_NAME=alu_not_test CODE_COVERAGE_ENABLE=1 > transcript_alu_not_test.txt
make run_cli TEST_SEED=4 TEST_NAME=alu_test CODE_COVERAGE_ENABLE=1 > transcript_alu_test.txt
make run_cli TEST_SEED=5 TEST_NAME=ctrl_br_test CODE_COVERAGE_ENABLE=1 > transcript_ctrl_br_test.txt
make run_cli TEST_SEED=6 TEST_NAME=ctrl_jmp_test CODE_COVERAGE_ENABLE=1 > transcript_ctrl_jmp_test.txt
make run_cli TEST_SEED=7 TEST_NAME=ctrl_test CODE_COVERAGE_ENABLE=1 > transcript_ctrl_test.txt
make run_cli TEST_SEED=8 TEST_NAME=mem_ld_test CODE_COVERAGE_ENABLE=1 > transcript_mem_ld_test.txt
make run_cli TEST_SEED=9 TEST_NAME=mem_ldi_test CODE_COVERAGE_ENABLE=1 > transcript_mem_ldi_test.txt
make run_cli TEST_SEED=10 TEST_NAME=mem_ldr_test CODE_COVERAGE_ENABLE=1 > transcript_mem_ldr_test.txt
make run_cli TEST_SEED=11 TEST_NAME=mem_lea_test CODE_COVERAGE_ENABLE=1 > transcript_mem_lea_test.txt
make run_cli TEST_SEED=13 TEST_NAME=mem_sti_test CODE_COVERAGE_ENABLE=1 > transcript_mem_sti_test.txt
make run_cli TEST_SEED=14 TEST_NAME=mem_str_test CODE_COVERAGE_ENABLE=1 > transcript_mem_str_test.txt
make run_cli TEST_SEED=15 TEST_NAME=mem_test CODE_COVERAGE_ENABLE=1 > transcript_mem_test.txt
make run_cli TEST_SEED=12 TEST_NAME=mem_st_test CODE_COVERAGE_ENABLE=1 > transcript_mem_st_test.txt
make merge_coverage
make coverage_report
make coverage_results

