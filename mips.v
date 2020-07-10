`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 09:56:30
// Design Name: 
// Module Name: mips_tb
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


module mips;

    reg CLK;
    reg Reset;
    MAIN uut(
    .Clk(CLK),
    .Reset(Reset)
    );



    initial begin
        // Initialize Inputs
        CLK = 0;
        Reset = 0;
        
        CLK = !CLK;  // �½��أ�ʹPC������
        Reset = 1;  // ��������ź�
        forever #20
        begin // ����ʱ���źţ�����Ϊ50s
             CLK = !CLK;
        end
    end
endmodule
