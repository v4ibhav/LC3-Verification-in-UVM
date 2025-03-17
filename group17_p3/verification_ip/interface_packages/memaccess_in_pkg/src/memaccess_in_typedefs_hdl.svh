//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This file contains defines and typedefs to be compiled for use in
// the simulation running on the emulator when using Veloce.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
                                                                               

typedef enum bit [1:0] {READ_MEM=2'b00, WRITE_MEM=2'b10, READ_MEM_INDIRECT=2'b01, INIT=2'b11} memstate_t;
typedef bit [15:0] addr_t;
typedef bit [15:0] data_t;
typedef bit [15:0] data_addr_t;

// pragma uvmf custom additional begin
// pragma uvmf custom additional end

