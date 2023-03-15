`timescale 1ns/1ps

module lab5_count(
    input clk,
    input reset_n,
    input [3:0] sw,
    input [3:0] led 
);

`ifdef XSIM
wire [31:0] w_i_cnt_th_25M = 32'd25;
wire [31:0] w_i_cnt_th_50M = 32'd50;
wire [31:0] w_i_cnt_th_100M = 32'd100;
wire [31:0] w_i_cnt_th_200M = 32'd200;
`else
wire [31:0] w_i_cnt_th_25M = 32'd25000000;
wire [31:0] w_i_cnt_th_50M = 32'd50000000;
wire [31:0] w_i_cnt_th_100M = 32'd100000000;
wire [31:0] w_i_cnt_th_200M = 32'd200000000;
`endif 

counter_toggle_out
u_counter_toggle_out_25M
(
    .clk (clk),
    .reset_n (reset_n),
    .enable (sw[0]),
    .i_cnt_th (w_i_cnt_th_25M),
    .o_toggle (led[0])
);

counter_toggle_out
u_counter_toggle_out_50M
(
    .clk (clk),
    .reset_n (reset_n),
    .enable (sw[1]),
    .i_cnt_th (w_i_cnt_th_50M),
    .o_toggle (led[1])
);

counter_toggle_out
u_counter_toggle_out_100M
(
    .clk (clk),
    .reset_n (reset_n),
    .enable (sw[2]),
    .i_cnt_th (w_i_cnt_th_100M),
    .o_toggle (led[2])
);

counter_toggle_out
u_counter_toggle_out_200M
(
    .clk (clk),
    .reset_n (reset_n),
    .enable (sw[3]),
    .i_cnt_th (w_i_cnt_th_200M),
    .o_toggle (led[3])
);

endmodule
