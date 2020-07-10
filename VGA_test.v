module vga_test (
	// host side
	iCLK_27MHz,
	ireset_n,
	// VGA side
	oVGA_CLK,
	oVGA_ACTIVE, // VGA_BLANK
	oVGA_HS,
	oVGA_VS,
	oVGA_SYNC,
	oVGA_R,
	oVGA_G,
	oVGA_B
);

input iCLK_27MHz, ireset_n;

output oVGA_CLK;
output oVGA_ACTIVE, oVGA_SYNC;
output oVGA_HS, oVGA_VS;
output reg [9:0]oVGA_R, oVGA_G, oVGA_B;

wire [9:0]pixel_x, pixel_y;
reg [9:0]color_buffer;

// wall wires
wire [9:0]wall_RGB;
wire wall_on; 

// bar wires
wire [9:0]bar_RGB;
wire bar_on;

always @(iCLK_27MHz) begin
	if (bar_on)
		color_buffer = wall_RGB;
	else 
		color_buffer = 10'b1111111111;
end

always @(color_buffer) begin
	oVGA_R = color_buffer;
	oVGA_G = color_buffer;
	oVGA_B = color_buffer;
end

vga_controller controller (iCLK_27MHz, ireset_n, oVGA_CLK, oVGA_ACTIVE, oVGA_HS, oVGA_VS, oVGA_SYNC, pixel_x, pixel_y);

draw_bar bar (pixel_x, pixel_y, bar_RGB, bar_on);

endmodule 