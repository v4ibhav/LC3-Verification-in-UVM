//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   analysis_export receives transactions of type  memaccess_in_transaction
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  analysis_port broadcasts transactions of type memaccess_out_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class memaccess_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( memaccess_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_analysis_export #(memaccess_in_transaction, memaccess_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) analysis_export;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(memaccess_out_transaction) analysis_port;


  // Transaction variable for predicted values to be sent out analysis_port
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef memaccess_out_transaction analysis_port_output_transaction_t;
  analysis_port_output_transaction_t analysis_port_output_transaction;
  // Code for sending output transaction out through analysis_port
  // analysis_port.write(analysis_port_output_transaction);

  // Define transaction handles for debug visibility 
  memaccess_in_transaction analysis_export_debug;


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    // `uvm_warning("PREDICTOR_REVIEW", "This predictor has been created either through generation or re-generation with merging.  Remove this warning after the predictor has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    analysis_export = new("analysis_export", this);
    analysis_port =new("analysis_port", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_analysis_export
  // Transactions received through analysis_export initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_analysis_export(memaccess_in_transaction t);
    // pragma uvmf custom analysis_export_predictor begin
    bit check_flag;

    analysis_export_debug = t;
    `uvm_info("PRED", "Transaction Received through analysis_export", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    analysis_port_output_transaction = analysis_port_output_transaction_t::type_id::create("analysis_port_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    // `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    // `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The memaccess_predictor::write_analysis_export function needs to be completed with DUT prediction model",UVM_NONE)
    // `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)

    check_flag = mem_access_model(
      .M_Data(t.m_data),
      .M_Addr(t.m_addr),
      .M_Control(t.m_control), 
      .mem_state(t.mem_state), 
      .DMem_dout(t.dmem_dout), 
      .DMem_addr(analysis_port_output_transaction.dmem_addr), 
      .DMem_din(analysis_port_output_transaction.dmem_din), 
      .memout(analysis_port_output_transaction.mem_out), 
      .DMem_rd(analysis_port_output_transaction.dmem_rd)
    );
    //1-Fail, 0_success
    if(check_flag) begin
      `uvm_error("PRED", {"Invalid input trans: ", t.convert2string()})
      `uvm_error("PRED", {"Invalid expected output trans: ", analysis_port_output_transaction.convert2string()})
    end
    

    // Code for sending output transaction out through analysis_port
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    analysis_port.write(analysis_port_output_transaction);
    // pragma uvmf custom analysis_export_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

