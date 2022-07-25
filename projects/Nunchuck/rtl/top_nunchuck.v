module top(
    input clk_in,
    output reg led_signal,
    inout sda,
    inout scl
  );


  reg [18:0] count = 0;
  reg [1:0]  color_ind = 0;
  always @(posedge clk_in)
  begin
    count <= count + 1;
  end
  reg [7:0] led_num;
  draw_led draw_bitte (.clk(clk), .value(status[7:0]), .led_num(led_num));

  localparam NUM_LEDS = 50;

  reg [23:0] led_rgb_data = 24'h00_00_10;
  wire led_write = &count;

  ws2812 #(.NUM_LEDS(NUM_LEDS)) ws2812_inst(.data(led_signal), .clk(clk_in), .reset(reset), .rgb_data(led_rgb_data), .led_num(led_num), .write(led_write));


  /*********************
      LEDS  
      *******************/

  wire enable;
  reg read;
  reg [31:0] data = 0, status;
  reg started = 0;
  reg [23:0] reset_timer = 0;
  wire reset = !(&reset_timer);
  reg [23:0] counter;

  always @(posedge clk)
  begin
    if (reset)
      reset_timer <= reset_timer + 1;
    else
    begin
      enable <= 0;
      counter <= counter + 1;
      if (counter == {23{1'b1}})
      begin
        data[31] <= 1'b1;
        data[30:24] <= 7'h52;
        data[23:16] <= (started ? 8'h00 : 8'h40);
        data[15:8] <= 8'h00;
        read <= 0;
        enable <= 1;
        if (!started)
          started <= 1;
      end
      else if (!status[31] && counter == 0)
      begin
        data <= 0;
        data[0] <= 1;
        data[23:17] <= 7'h52;
        enable <= 1;
        read <= 1;
      end
    end
  end

  I2C_master #(.freq(16)) nunchuk (
               .sys_clock(clk),
               .SDA(sda),
               .SCL(scl),
               .reset(reset),
               .ctrl_data(data),
               .wr_ctrl(enable),
               .read(read),
               .status (status)
             );

endmodule
