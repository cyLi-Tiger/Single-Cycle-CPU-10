`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 09:42:00
// Design Name: 
// Module Name: MUX2X5
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


module MUX2X5(A0,A1,S,Y);
    input [4:0] A0,A1;
    input S;
    output [4:0] Y;

    function [4:0] select;
        input [4:0] A0,A1;
        input S;
        case(S)
            0:select=A0;
            1:select=A1;
        endcase
    endfunction

    assign Y=select(A0,A1,S);
endmodule

module MUX2X32(A0,A1,S,Y);
    input [31:0] A0,A1;
    input S;
    output [31:0] Y;

    function [31:0] select;
        input [31:0] A0,A1;
        input S;
        case(S)
            0:select=A0;
            1:select=A1;
        endcase
    endfunction

    assign Y=select(A0,A1,S);
endmodule

module MUX5X32 (A0, A1, A2, A3, A4, S, Y);
    input [31:0] A0, A1, A2, A3, A4;
    input [2:0] S;
    output [31:0] Y;

    function [31:0] select;
        input [31:0] A0, A1, A2, A3, A4;
        input [2:0] S;
        case(S)
            3'b000: select = A0;
            3'b001: select = A1;
            3'b010: select = A2;
            3'b011: select = A3;
            3'b100: select = A3;
            3'b101: select = A4;
        endcase
    endfunction

    assign Y = select (A0, A1, A2, A3, A4, S);
endmodule
