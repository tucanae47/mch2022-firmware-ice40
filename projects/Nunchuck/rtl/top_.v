module top (
	input  clk_in,
    inout SDA
    // output [2:0] rgb // LED outputs. [0]: Blue, [1]: Red, [2]: Green.
);
wire SCL;
assign SCL = clk_in;

// reg reset = 1;
// always @(posedge clk_in)
//     reset <= 0;

wire reset_button = 1'b1; // No reset button on this board

reg [15:0] reset_cnt = 0;
wire resetq = &reset_cnt;

always @(posedge clk) begin
  if (reset_button) reset_cnt <= reset_cnt + !resetq;
  else        reset_cnt <= 0;
end


i2c u_i2c(.SCL(SCL),.SDA(SDA),.RST(~resetq));

endmodule
