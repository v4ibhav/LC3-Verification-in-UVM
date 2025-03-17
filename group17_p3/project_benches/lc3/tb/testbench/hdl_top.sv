`include "../rtl/verilog/TopLevelLC3.v"
module hdl_top();
   
import uvm_pkg::*;
`include "uvm_macros.svh"
  
  bit clk;
  initial begin
   clk = 0;
   #20ns;
   forever begin
      clk = ~clk;
      #5ns;
   end
  end

  bit rst;
  initial begin
   rst = 1; 
   #50ns;
   rst =  0; 
  end
  
  reg En_execute;
  wire En_execute_ctrl;
  reg En_decode;
  wire En_decode_ctrl;
  reg [1:0] dmem;
  wire [1:0] dmem_ctrl;
  reg En_fetch;
  wire En_fetch_ctrl;
  reg En_updatePC;
  wire En_updatePC_ctrl;
  reg imem;
  wire imem_ctrl;
  
  
  always @(posedge clk)
	begin
		 En_execute<=DUT.enable_execute;
		 dmem <= DUT.mem_state;
		 En_fetch <= DUT.enable_fetch;
		 imem <= DUT.instrmem_rd;
      En_decode <= DUT.enable_decode;
      En_updatePC <= DUT.enable_updatePC;
	end
	
	assign En_execute_ctrl=En_execute;
	assign dmem_ctrl = dmem;
	assign En_fetch_ctrl = En_fetch;
	assign imem_ctrl = imem;
   assign En_decode_ctrl = En_decode;
   assign En_updatePC_ctrl = En_updatePC;
 
  //Connection to interfaces
 
  fetch_in_if  fetch_In_bus(
     .clock(clk), .reset(rst), .enable_fetch(DUT.enable_fetch),.enable_updatePC(DUT.enable_updatePC),.br_taken(DUT.br_taken),.taddr(DUT.taddr)
     );
  fetch_out_if  fetch_Out_bus(
     .clock(clk), .reset(rst), .npc(DUT.npc_out_fetch), .pc(DUT.pc), .instrmem_rd(imem_ctrl), .enable_fetch(En_fetch_ctrl), .enable_updatePC(En_updatePC_ctrl) 
     );
  decode_in_if  decode_In_bus(
     .clock(clk), .reset(rst), .enable_decode(DUT.enable_decode), .dout(DUT.Instr_dout), .npc_in(DUT.npc_out_fetch) , .psr()
     );
  decode_out_if  decode_Out_bus(
     .clock(clk), .reset(rst),  .ir(DUT.IR), .npc_out(DUT.npc_out_dec), .e_control(DUT.E_Control), .w_control(DUT.W_Control), .mem_control(DUT.Mem_Control) , .enable_decode_latch(En_decode_ctrl)
     );
  execute_in_if  execute_In_bus(
     .clock(clk), .reset(rst), .enable_execute(DUT.enable_execute), .IR(DUT.IR), .npc_in(DUT.npc_out_dec), .E_control(DUT.E_Control), .W_Control_in(DUT.W_Control), .Mem_Control_in(DUT.Mem_Control), .Mem_bypass_val(DUT.memout), .VSR1(DUT.VSR1), .VSR2(DUT.VSR2), .bypass_alu_1(DUT.bypass_alu_1), .bypass_alu_2(DUT.bypass_alu_2), .bypass_mem_1(DUT.bypass_mem_1), .bypass_mem_2(DUT.bypass_mem_2)
     );
  execute_out_if  execute_Out_bus(
     .clock(clk), .reset(rst), .enable_execute_out(DUT.enable_execute), .IR_Exec(DUT.IR_Exec), .aluout(DUT.aluout), .W_Control_out(DUT.W_Control_out), .Mem_Control_out(DUT.Mem_Control_out), .pcout(DUT.pcout), .sr1(DUT.sr1), .sr2(DUT.sr2), .dr(DUT.dr), .NZP(DUT.NZP), .M_Data(DUT.M_Data)
     );
  writeback_in_if  writeback_In_bus(
     .clock(clk), .reset(rst), .aluout(DUT.aluout),.W_Control_in(DUT.W_Control), .npc_in(DUT.npc_out_dec), .pcout(DUT.pcout), .memout(DUT.memout), .enable_writeback(DUT.enable_writeback), .sr1(DUT.sr1), .sr2(DUT.sr2), .dr(DUT.dr)
     );
  writeback_out_if  writeback_Out_bus(
     .clock(clk), .reset(rst), .VSR1(DUT.VSR1), .VSR2(DUT.VSR2), .psr(DUT.psr), .enable_writeback_status(DUT.enable_writeback)
     );
  memaccess_in_if  memaccess_In_bus(
     .clock(clk), .reset(rst), .m_data(DUT.M_Data), .m_addr(DUT.pcout), .m_control(DUT.Mem_Control_out), .mem_state(DUT.mem_state), .dmem_dout(DUT.Data_dout)
     );
  memaccess_out_if  memaccess_Out_bus(
     .clock(clk), .reset(rst), .dmem_addr(DUT.Data_addr), .dmem_din(DUT.Data_din), .mem_out(DUT.memout), .dmem_rd(DUT.Data_rd)
     );
  control_in_if  control_In_bus(
     .clk(clk), .rst(rst),  .complete_data(DUT.complete_data), .complete_instr(DUT.complete_instr), .IR(DUT.IR), .NZP(DUT.NZP), .psr(DUT.psr), .IR_Exec(DUT.IR_Exec),.IMem_dout(DUT.Instr_dout)
     );
  control_out_if  control_Out_bus(
     .clk(clk), .rst(rst), .enable_updatePC(DUT.enable_updatePC), .enable_fetch(DUT.enable_fetch),  .enable_decode(DUT.enable_decode), .enable_execute(DUT.enable_execute), .enable_writeback(DUT.enable_writeback),  .br_taken(DUT.br_taken),.bypass_alu_1(DUT.bypass_alu_1), .bypass_alu_2(DUT.bypass_alu_2), .bypass_mem_1(DUT.bypass_mem_1), .bypass_mem_2(DUT.bypass_mem_2), .mem_state(DUT.mem_state)
     );
  imem_if  imem_resp_bus(
     .clock(clk), .reset(rst), . complete_instr(DUT.complete_instr), .Instr_dout(DUT.Instr_dout), .PC(DUT.pc), .instrmem_rd(DUT.instrmem_rd)
     );
  dmem_if  dmem_resp_bus(
     .clock(clk), .reset(rst), .complete_data(DUT.complete_data) , .data_dout(DUT.Data_dout) , .data_din(DUT.Data_din) , .data_addr(DUT.Data_addr) , .data_rd(DUT.Data_rd)
     );

   //Instantiation of BFM

  fetch_in_monitor_bfm  fetch_In_mon_bfm(fetch_In_bus);
  fetch_out_monitor_bfm  fetch_Out_mon_bfm(fetch_Out_bus);
  decode_in_monitor_bfm  decode_In_mon_bfm(decode_In_bus);
  decode_out_monitor_bfm  decode_Out_mon_bfm(decode_Out_bus);
  execute_in_monitor_bfm  execute_In_mon_bfm(execute_In_bus);
  execute_out_monitor_bfm  execute_Out_mon_bfm(execute_Out_bus);
  writeback_in_monitor_bfm  writeback_In_mon_bfm(writeback_In_bus);
  writeback_out_monitor_bfm  writeback_Out_mon_bfm(writeback_Out_bus);
  memaccess_in_monitor_bfm  memaccess_In_mon_bfm(memaccess_In_bus);
  memaccess_out_monitor_bfm  memaccess_Out_mon_bfm(memaccess_Out_bus);
  control_in_monitor_bfm  control_In_mon_bfm(control_In_bus);
  control_out_monitor_bfm  control_Out_mon_bfm(control_Out_bus);
  imem_monitor_bfm  imem_agent_mon_bfm(imem_resp_bus.monitor_port);
  dmem_monitor_bfm  dmem_agent_mon_bfm(dmem_resp_bus.monitor_port);
  imem_driver_bfm  imem_agent_drv_bfm(imem_resp_bus.responder_port);
  dmem_driver_bfm  dmem_agent_drv_bfm(dmem_resp_bus.responder_port);

  

  initial begin       
   uvm_config_db #( virtual fetch_in_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "fetch_env_in_agent_BFM" , fetch_In_mon_bfm ); 
   uvm_config_db #( virtual fetch_out_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "fetch_env_out_agent_BFM" , fetch_Out_mon_bfm ); 
   uvm_config_db #( virtual decode_in_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "decode_env_in_agent_BFM" , decode_In_mon_bfm ); 
   uvm_config_db #( virtual decode_out_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "decode_env_out_agent_BFM" , decode_Out_mon_bfm ); 
   uvm_config_db #( virtual execute_in_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "execute_env_in_agent_BFM" , execute_In_mon_bfm ); 
   uvm_config_db #( virtual execute_out_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "execute_env_out_agent_BFM" , execute_Out_mon_bfm ); 
   uvm_config_db #( virtual writeback_in_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "writeback_env_in_agent_BFM" , writeback_In_mon_bfm ); 
   uvm_config_db #( virtual writeback_out_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "writeback_env_out_agent_BFM" , writeback_Out_mon_bfm ); 
   uvm_config_db #( virtual memaccess_in_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "memaccess_env_in_agent_BFM" , memaccess_In_mon_bfm ); 
   uvm_config_db #( virtual memaccess_out_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "memaccess_env_out_agent_BFM" , memaccess_Out_mon_bfm ); 
   uvm_config_db #( virtual control_in_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "control_env_in_agent_BFM" , control_In_mon_bfm ); 
   uvm_config_db #( virtual control_out_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "control_env_out_agent_BFM" , control_Out_mon_bfm ); 
   uvm_config_db #( virtual imem_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "imem_agent_BFM" , imem_agent_mon_bfm ); 
   uvm_config_db #( virtual dmem_monitor_bfm  )::set( null , "VIRTUAL_INTERFACES" , "dmem_agent_BFM" , dmem_agent_mon_bfm ); 
   uvm_config_db #( virtual imem_driver_bfm  )::set( null , "VIRTUAL_INTERFACES" , "imem_agent_BFM" , imem_agent_drv_bfm  );
   uvm_config_db #( virtual dmem_driver_bfm  )::set( null , "VIRTUAL_INTERFACES" , "dmem_agent_BFM" , dmem_agent_drv_bfm  );
  end
  
  LC3 DUT (	.clock(clk), .reset(rst), .pc(imem_resp_bus.PC) , .instrmem_rd(imem_resp_bus.instrmem_rd), .Instr_dout(imem_resp_bus.Instr_dout), .Data_addr(dmem_resp_bus.data_addr), .complete_instr(imem_resp_bus.complete_instr), .complete_data(dmem_resp_bus.complete_data),  
				.Data_din(dmem_resp_bus.data_din), .Data_dout(dmem_resp_bus.data_dout), .Data_rd(dmem_resp_bus.data_rd)	
			);

    

endmodule 
     
    

