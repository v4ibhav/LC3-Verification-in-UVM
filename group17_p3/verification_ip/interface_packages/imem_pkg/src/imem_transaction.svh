//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an imem
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class imem_transaction  extends uvmf_transaction_base;

  `uvm_object_utils( imem_transaction )

  bit complete_instr ;
  bit_16 Instr_dout ;
  bit_16 PC ;
  bit instrmem_rd ;
  rand op_t opcode ;
  rand reg_t sr1 ;
  rand reg_t sr2 ;
  rand reg_t dr ;
  rand baser_t baser ;
  rand pcoffset9_t pcoffset9 ;
  rand pcoffset6_t pcoffset6 ;
  rand imm5_t imm5 ;
  rand n_t n ;
  rand z_t z ;
  rand p_t p ;

  //Constraints for the transaction variables:
  constraint nzp_constr {$countones({n,z,p}) != 0;}

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  //*******************************************************************
  //*******************************************************************
  // Macros that define structs and associated functions are
  // located in imem_macros.svh

  //*******************************************************************
  // Monitor macro used by imem_monitor and imem_monitor_bfm
  // This struct is defined in imem_macros.svh
  `imem_MONITOR_STRUCT
    imem_monitor_s imem_monitor_struct;
  //*******************************************************************
  // FUNCTION: to_monitor_struct()
  // This function packs transaction variables into a imem_monitor_s
  // structure.  The function returns the handle to the imem_monitor_struct.
  // This function is defined in imem_macros.svh
  `imem_TO_MONITOR_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_monitor_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in imem_macros.svh
  `imem_FROM_MONITOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Initiator macro used by imem_driver and imem_driver_bfm
  // to communicate initiator driven data to imem_driver_bfm.
  // This struct is defined in imem_macros.svh
  `imem_INITIATOR_STRUCT
    imem_initiator_s imem_initiator_struct;
  //*******************************************************************
  // FUNCTION: to_initiator_struct()
  // This function packs transaction variables into a imem_initiator_s
  // structure.  The function returns the handle to the imem_initiator_struct.
  // This function is defined in imem_macros.svh
  `imem_TO_INITIATOR_STRUCT_FUNCTION  
  //*******************************************************************
  // FUNCTION: from_initiator_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in imem_macros.svh
  `imem_FROM_INITIATOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Responder macro used by imem_driver and imem_driver_bfm
  // to communicate Responder driven data to imem_driver_bfm.
  // This struct is defined in imem_macros.svh
  `imem_RESPONDER_STRUCT
    imem_responder_s imem_responder_struct;
  //*******************************************************************
  // FUNCTION: to_responder_struct()
  // This function packs transaction variables into a imem_responder_s
  // structure.  The function returns the handle to the imem_responder_struct.
  // This function is defined in imem_macros.svh
  `imem_TO_RESPONDER_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_responder_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in imem_macros.svh
  `imem_FROM_RESPONDER_STRUCT_FUNCTION 
  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new( string name = "" );
    super.new( name );
  endfunction

  // ****************************************************************************
  // FUNCTION: convert2string()
  // This function converts all variables in this class to a single string for 
  // logfile reporting.
  //
  virtual function string convert2string();
    // pragma uvmf custom convert2string begin
    // UVMF_CHANGE_ME : Customize format if desired.
    return $sformatf("sr1:0x%x sr2:0x%x dr:0x%x baser:0x%x pcoffset9:0x%x pcoffset6:0x%x imm5:0x%x nzp:0x%x PC:0x%x instrmem_rd:0x%x Instr_dout:0x%x complete_instr:0x%x ",sr1,sr2,dr,baser,pcoffset9,pcoffset6,imm5,{n,z,p},PC,instrmem_rd,Instr_dout,complete_instr);
    // pragma uvmf custom convert2string end
  endfunction

  //*******************************************************************
  // FUNCTION: do_print()
  // This function is automatically called when the .print() function
  // is called on this class.
  //
  virtual function void do_print(uvm_printer printer);
    // pragma uvmf custom do_print begin
    // UVMF_CHANGE_ME : Current contents of do_print allows for the use of UVM 1.1d, 1.2 or P1800.2.
    // Update based on your own printing preference according to your preferred UVM version
    $display(convert2string());
    // pragma uvmf custom do_print end
  endfunction

  //*******************************************************************
  // FUNCTION: do_compare()
  // This function is automatically called when the .compare() function
  // is called on this class.
  //
  virtual function bit do_compare (uvm_object rhs, uvm_comparer comparer);
    imem_transaction  RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    imem_transaction  RHS;
    if(!$cast(RHS,rhs))begin
      `uvm_fatal("CAST","Transaction cast in do_copy() failed!")
    end
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.complete_instr = RHS.complete_instr;
    this.Instr_dout = RHS.Instr_dout;
    this.PC = RHS.PC;
    this.instrmem_rd = RHS.instrmem_rd;
    this.opcode = RHS.opcode;
    this.sr1 = RHS.sr1;
    this.sr2 = RHS.sr2;
    this.dr = RHS.dr;
    this.baser = RHS.baser;
    this.pcoffset9 = RHS.pcoffset9;
    this.pcoffset6 = RHS.pcoffset6;
    this.imm5 = RHS.imm5;
    this.n = RHS.n;
    this.z = RHS.z;
    this.p = RHS.p;
    // pragma uvmf custom do_copy end
  endfunction

  // ****************************************************************************
  // FUNCTION: add_to_wave()
  // This function is used to display variables in this class in the waveform 
  // viewer.  The start_time and end_time variables must be set before this 
  // function is called.  If the start_time and end_time variables are not set
  // the transaction will be hidden at 0ns on the waveform display.
  // 
  virtual function void add_to_wave(int transaction_viewing_stream_h);
    `ifdef QUESTA
    if (transaction_view_h == 0) begin
      transaction_view_h = $begin_transaction(transaction_viewing_stream_h,"imem_transaction",start_time);
    end
    super.add_to_wave(transaction_view_h);
    // pragma uvmf custom add_to_wave begin
    // UVMF_CHANGE_ME : Color can be applied to transaction entries based on content, example below
    // case()
    //   1 : $add_color(transaction_view_h,"red");
    //   default : $add_color(transaction_view_h,"grey");
    // endcase
    // UVMF_CHANGE_ME : Eliminate transaction variables not wanted in transaction viewing in the waveform viewer
    $add_attribute(transaction_view_h,complete_instr,"complete_instr");
    $add_attribute(transaction_view_h,Instr_dout,"Instr_dout");
    $add_attribute(transaction_view_h,PC,"PC");
    $add_attribute(transaction_view_h,instrmem_rd,"instrmem_rd");
    $add_attribute(transaction_view_h,opcode,"opcode");
    $add_attribute(transaction_view_h,sr1,"sr1");
    $add_attribute(transaction_view_h,sr2,"sr2");
    $add_attribute(transaction_view_h,dr,"dr");
    $add_attribute(transaction_view_h,baser,"baser");
    $add_attribute(transaction_view_h,pcoffset9,"pcoffset9");
    $add_attribute(transaction_view_h,pcoffset6,"pcoffset6");
    $add_attribute(transaction_view_h,imm5,"imm5");
    $add_attribute(transaction_view_h,n,"n");
    $add_attribute(transaction_view_h,z,"z");
    $add_attribute(transaction_view_h,p,"p");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

  function void post_randomize();
    Instr_dout[15:12]  = opcode;
    Instr_dout[11:9]   = dr;
    Instr_dout[8:6]    = sr1;
    
    casex (opcode)
      ADD: begin
        if(pcoffset9[5] == 1'b1) begin //if [5]==1 then immediate
          Instr_dout[5]    = 1'b1;
          Instr_dout[4:0]  = imm5;
        end
        else begin
          Instr_dout[5:3]  = 0;
          Instr_dout[2:0]  = sr2;
        end
      end
      AND: begin
        if(pcoffset6[5]) begin
          Instr_dout[5]    = 1'b1;
          Instr_dout[4:0]  = imm5;
        end
        else begin
          Instr_dout[5:3]  = 0;
          Instr_dout[2:0]  = sr2;
        end
      end
      NOT: begin
        Instr_dout[5:0]    = 6'b111111;
      end
      LD,LDI,LEA: begin
        Instr_dout[8:0]    = pcoffset9;
      end
      LDR: begin
        Instr_dout[8:6]    = baser;
        Instr_dout[5:0]    = pcoffset6;
      end
      ST,STI: begin
        Instr_dout[8:0]    = pcoffset9;
      end
      STR: begin
        Instr_dout[8:6]    = baser;
        Instr_dout[5:0]    = pcoffset6;
      end
      BR: begin
        Instr_dout[11]     = n;
        Instr_dout[10]     = z;
        Instr_dout[9]      = p;
        Instr_dout[8:0]    = pcoffset9;
      end
      JMP: begin
        Instr_dout[11:9]   = 0;
        Instr_dout[8:6]    = baser;
        Instr_dout[5:0]    = 0;
      end
      default: begin
        Instr_dout[5:0]    = 0;
      end
    endcase
  endfunction
  
endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

