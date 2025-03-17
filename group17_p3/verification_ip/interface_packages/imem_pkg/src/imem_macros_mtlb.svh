//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the imem package.
//   These macros include packed struct definitions.  These structs are
//   used to pass data between classes, hvl, and BFM's, hdl.  Use of 
//   structs are more efficient and simpler to modify.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_struct
//      and from_struct methods defined in the macros below that are used in  
//      the imem_configuration class.
//
  `define imem_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } imem_configuration_s;

  `define imem_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function imem_configuration_s to_struct();\
    imem_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( imem_configuration_struct );\
  endfunction

  `define imem_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(imem_configuration_s imem_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = imem_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the imem_transaction class.
//
  `define imem_MONITOR_STRUCT typedef struct packed  { \
  bit _complete_instr ; \
  bit_16 _Instr_dout ; \
  bit_16 _PC ; \
  bit _instrmem_rd ; \
  op_t _opcode ; \
  reg_t _sr1 ; \
  reg_t _sr2 ; \
  reg_t _dr ; \
  baser_t _baser ; \
  pcoffset9_t _pcoffset9 ; \
  pcoffset6_t _pcoffset6 ; \
  imm5_t _imm5 ; \
  n_t _n ; \
  z_t _z ; \
  p_t _p ; \
     } imem_monitor_s;

  `define imem_TO_MONITOR_STRUCT_FUNCTION \
  virtual function imem_monitor_s to_monitor_struct();\
    imem_monitor_struct = \
            { \
            this._complete_instr , \
            this._Instr_dout , \
            this._PC , \
            this._instrmem_rd , \
            this._opcode , \
            this._sr1 , \
            this._sr2 , \
            this._dr , \
            this._baser , \
            this._pcoffset9 , \
            this._pcoffset6 , \
            this._imm5 , \
            this._n , \
            this._z , \
            this._p  \
            };\
    return ( imem_monitor_struct);\
  endfunction\

  `define imem_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(imem_monitor_s imem_monitor_struct);\
            {\
            this._complete_instr , \
            this._Instr_dout , \
            this._PC , \
            this._instrmem_rd , \
            this._opcode , \
            this._sr1 , \
            this._sr2 , \
            this._dr , \
            this._baser , \
            this._pcoffset9 , \
            this._pcoffset6 , \
            this._imm5 , \
            this._n , \
            this._z , \
            this._p  \
            } = imem_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the imem_transaction class.
//      Also update the comments in the driver BFM.
//
  `define imem_INITIATOR_STRUCT typedef struct packed  { \
  bit _complete_instr ; \
  bit_16 _Instr_dout ; \
  bit_16 _PC ; \
  bit _instrmem_rd ; \
  op_t _opcode ; \
  reg_t _sr1 ; \
  reg_t _sr2 ; \
  reg_t _dr ; \
  baser_t _baser ; \
  pcoffset9_t _pcoffset9 ; \
  pcoffset6_t _pcoffset6 ; \
  imm5_t _imm5 ; \
  n_t _n ; \
  z_t _z ; \
  p_t _p ; \
     } imem_initiator_s;

  `define imem_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function imem_initiator_s to_initiator_struct();\
    imem_initiator_struct = \
           {\
           this._complete_instr , \
           this._Instr_dout , \
           this._PC , \
           this._instrmem_rd , \
           this._opcode , \
           this._sr1 , \
           this._sr2 , \
           this._dr , \
           this._baser , \
           this._pcoffset9 , \
           this._pcoffset6 , \
           this._imm5 , \
           this._n , \
           this._z , \
           this._p  \
           };\
    return ( imem_initiator_struct);\
  endfunction

  `define imem_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(imem_initiator_s imem_initiator_struct);\
           {\
           this._complete_instr , \
           this._Instr_dout , \
           this._PC , \
           this._instrmem_rd , \
           this._opcode , \
           this._sr1 , \
           this._sr2 , \
           this._dr , \
           this._baser , \
           this._pcoffset9 , \
           this._pcoffset6 , \
           this._imm5 , \
           this._n , \
           this._z , \
           this._p  \
           } = imem_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the imem_transaction class.
//      Also update the comments in the driver BFM.
//
  `define imem_RESPONDER_STRUCT typedef struct packed  { \
  bit _complete_instr ; \
  bit_16 _Instr_dout ; \
  bit_16 _PC ; \
  bit _instrmem_rd ; \
  op_t _opcode ; \
  reg_t _sr1 ; \
  reg_t _sr2 ; \
  reg_t _dr ; \
  baser_t _baser ; \
  pcoffset9_t _pcoffset9 ; \
  pcoffset6_t _pcoffset6 ; \
  imm5_t _imm5 ; \
  n_t _n ; \
  z_t _z ; \
  p_t _p ; \
     } imem_responder_s;

  `define imem_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function imem_responder_s to_responder_struct();\
    imem_responder_struct = \
           {\
           this._complete_instr , \
           this._Instr_dout , \
           this._PC , \
           this._instrmem_rd , \
           this._opcode , \
           this._sr1 , \
           this._sr2 , \
           this._dr , \
           this._baser , \
           this._pcoffset9 , \
           this._pcoffset6 , \
           this._imm5 , \
           this._n , \
           this._z , \
           this._p  \
           };\
    return ( imem_responder_struct);\
  endfunction

  `define imem_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(imem_responder_s imem_responder_struct);\
           {\
           this._complete_instr , \
           this._Instr_dout , \
           this._PC , \
           this._instrmem_rd , \
           this._opcode , \
           this._sr1 , \
           this._sr2 , \
           this._dr , \
           this._baser , \
           this._pcoffset9 , \
           this._pcoffset6 , \
           this._imm5 , \
           this._n , \
           this._z , \
           this._p  \
           } = imem_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
