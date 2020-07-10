`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 09:39:46
// Design Name: 
// Module Name: pcAdd
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


module PCAdd4(PC_o,PCadd4);
    input [31:0] PC_o;//偏移量
    output [31:0] PCadd4;//新指令地址
    CLA_32 cla32(PC_o,4,0, PCadd4, Cout);
endmodule


module CLA_32(X, Y, Cin, S, Cout);
    input [31:0] X, Y; 
    input Cin;   
    output [31:0] S;
    output Cout;
    wire Cout0, Cout1, Cout2, Cout3, Cout4, Cout5, Cout6;    
    CLA_4 add0 (X[3:0], Y[3:0], Cin, S[3:0], Cout0);
    CLA_4 add1 (X[7:4], Y[7:4], Cout0, S[7:4], Cout1);
    CLA_4 add2 (X[11:8], Y[11:8], Cout1, S[11:8], Cout2);
    CLA_4 add3 (X[15:12], Y[15:12], Cout2, S[15:12], Cout3);
    CLA_4 add4 (X[19:16], Y[19:16], Cout3, S[19:16], Cout4);
    CLA_4 add5 (X[23:20], Y[23:20], Cout4, S[23:20], Cout5);
    CLA_4 add6 (X[27:24], Y[27:24], Cout5, S[27:24], Cout6);
    CLA_4 add7 (X[31:28], Y[31:28], Cout6, S[31:28], Cout);
endmodule


module CLA_4(X, Y, Cin, S, Cout);
    input [3:0] X;
    input [3:0] Y;
    input Cin;
    output [3:0] S;
    output Cout;
    and get_0_0_0(tmp_0_0_0, X[0], Y[0]);
    or get_0_0_1(tmp_0_0_1, X[0], Y[0]);
    and get_0_1_0(tmp_0_1_0, X[1], Y[1]);
    or get_0_1_1(tmp_0_1_1, X[1], Y[1]);
    and get_0_2_0(tmp_0_2_0, X[2], Y[2]);
    or get_0_2_1(tmp_0_2_1, X[2], Y[2]);
    and get_0_3_0(tmp_0_3_0, X[3], Y[3]);
    or get_0_3_1(tmp_0_3_1, X[3], Y[3]);
    and get_1_0_0(tmp_1_0_0, ~tmp_0_0_0, tmp_0_0_1);
    xor getS0(S0, tmp_1_0_0, Cin);
    and get_1_1_0(tmp_1_1_0, ~tmp_0_1_0, tmp_0_1_1);
    not get_1_1_1(tmp_1_1_1, tmp_0_0_0);
    nand get_1_1_2(tmp_1_1_2, Cin, tmp_0_0_1);
    nand get_2_0_0(tmp_2_0_0, tmp_1_1_1, tmp_1_1_2);
    xor getS1(S1, tmp_1_1_0, tmp_2_0_0);
    and get_1_2_0(tmp_1_2_0, ~tmp_0_2_0, tmp_0_2_1);
    not get_1_2_1(tmp_1_2_1, tmp_0_1_0);
    nand get_1_2_2(tmp_1_2_2, tmp_0_1_1, tmp_0_0_0);
    nand get_1_2_3(tmp_1_2_3, tmp_0_1_1, tmp_0_0_1, Cin);
    nand get_2_1_0(tmp_2_1_0, tmp_1_2_1, tmp_1_2_2, tmp_1_2_3);
    xor getS2(S2, tmp_1_2_0, tmp_2_1_0);
    and get_1_3_0(tmp_1_3_0, ~tmp_0_3_0, tmp_0_3_1);
    not get_1_3_1(tmp_1_3_1, tmp_0_2_0);
    nand get_1_3_2(tmp_1_3_2, tmp_0_2_1, tmp_0_1_0);
    nand get_1_3_3(tmp_1_3_3, tmp_0_2_1, tmp_0_1_1, tmp_0_0_0);
    nand get_1_3_4(tmp_1_3_4, tmp_0_2_1, tmp_0_1_1, tmp_0_0_1, Cin); 
    nand get_2_2_0(tmp_2_2_0, tmp_1_3_1, tmp_1_3_2, tmp_1_3_3, tmp_1_3_4);
    xor getS3(S3, tmp_1_3_0, tmp_2_2_0);
    not get_1_4_0(tmp_1_4_0, tmp_0_3_0);
    nand get_1_4_1(tmp_1_4_1, tmp_0_3_1, tmp_0_2_0);
    nand get_1_4_2(tmp_1_4_2, tmp_0_3_1, tmp_0_2_1, tmp_0_1_0);
    nand get_1_4_3(tmp_1_4_3, tmp_0_3_1, tmp_0_2_1, tmp_0_1_1, tmp_0_0_0);
    nand get_1_4_4(tmp_1_4_4, tmp_0_3_1, tmp_0_2_1, tmp_0_1_1, tmp_0_0_1, Cin);
    nand getCout(Cout, tmp_1_4_0, tmp_1_4_1, tmp_1_4_2, tmp_1_4_3,tmp_1_4_4);
    assign S = {S3,S2,S1,S0};
endmodule

