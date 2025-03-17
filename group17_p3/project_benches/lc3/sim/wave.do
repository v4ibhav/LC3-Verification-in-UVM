onerror {resume}
add wave -position insertpoint  \
sim:/hdl_top/fetch_In_bus/clock \
sim:/hdl_top/fetch_In_bus/reset \
sim:/hdl_top/fetch_In_bus/br_taken \
sim:/hdl_top/fetch_In_bus/enable_fetch \
sim:/hdl_top/fetch_In_bus/enable_updatePC \
sim:/hdl_top/fetch_In_bus/taddr 
add wave -position insertpoint  \
sim:/hdl_top/fetch_Out_bus/clock \
sim:/hdl_top/fetch_Out_bus/reset \
sim:/hdl_top/fetch_Out_bus/enable_fetch \
sim:/hdl_top/fetch_Out_bus/enable_updatePC\
sim:/hdl_top/fetch_Out_bus/instrmem_rd \
sim:/hdl_top/fetch_Out_bus/npc \
sim:/hdl_top/fetch_Out_bus/pc 
add wave -position insertpoint  \
sim:/hdl_top/decode_In_bus/clock \
sim:/hdl_top/decode_In_bus/reset \
sim:/hdl_top/decode_In_bus/enable_decode \
sim:/hdl_top/decode_In_bus/dout \
sim:/hdl_top/decode_In_bus/npc_in \
sim:/hdl_top/decode_In_bus/psr 
add wave -position insertpoint  \
sim:/hdl_top/decode_Out_bus/clock \
sim:/hdl_top/decode_Out_bus/reset \
sim:/hdl_top/decode_Out_bus/e_control \
sim:/hdl_top/decode_Out_bus/enable_decode_latch \
sim:/hdl_top/decode_Out_bus/ir \
sim:/hdl_top/decode_Out_bus/mem_control \
sim:/hdl_top/decode_Out_bus/npc_out \
sim:/hdl_top/decode_Out_bus/w_control 
add wave -position insertpoint  \
sim:/hdl_top/execute_In_bus/clock \
sim:/hdl_top/execute_In_bus/reset \
sim:/hdl_top/execute_In_bus/enable_execute \
sim:/hdl_top/execute_In_bus/IR \
sim:/hdl_top/execute_In_bus/npc_in \
sim:/hdl_top/execute_In_bus/E_control \
sim:/hdl_top/execute_In_bus/W_Control_in \
sim:/hdl_top/execute_In_bus/Mem_Control_in \
sim:/hdl_top/execute_In_bus/Mem_bypass_val \
sim:/hdl_top/execute_In_bus/bypass_alu_1 \
sim:/hdl_top/execute_In_bus/bypass_alu_2 \
sim:/hdl_top/execute_In_bus/bypass_mem_1 \
sim:/hdl_top/execute_In_bus/bypass_mem_2 \
sim:/hdl_top/execute_In_bus/VSR1 \
sim:/hdl_top/execute_In_bus/VSR2 
add wave -position insertpoint  \
sim:/hdl_top/execute_Out_bus/clock \
sim:/hdl_top/execute_Out_bus/reset \
sim:/hdl_top/execute_Out_bus/aluout \
sim:/hdl_top/execute_Out_bus/dr \
sim:/hdl_top/execute_Out_bus/enable_execute_out \
sim:/hdl_top/execute_Out_bus/IR_Exec \
sim:/hdl_top/execute_Out_bus/M_Data \
sim:/hdl_top/execute_Out_bus/Mem_Control_out \
sim:/hdl_top/execute_Out_bus/NZP \
sim:/hdl_top/execute_Out_bus/pcout \
sim:/hdl_top/execute_Out_bus/sr1 \
sim:/hdl_top/execute_Out_bus/sr2 \
sim:/hdl_top/execute_Out_bus/W_Control_out 
add wave -position insertpoint  \
sim:/hdl_top/writeback_In_bus/clock \
sim:/hdl_top/writeback_In_bus/reset \
sim:/hdl_top/writeback_In_bus/aluout \
sim:/hdl_top/writeback_In_bus/dr \
sim:/hdl_top/writeback_In_bus/enable_writeback \
sim:/hdl_top/writeback_In_bus/memout \
sim:/hdl_top/writeback_In_bus/npc_in \
sim:/hdl_top/writeback_In_bus/pcout \
sim:/hdl_top/writeback_In_bus/sr1 \
sim:/hdl_top/writeback_In_bus/sr2 \
sim:/hdl_top/writeback_In_bus/W_Control_in 
add wave -position insertpoint  \
sim:/hdl_top/writeback_Out_bus/clock \
sim:/hdl_top/writeback_Out_bus/reset \
sim:/hdl_top/writeback_Out_bus/enable_writeback_status \
sim:/hdl_top/writeback_Out_bus/psr \
sim:/hdl_top/writeback_Out_bus/VSR1 \
sim:/hdl_top/writeback_Out_bus/VSR2 
add wave -position insertpoint  \
sim:/hdl_top/memaccess_In_bus/m_data \
sim:/hdl_top/memaccess_In_bus/m_addr \
sim:/hdl_top/memaccess_In_bus/m_control \
sim:/hdl_top/memaccess_In_bus/mem_state \
sim:/hdl_top/memaccess_In_bus/dmem_dout 
add wave -position insertpoint  \
sim:/hdl_top/memaccess_Out_bus/dmem_addr \
sim:/hdl_top/memaccess_Out_bus/dmem_din \
sim:/hdl_top/memaccess_Out_bus/dmem_rd \
sim:/hdl_top/memaccess_Out_bus/mem_out 
add wave -position insertpoint  \
sim:/hdl_top/control_In_bus/clk \
sim:/hdl_top/control_In_bus/rst \
sim:/hdl_top/control_In_bus/complete_data \
sim:/hdl_top/control_In_bus/complete_instr \
sim:/hdl_top/control_In_bus/IR \
sim:/hdl_top/control_In_bus/NZP \
sim:/hdl_top/control_In_bus/IR_Exec \
sim:/hdl_top/control_In_bus/IMem_dout \
sim:/hdl_top/control_In_bus/psr 
add wave -position insertpoint  \
sim:/hdl_top/control_Out_bus/clk \
sim:/hdl_top/control_Out_bus/rst \
sim:/hdl_top/control_Out_bus/br_taken \
sim:/hdl_top/control_Out_bus/bypass_alu_1 \
sim:/hdl_top/control_Out_bus/bypass_alu_2 \
sim:/hdl_top/control_Out_bus/bypass_mem_1 \
sim:/hdl_top/control_Out_bus/bypass_mem_2 \
sim:/hdl_top/control_Out_bus/enable_decode \
sim:/hdl_top/control_Out_bus/enable_execute \
sim:/hdl_top/control_Out_bus/enable_fetch \
sim:/hdl_top/control_Out_bus/enable_updatePC \
sim:/hdl_top/control_Out_bus/enable_writeback \
sim:/hdl_top/control_Out_bus/mem_state 
add wave -position insertpoint  \
sim:/hdl_top/imem_resp_bus/clock \
sim:/hdl_top/imem_resp_bus/reset \
sim:/hdl_top/imem_resp_bus/complete_instr \
sim:/hdl_top/imem_resp_bus/Instr_dout \
sim:/hdl_top/imem_resp_bus/instrmem_rd \
sim:/hdl_top/imem_resp_bus/PC \

