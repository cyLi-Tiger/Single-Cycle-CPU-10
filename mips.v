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
        
        CLK = !CLK;  // 下降沿，使PC先清零
        Reset = 1;  // 清除保持信号
        forever #20
        begin // 产生时钟信号，周期为50s
             CLK = !CLK;
        end
    end
endmodule
