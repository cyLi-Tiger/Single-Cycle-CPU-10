`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/23 16:49:25
// Design Name: 
// Module Name: PC
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


module PC(Clk,Reset,Result,Address);  
    input Clk;//时钟
    input Reset;//是否重置地址。0-初始化PC，否则接受新地址       
    input[31:0] Result;
    output reg[31:0] Address;

    initial begin
        Address  <= 0;
    end
    
    always @(posedge Clk or negedge Reset)  
    begin  
    if (!Reset) //如果为0则初始化PC，否则接受新地址
        begin  
            Address <= 0;  
        end  
    else   
        begin
            Address =  Result;  
        end  
    end  
endmodule

