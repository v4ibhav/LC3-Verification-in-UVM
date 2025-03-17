//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the control_in interface signals.
//      It is instantiated once per control_in bus.  Bus Functional Models, 
//      BFM's named control_in_driver_bfm, are used to drive signals on the bus.
//      BFM's named control_in_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(control_in_bus.complete_data), // Agent output 
// .dut_signal_port(control_in_bus.complete_instr), // Agent output 
// .dut_signal_port(control_in_bus.IR), // Agent output 
// .dut_signal_port(control_in_bus.NZP), // Agent output 
// .dut_signal_port(control_in_bus.psr), // Agent output 
// .dut_signal_port(control_in_bus.IR_Exec), // Agent output 
// .dut_signal_port(control_in_bus.IMem_dout), // Agent output 

import uvmf_base_pkg_hdl::*;
import control_in_pkg_hdl::*;

interface  control_in_if 

  (
  input tri clk, 
  input tri rst,
  inout tri  complete_data,
  inout tri  complete_instr,
  inout tri [15:0] IR,
  inout tri [2:0] NZP,
  inout tri [2:0] psr,
  inout tri [15:0] IR_Exec,
  inout tri [15:0] IMem_dout
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input complete_data,
  input complete_instr,
  input IR,
  input NZP,
  input psr,
  input IR_Exec,
  input IMem_dout
  );

modport initiator_port 
  (
  input clk,
  input rst,
  output complete_data,
  output complete_instr,
  output IR,
  output NZP,
  output psr,
  output IR_Exec,
  output IMem_dout
  );

modport responder_port 
  (
  input clk,
  input rst,  
  input complete_data,
  input complete_instr,
  input IR,
  input NZP,
  input psr,
  input IR_Exec,
  input IMem_dout
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

