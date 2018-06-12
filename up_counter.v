module up_counter(
  input clk,
  input rst,
  input enable,
  output [7:0] out
);

reg [7:0] out;

always @(posedge clk) begin
  if(rst == 1) begin
    out <= 8'b0;
  end else if(enable) begin
    out <= out + 1;
  end
end

endmodule
