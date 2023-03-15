`timescale 1ns/1ps

module tb_lab5_counter();

reg clk;
reg reset_n;
reg [3:0] sw;
wire [3:0] led;

always
    #5 clk = ~clk;

integer i;

lab5_count u_lab5_count
(
    .clk(clk),
    .reset_n(reset_n),
    .sw(sw),
    .led(led)
);

initial begin
//initialize value
$display("initialize value [%0d]", $time);
    reset_n = 1;
    clk     = 0;
	sw 	= 0;

// reset_n gen
$display("Reset! [%0d]", $time);
# 100
    reset_n = 0;
# 10
    reset_n = 1;
# 10
@(posedge clk);

$display("sw on [%0d]", $time);
sw = 4'b1111;

$display("Start! [%0d]", $time);

for (i = 0; i < 32'd400; i = i+1) begin
	@(posedge clk);
end

# 100
$display("Success Simulation!! (Matbi = gudok & joayo) [%0d]", $time);
$finish;
end



endmodule
