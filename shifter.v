`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/28 10:30:30
// Design Name: 
// Module Name: shifter
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


    module SHIFTER_COMBINATION(X,PCADD4,Sh);
    input [26:0] X;
    input [31:0] PCADD4;
    output [31:0] Sh;
    parameter z=2'b00;
    assign Sh={PCADD4[31:28],X[26:0],z};
endmodule

module SHIFTER32_L2(X,Sh);
    input [31:0] X;
    output [31:0] Sh;
    parameter z=2'b00;
    assign Sh={X[29:0],z};
endmodule
