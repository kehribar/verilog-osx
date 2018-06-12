module top(
  input clk,
  input rst,
  output [7:0] counter_out
);

wire clken;
wire [7:0] counter_out;

clken_gen #(
  .DIV_RATIO(3) // Resulting 'clken' pulse frequency is { clk / ( n + 1) }
)
clken_gen_inst(
  .clk(clk),
  .rst(rst),
  .clken(clken)
);

up_counter up_counter_inst(
  .clk(clk),
  .rst(rst),
  .enable(clken),
  .out(counter_out)
);

endmodule
