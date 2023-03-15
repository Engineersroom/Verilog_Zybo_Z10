`timescale 1ns/1ps

module counter_toggle_out(
    input clk,          // Clock input
    input reset_n,      // Active-low reset input
    input enable,       // Enable input
    input [31:0] i_cnt_th, // Threshold input for the counter
    output reg o_toggle // Output that toggles when the counter reaches the threshold
);

  reg [31:0] counter;   // Counter register

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin   // Asynchronous reset
      counter <= 0;
      o_toggle <= 0;
    end else if (enable) begin
      if (counter == i_cnt_th) begin
        counter <= 0;        // Reset counter to zero when it reaches threshold
        o_toggle <= ~o_toggle; // Toggle output signal when it reaches threshold
      end else begin
        counter <= counter + 1;  // Increment counter on every clock cycle
      end
    end else begin
      counter <= 0;        // Reset counter to zero when enable is low
      o_toggle <= 0;       // Reset output signal to zero when enable is low
    end
  end

endmodule
