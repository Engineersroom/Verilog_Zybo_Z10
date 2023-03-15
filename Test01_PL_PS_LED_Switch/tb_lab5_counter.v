`timescale 1ns/1ps

module lab5_count_tb();

reg clk;
reg reset_n;
reg [3:0] sw;
wire [3:0] led;

lab5_count u_lab5_count
(
    .clk(clk),
    .reset_n(reset_n),
    .sw(sw),
    .led(led)
);

initial begin
    clk = 0;
    reset_n = 0;
    sw = 4'b0000;
    #10 reset_n = 1;

    repeat(20) begin
        #5 clk = ~clk;
    end

    sw = 4'b0001; // enable counter_toggle_out_25M
    repeat(50) begin
        #5 clk = ~clk;
    end

    sw = 4'b0010; // enable counter_toggle_out_50M
    repeat(50) begin
        #5 clk = ~clk;
    end

    sw = 4'b0100; // enable counter_toggle_out_100M
    repeat(50) begin
        #5 clk = ~clk;
    end

    sw = 4'b1000; // enable counter_toggle_out_200M
    repeat(50) begin
        #5 clk = ~clk;
    end

    $finish;
end

endmodule
