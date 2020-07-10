`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/28 10:30:30
// Design Name: 
// Module Name: SignExtend
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

module SignExtend (X, Se, Y);
    input [15:0] X;
    input Se;
    output [31:0] Y;
    wire [31:0] E0, E1;
    wire [15:0] e = {16{X[15]}};
    parameter z = 16'b0;
    assign E0 = {z, X};
    assign E1 = {e, X};
    MUX2X32 i(E0, E1, Se, Y);
endmodule
