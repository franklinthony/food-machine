module vga_controller (
	// host side
	iCLK_27MHz,
	ireset_n,
	// VGA side
	oVGA_CLK,
	oVGA_ACTIVE, // video_on
	oVGA_HS,
	oVGA_VS,
	oVGA_SYNC,
	// host sides
	opixel_x,
	opixel_y
);

input iCLK_27MHz, ireset_n;

output oVGA_CLK;
output oVGA_ACTIVE, oVGA_SYNC;
output reg oVGA_HS, oVGA_VS;

output reg [9:0]opixel_x, opixel_y;

//---------------------------------------------------------------
//	Horizontal	Parameters
parameter	H_FRONT	=	16;
parameter	H_RETRACE	=	96;
parameter	H_BACK	=	48;
parameter	H_DISPLAY	=	640;
parameter	H_ACTIVE	=	H_BACK + H_DISPLAY;
parameter	H_TOTAL	=	H_FRONT + H_DISPLAY + H_BACK + H_RETRACE;
//----------------------------------------------------------------
//	Vertical Parameters
parameter	V_FRONT	=	10;
parameter	V_RETRACE	=	2;
parameter	V_BACK	=	33;
parameter	V_DISPLAY	=	480;
parameter	V_ACTIVE =	H_BACK + H_DISPLAY;
parameter	V_TOTAL	=	V_FRONT + V_DISPLAY + V_BACK + V_RETRACE ;
//----------------------------------------------------------------

assign oVGA_CLK = iCLK_27MHz;
assign oVGA_SYNC = 1'b1; // oVGA_SYNC not used
assign oVGA_ACTIVE = ( (opixel_x > H_BACK & opixel_x < H_ACTIVE) & (opixel_y > V_BACK & opixel_y < V_ACTIVE) );

always @(posedge oVGA_CLK or negedge ireset_n) begin
	if (!ireset_n) begin
		opixel_x = 0;
		oVGA_HS = 1'b1;
	end
	else begin
		if (opixel_x < H_TOTAL)
			opixel_x = opixel_x + 1'b1;
		else 
			opixel_x = 0;
			
		//	Horizontal Sync
		if(opixel_x == H_FRONT + H_DISPLAY + H_BACK - 1)			//	Front porch end
			oVGA_HS	=	1'b0;
		if(opixel_x == H_FRONT + H_DISPLAY + H_BACK + H_RETRACE - 1)	//	Sync pulse end
			oVGA_HS	=	1'b1;
	end
end

always @(posedge oVGA_HS or negedge ireset_n) begin
	if (!ireset_n) begin
		opixel_y = 0;
		oVGA_VS = 1'b1;
	end
	else begin
		if (opixel_y < V_TOTAL)
			opixel_y = opixel_y + 1'b1;
		else begin
			opixel_y = 0;
		end
		
		//	Vertical Sync
		if(opixel_y == V_FRONT + V_DISPLAY + V_BACK - 1)	//	Front porch end
			oVGA_VS	=	1'b0;
		if(opixel_y == V_FRONT + V_DISPLAY + V_BACK + V_RETRACE - 1)	//	Sync pulse end
			oVGA_VS	=	1'b1;
	end
end

endmodule 
