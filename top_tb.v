`timescale 1ns / 1ps

module top_tb();

reg clock, reset;
wire [7:0] counter_out;

// Initialize all variables and run the test
initial begin
  $dumpfile("top_tb.vcd");
  $dumpvars(0, top_inst);
  clock = 1;
  reset = 0;
  #50 reset = 1;
  #50 reset = 0;
  #5000 $finish;
end

// Log the variables
always @(posedge clock) begin
  $display("%g,%b,%b", $time, reset, counter_out);
end

// Simulation clock generator
always begin
  #1 clock = ~clock;
end

// Connect DUT to test bench
top top_inst(
  .clk(clock),
  .rst(reset),
  .counter_out(counter_out)
);

endmodule
