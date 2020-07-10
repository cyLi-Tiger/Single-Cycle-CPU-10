`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 09:42:00
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU( ReadData1, ReadData2,ALUOp,result,zero);
        input [31:0] ReadData1;
        input [31:0] ReadData2;
        input [2:0] ALUOp;
        output reg[31:0] result;
        output reg zero;
  
    always@(ReadData1 or ReadData2 or ALUOp) 
    begin

        case(ALUOp)
            3'b000: result = ReadData1 + ReadData2;
            3'b001: result = ReadData1 - ReadData2;
            3'b010: result = ReadData2 & ReadData1;
            3'b011: result = ReadData1 | ReadData2;
            3'b100: result = ReadData2<<16;
        endcase
        zero = (result == 0) ? 1 : 0;
    end 

endmodule

