import lc3_env_pkg::*;
import lc3_test_pkg::*;
import uvmf_base_pkg::*;

//class test_top extends uvm_test;
typedef lc3_env_configuration  lc3_env_configuration_t;
typedef lc3_environment  lc3_environment_t;
class test_top extends uvmf_test_base #(.CONFIG_T(lc3_env_configuration_t), 
                                        .ENV_T(lc3_environment_t), 
                                        .TOP_LEVEL_SEQ_T(lc3_bench_sequence_base));
    `uvm_component_utils( test_top );

     //lc3_environment lc3_env; 
     //lc3_env_configuration lc3_env_conf;
     uvmf_active_passive_t activities[];
     string agent_paths[];
     string interface_name[];
   
    function new(string name="test_top", uvm_component parent = null); 
      super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);

      super.build_phase(phase);
      //lc3_env_conf = new("lc3_env_conf");
      //lc3_env = new("lc3_env" , this);
      //seq = new("seq"); TODO

      //lc3_env.configuration = lc3_env_conf;

      activities = {PASSIVE /* fetch_In     [0] */ , 
    		    PASSIVE /* fetch_Out     [1] */ , 
    		    PASSIVE /* decode_In     [2] */ , 
   		    PASSIVE /* decode_Out     [3] */ , 
   		    PASSIVE /* execute_In     [4] */ , 
   		    PASSIVE /* execute_Out     [5] */ , 
   		    PASSIVE /* writeback_In     [6] */ , 
   		    PASSIVE /* writeback_Out     [7] */ , 
   		    PASSIVE /* memaccess_In     [8] */ , 
   		    PASSIVE /* memaccess_Out     [9] */ , 
   		    PASSIVE /* control_In     [10] */ , 
   		    PASSIVE /* control_Out     [11] */ , 
   		    ACTIVE /* imem_agent     [12] */ , 
   		    ACTIVE /* dmem_agent     [13] */   };

   interface_name = {
    	fetch_env_in_agent_BFM /* fetch_env_in_agent     [0] */ , 
    	fetch_env_out_agent_BFM /* fetch_env_out_agent     [1] */ , 
    	decode_env_in_agent_BFM /* decode_env_in_agent     [2] */ , 
    	decode_env_out_agent_BFM /* decode_env_out_agent     [3] */ , 
    	execute_env_in_agent_BFM /* execute_env_in_agent     [4] */ , 
    	execute_env_out_agent_BFM /* execute_env_out_agent     [5] */ , 
    	writeback_env_in_agent_BFM /* writeback_env_in_agent     [6] */ , 
    	writeback_env_out_agent_BFM /* writeback_env_out_agent     [7] */ , 
    	memaccess_env_in_agent_BFM /* memaccess_env_in_agent     [8] */ , 
    	memaccess_env_out_agent_BFM /* memaccess_env_out_agent     [9] */ , 
    	control_env_in_agent_BFM /* control_env_in_agent     [10] */ , 
    	control_env_out_agent_BFM /* control_env_out_agent     [11] */ , 
    	imem_agent_BFM /* imem_agent     [12] */ , 
    	dmem_agent_BFM /* dmem_agent     [13] */}; 
	
 
      configuration.initialize(CHIP, "uvm_test_top.environment", interface_name,null, activities);

 
    endfunction


    virtual function void connect_phase(uvm_phase phase);
     super.connect_phase(phase);
    endfunction 

    /*virtual task  run_phase(uvm_phase phase);
      phase.raise_objection(this, "Objection raised by test_base");
      $display ("entered into base test top");
      repeat (5) wait(env.agent_in.driver.bfm.bus.rst===0);
      for(int i=0; i<25; i++) begin
      seq.start(env.agent_in.sequencer);
       end
      phase.phase_done.set_drain_time(this, 10);
      phase.drop_objection(this, "Objection dropped by test_base");
    endtask*/

  endclass 
