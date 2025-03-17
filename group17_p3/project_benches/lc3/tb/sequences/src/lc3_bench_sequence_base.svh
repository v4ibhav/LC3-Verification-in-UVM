//----------------------------------------------------------------------
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// Description: This file contains the top level and utility sequences
//     used by test_top. It can be extended to create derivative top
//     level sequences.
//
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//

class lc3_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( lc3_bench_sequence_base );

  // pragma uvmf custom sequences begin
  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef imem_responder_sequence  imem_agent_responder_seq_t;
  imem_agent_responder_seq_t imem_agent_responder_seq;
  typedef dmem_responder_sequence  dmem_agent_responder_seq_t;
  dmem_agent_responder_seq_t dmem_agent_responder_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef imem_transaction  imem_agent_transaction_t;
  uvm_sequencer #(imem_agent_transaction_t)  imem_agent_sequencer; 
  typedef dmem_transaction  dmem_agent_transaction_t;
  uvm_sequencer #(dmem_agent_transaction_t)  dmem_agent_sequencer; 


  // Top level environment configuration handle
  typedef lc3_env_configuration  lc3_env_configuration_t;
  lc3_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  fetch_in_configuration  fetch_env_in_agent_config;
  fetch_out_configuration  fetch_env_out_agent_config;
  decode_in_configuration  decode_env_in_agent_config;
  decode_out_configuration  decode_env_out_agent_config;
  execute_in_configuration  execute_env_in_agent_config;
  execute_out_configuration  execute_env_out_agent_config;
  writeback_in_configuration  writeback_env_in_agent_config;
  writeback_out_configuration  writeback_env_out_agent_config;
  memaccess_in_configuration  memaccess_env_in_agent_config;
  memaccess_out_configuration  memaccess_env_out_agent_config;
  control_in_configuration  control_env_in_agent_config;
  control_out_configuration  control_env_out_agent_config;
  imem_configuration  imem_agent_config;
  dmem_configuration  dmem_agent_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(lc3_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(lc3_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( fetch_in_configuration )::get( null , UVMF_CONFIGURATIONS , fetch_env_in_agent_BFM , fetch_env_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( fetch_in_configuration )::get cannot find resource fetch_env_in_agent_BFM" )
    if( !uvm_config_db #( fetch_out_configuration )::get( null , UVMF_CONFIGURATIONS , fetch_env_out_agent_BFM , fetch_env_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( fetch_out_configuration )::get cannot find resource fetch_env_out_agent_BFM" )
    if( !uvm_config_db #( decode_in_configuration )::get( null , UVMF_CONFIGURATIONS , decode_env_in_agent_BFM , decode_env_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( decode_in_configuration )::get cannot find resource decode_env_in_agent_BFM" )
    if( !uvm_config_db #( decode_out_configuration )::get( null , UVMF_CONFIGURATIONS , decode_env_out_agent_BFM , decode_env_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( decode_out_configuration )::get cannot find resource decode_env_out_agent_BFM" )
    if( !uvm_config_db #( execute_in_configuration )::get( null , UVMF_CONFIGURATIONS , execute_env_in_agent_BFM , execute_env_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( execute_in_configuration )::get cannot find resource execute_env_in_agent_BFM" )
    if( !uvm_config_db #( execute_out_configuration )::get( null , UVMF_CONFIGURATIONS , execute_env_out_agent_BFM , execute_env_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( execute_out_configuration )::get cannot find resource execute_env_out_agent_BFM" )
    if( !uvm_config_db #( writeback_in_configuration )::get( null , UVMF_CONFIGURATIONS , writeback_env_in_agent_BFM , writeback_env_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( writeback_in_configuration )::get cannot find resource writeback_env_in_agent_BFM" )
    if( !uvm_config_db #( writeback_out_configuration )::get( null , UVMF_CONFIGURATIONS , writeback_env_out_agent_BFM , writeback_env_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( writeback_out_configuration )::get cannot find resource writeback_env_out_agent_BFM" )
    if( !uvm_config_db #( memaccess_in_configuration )::get( null , UVMF_CONFIGURATIONS , memaccess_env_in_agent_BFM , memaccess_env_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( memaccess_in_configuration )::get cannot find resource memaccess_env_in_agent_BFM" )
    if( !uvm_config_db #( memaccess_out_configuration )::get( null , UVMF_CONFIGURATIONS , memaccess_env_out_agent_BFM , memaccess_env_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( memaccess_out_configuration )::get cannot find resource memaccess_env_out_agent_BFM" )
    if( !uvm_config_db #( control_in_configuration )::get( null , UVMF_CONFIGURATIONS , control_env_in_agent_BFM , control_env_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( control_in_configuration )::get cannot find resource control_env_in_agent_BFM" )
    if( !uvm_config_db #( control_out_configuration )::get( null , UVMF_CONFIGURATIONS , control_env_out_agent_BFM , control_env_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( control_out_configuration )::get cannot find resource control_env_out_agent_BFM" )
    if( !uvm_config_db #( imem_configuration )::get( null , UVMF_CONFIGURATIONS , imem_agent_BFM , imem_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( imem_configuration )::get cannot find resource imem_agent_BFM" )
    if( !uvm_config_db #( dmem_configuration )::get( null , UVMF_CONFIGURATIONS , dmem_agent_BFM , dmem_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( dmem_configuration )::get cannot find resource dmem_agent_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    imem_agent_sequencer = imem_agent_config.get_sequencer();
    dmem_agent_sequencer = dmem_agent_config.get_sequencer();



  // pragma uvmf custom new begin
  // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here
    imem_agent_responder_seq  = imem_agent_responder_seq_t::type_id::create("imem_agent_responder_seq");
    dmem_agent_responder_seq  = dmem_agent_responder_seq_t::type_id::create("dmem_agent_responder_seq");
    fork
      fetch_env_in_agent_config.wait_for_reset();
      fetch_env_out_agent_config.wait_for_reset();
      decode_env_in_agent_config.wait_for_reset();
      decode_env_out_agent_config.wait_for_reset();
      execute_env_in_agent_config.wait_for_reset();
      execute_env_out_agent_config.wait_for_reset();
      writeback_env_in_agent_config.wait_for_reset();
      writeback_env_out_agent_config.wait_for_reset();
      memaccess_env_in_agent_config.wait_for_reset();
      memaccess_env_out_agent_config.wait_for_reset();
      control_env_in_agent_config.wait_for_reset();
      control_env_out_agent_config.wait_for_reset();
      imem_agent_config.wait_for_reset();
      dmem_agent_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
      imem_agent_responder_seq.start(imem_agent_sequencer);
      dmem_agent_responder_seq.start(dmem_agent_sequencer);
    join_none
    // Start INITIATOR sequences here
    fork
    join
    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      fetch_env_in_agent_config.wait_for_num_clocks(400);
      fetch_env_out_agent_config.wait_for_num_clocks(400);
      decode_env_in_agent_config.wait_for_num_clocks(400);
      decode_env_out_agent_config.wait_for_num_clocks(400);
      execute_env_in_agent_config.wait_for_num_clocks(400);
      execute_env_out_agent_config.wait_for_num_clocks(400);
      writeback_env_in_agent_config.wait_for_num_clocks(400);
      writeback_env_out_agent_config.wait_for_num_clocks(400);
      memaccess_env_in_agent_config.wait_for_num_clocks(400);
      memaccess_env_out_agent_config.wait_for_num_clocks(400);
      control_env_in_agent_config.wait_for_num_clocks(400);
      control_env_out_agent_config.wait_for_num_clocks(400);
      imem_agent_config.wait_for_num_clocks(400);
      dmem_agent_config.wait_for_num_clocks(400);
    join

    imem_agent_responder_seq.disable_mem_seq = 1'b1;


    fork
      fetch_env_in_agent_config.wait_for_num_clocks(30);
      fetch_env_out_agent_config.wait_for_num_clocks(30);
      decode_env_in_agent_config.wait_for_num_clocks(30);
      decode_env_out_agent_config.wait_for_num_clocks(30);
      execute_env_in_agent_config.wait_for_num_clocks(30);
      execute_env_out_agent_config.wait_for_num_clocks(30);
      writeback_env_in_agent_config.wait_for_num_clocks(30);
      writeback_env_out_agent_config.wait_for_num_clocks(30);
      memaccess_env_in_agent_config.wait_for_num_clocks(30);
      memaccess_env_out_agent_config.wait_for_num_clocks(30);
      control_env_in_agent_config.wait_for_num_clocks(30);
      control_env_out_agent_config.wait_for_num_clocks(30);
      imem_agent_config.wait_for_num_clocks(30);
      dmem_agent_config.wait_for_num_clocks(30);
    join

     
    // pragma uvmf custom body end
  endtask

endclass

