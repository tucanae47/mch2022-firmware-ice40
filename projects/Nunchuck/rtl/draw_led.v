module draw_led(
  input clk,
  input [7:0] value,
  output [7:0] led_num
);

reg [3:0] data;
reg posn;
reg [23:0] prescaler;

decoder_led decoder(.clk (clk), .seg(led_num), .data(data));

always @(posedge clk) begin
  prescaler <= prescaler + 1;
  if (prescaler == 8000) begin // 1khz
    prescaler <= 0;
    posn <= posn + 1;
    if (posn == 1) begin
      data <= value[7:4];
    end else if (posn == 0) begin
      data <= value[3:0];
    end
  end
end
endmodule
