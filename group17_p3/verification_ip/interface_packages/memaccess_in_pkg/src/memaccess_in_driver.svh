//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class passes transactions between the sequencer
//        and the BFM driver interface.  It accesses the driver BFM 
//        through the bfm handle. This driver
//        passes transactions to the driver BFM through the access
//        task.  
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class memaccess_in_driver   extends uvmf_driver_base #(
                   .CONFIG_T(memaccess_in_configuration   ),
                   .BFM_BIND_T(virtual memaccess_in_driver_bfm   ),
                   .REQ(memaccess_in_transaction   ),
                   .RSP(memaccess_in_transaction   ));

  `uvm_component_utils( memaccess_in_driver )
//*******************************************************************
// Macros that define structs located in memaccess_in_macros.svh
//*******************************************************************
// Initiator macro used by memaccess_in_driver and memaccess_in_driver_bfm
// to communicate initiator driven data to memaccess_in_driver_bfm.           
`memaccess_in_INITIATOR_STRUCT
  memaccess_in_initiator_s memaccess_in_initiator_struct;
//*******************************************************************
// Responder macro used by memaccess_in_driver and memaccess_in_driver_bfm
// to communicate Responder driven data to memaccess_in_driver_bfm.
`memaccess_in_RESPONDER_STRUCT
  memaccess_in_responder_s memaccess_in_responder_struct;

// pragma uvmf custom class_item_additional begin
// pragma uvmf custom class_item_additional end

// ****************************************************************************
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent=null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
// This function sends configuration object variables to the driver BFM 
// using the configuration struct.
//
  virtual function void configure(input CONFIG_T cfg);
      bfm.configure( cfg.to_struct() );
  endfunction

// ****************************************************************************
// This function places a handle to this class in the proxy variable in the
// driver BFM.  This allows the driver BFM to call tasks and function within this class.
//
  virtual function void set_bfm_proxy_handle();
    bfm.proxy = this;  endfunction

// **************************************************************************** 
// This task is called by the run_phase in uvmf_driver_base.              
  virtual task access( inout REQ txn );
// pragma uvmf custom access begin
    if (configuration.initiator_responder==RESPONDER) begin
      // Complete current transfer and wait for next transfer
      bfm.respond_and_wait_for_next_transfer( 
          memaccess_in_initiator_struct, 
          txn.to_responder_struct() 
          );
      // Unpack information about initiated transfer received by this responder
      txn.from_initiator_struct(memaccess_in_initiator_struct);
    end else begin    
      // Initiate a transfer and get response
      `uvm_info("DRV", "Started", UVM_NONE)
      bfm.initiate_and_get_response( 
          txn.to_initiator_struct(), 
          memaccess_in_responder_struct 
          );
      // Unpack transfer response information received by this initiator
      txn.from_responder_struct(memaccess_in_responder_struct);
    end
// pragma uvmf custom access end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

