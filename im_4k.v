`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 09:39:46
// Design Name: 
// Module Name: InsMEM
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


module im_4k(Addr,Inst);//Ö¸Áî´æ´¢Æ÷
input[31:0]Addr;
reg [31:0]Rom[1024:0];

output[31:0]Inst;

    initial 
    begin
        $readmemh("C:\\Users\\Y\\Desktop\\code.txt", Rom);
    end
    integer i;
    initial begin
        $display("start simulation");
        for (i=0;i<20;i=i+1)
            $display("%h %h", i,Rom[i]);
    end
    
    assign Inst=Rom[Addr[6:2]];

endmodule


