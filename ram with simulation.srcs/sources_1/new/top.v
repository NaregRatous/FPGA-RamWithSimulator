`timescale 1ns / 1ps


module ram(
    input clk,
    input rst,
    input we,
    input [3:0] addr,
    input [7:0] datain,
    output reg [7:0] dataout
    );

reg [7:0] mem [15:0];
integer i;

always@(posedge clk)
begin
 if(rst ==1)
 begin
     dataout <= 8'h00;
     for(i=0;i<16; i=i+1)
     begin
         mem[i] <=0;
     end
 end
 else
     begin
      if(we)
      begin
       mem[addr] <=datain;
      end
      else
      begin
       dataout <= mem[addr];
      end
     
     end
end    
    
    

endmodule
