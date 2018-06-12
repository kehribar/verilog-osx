// ----------------------------------------------------------------------------
// Generates 'clock enable' pulse from input clock.
// - Output pulse frequency is determined by DIV_RATIO parameter:
//  * f_clken = f_clk / (DIV_RATIO + 1)
// - Pulse witdh is single clock wide
// ----------------------------------------------------------------------------
module clken_gen #(
  parameter DIV_RATIO = 16
)(
  input clk,
  input rst,
  output clken
);

parameter WIDTH = $clog2(DIV_RATIO);

reg clken;
reg [(WIDTH-1):0] cnt;

always @(posedge clk) begin
  if(rst == 1) begin
    cnt <= 8'b0;
    clken <= 0;
  end else begin
    if(cnt == DIV_RATIO) begin
      cnt <= 8'b0;
      clken <= 1;
    end else begin
      clken <= 0;
      cnt <= cnt + 1;
    end
  end
end

endmodule
