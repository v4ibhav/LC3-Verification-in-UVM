//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class imem_responder_sequence 
  extends imem_sequence_base ;

  `uvm_object_utils( imem_responder_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  bit disable_mem_seq;
  function new(string name = "imem_responder_sequence");
    super.new(name);
    disable_mem_seq = 1'b0;
  endfunction

  task init_reg();
    start_item(req);
    finish_item(req);
    req.Instr_dout[15:12] = LD;
    req.dr = 3'h0;
    req.Instr_dout[11:0] = {req.dr, req.pcoffset9}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.Instr_dout[15:12] = LD;
    req.dr = 3'h0;
    req.Instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.Instr_dout[15:12] = LD;
    req.dr = 3'h1;
    req.Instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.Instr_dout[15:12] = LD;
    req.dr = 3'h2;
    req.Instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.Instr_dout[15:12] = LD;
    req.dr = 3'h3;
    req.Instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.Instr_dout[15:12] = LD;
    req.dr = 3'h4;
    req.Instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.Instr_dout[15:12] = LD;
    req.dr = 3'h5;
    req.Instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.Instr_dout[15:12] = LD;
    req.dr = 3'h6;
    req.Instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.Instr_dout[15:12] = LD;
    req.dr = 3'h7;
    req.Instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
  endtask

  task body();
    req=imem_transaction::type_id::create("req");
    `uvm_info("IMEM"," Entered into imem responder sequence", UVM_MEDIUM);    
    init_reg();

    forever begin
      start_item(req);

      if(disable_mem_seq ==1'b0) begin 
	      if(!req.randomize() )`uvm_fatal("SEQ", "imem_random_sequence::body()-imem_transaction randomization failed")
          req.complete_instr =1;
      end else begin
        req.Instr_dout =0;
        req.complete_instr=0;
      end

      finish_item(req);
      // pragma uvmf custom body begin
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
      // pragma uvmf custom body end
    end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

