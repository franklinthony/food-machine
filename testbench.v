`timescale 1ns/10ps

module testbench();

reg c, u, cima, baixo, enter;
reg clock, reset;

reg [5:0] saldoIn, gastoIn;
wire [9:0] led;

wire pizza, burguer, torta, soda;
wire sucesso;

initial begin
    clock <= 0;
    reset <= 0; 
    #20;
    reset <= 1;	 
end

always begin
    #10 clock <= ~clock;
end

//topLevelVendingMachine tlvm(.c(c), .u(u), .cima(cima), .baixo(baixo), .enter(enter), 
	//								 .clock(clock), .reset(reset), .sucesso(sucesso), .led(led),
		//							 .pizza(pizza), .burguer(burguer), .torta(torta), .soda(soda));

initial begin
		#20
		u = 0;
		c = 1; #20; c = 0; #20;
		if(led[0] !== 1) $display("1st case didn't worked");
		if(!sucesso) $display("Operation didn't worked");

		c = 1; #20; c = 0; #20;
		if(led[1] !== 1) $display("2nd case didn't worked");
		if(!sucesso) $display("Operation didn't worked");

		c = 1; #20; c = 0; #20;
		if(led[2] !== 1) $display("3rd case didn't worked");
		if(!sucesso) $display("Operation didn't worked");

		c = 1; #20; c = 0; #20;
		if(led[3] !== 1) $display("4th case didn't worked");
		if(!sucesso) $display("Operation didn't worked");
		
		c = 1; #20; c = 0; #20;
		if(led[4] !== 1) $display("5th case didn't worked");
		if(!sucesso) $display("Operation didn't worked");

		c = 1; #20; c = 0; #20;
		if(led[5] !== 1) $display("6th case didn't worked");
		if(!sucesso) $display("Operation didn't worked");

		c = 1; #20; c = 0; #20;
		if(led[6] !== 1) $display("7th case didn't worked");
		if(!sucesso) $display("Operation didn't worked");

		c = 1; #20; c = 0; #20;
		if(led[7] !== 1) $display("8th case didn't worked");
		if(!sucesso) $display("Operation didn't worked");

		c = 1; #20; c = 0; #20;
		if(led[8] !== 1) $display("9th case didn't worked");
		if(!sucesso) $display("Operation didn't worked");

		c = 1; #20; c = 0; #20;
		if(led[9] !== 1) $display("10th case didn't worked");
		if(!sucesso) $display("Operation didn't worked");
		
		baixo = 0; enter = 0;
		cima = 1; #20; cima = 0; #20;
		cima = 1; #20; cima = 0; #20;
		cima = 1; #20; cima = 0; #20;
		
		enter = 1; #20; enter = 0; #20;
		
		$display("Saldo final: ");
		//$display(saldoOut);
		
		$finish();
	end
endmodule
