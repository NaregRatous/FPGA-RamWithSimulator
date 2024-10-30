`timescale 1ns / 1ps

module tb;

reg clk=0, rst =0, we=0;
reg [3:0] addr = 0;
reg [7:0] datain =0;
wire [7:0] dataout;

integer i=0;
ram dut(clk, rst, we, addr, datain, dataout);

always #5 clk = ~clk;

task reset;
begin
 rst =1;
 we =0;
 addr = 0;
 datain =0;
 repeat(20) @(posedge clk);
 rst =0;
end
endtask

task write;
begin
we =1;
for(i=0;i<16; i=i+1)
begin
@(posedge clk);
addr = i;
datain = $urandom();

end
end
endtask

task read;
begin
we = 0;
for(i=0;i<16;i=i+1)
begin
addr = i;
@(posedge clk);

end
end
endtask

initial begin
reset();
write();
read();
end


endmodule
