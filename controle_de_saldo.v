module controle_de_saldo (c, u, clock, reset, gastoIn,
						        sucesso, led, saldoOut, balance_option);

	input c, u;
	input clock, reset;
	wire clock_out;

	input [5:0] gastoIn;
	integer aux = 0, aux2 = 0;
	
	output reg [5:0] saldoOut;
	output reg [9:0] led;
	output reg sucesso;
	output reg [10:0] balance_option;

	// Variaveis
	reg [3:0] estado_atual;
	reg [32:0] counter;

	parameter s0 = 0, s50 = 1, s100 = 2, s150 = 3, s200 = 4, s250 = 5, s300 = 6, s350 = 7, s400 = 8, s450 = 9, s500 = 10;
	
	always @(posedge clock) begin
		if (reset)
			counter <= 'd0;
		else
		   counter <= counter + 1;
	end 
	
	assign clock_out = counter[23];
	
	always @ (posedge clock_out, posedge reset) begin // sm mealy
		if (reset) begin
			estado_atual <= s0;
			led[9:0] <= 0;
			saldoOut <= 0;
			sucesso <= 0;
			balance_option[0] <= 0;
			balance_option[1] <= 0;
			balance_option[2] <= 0;
			balance_option[3] <= 0;
			balance_option[4] <= 0;
			balance_option[5] <= 0;
			balance_option[6] <= 0;
			balance_option[7] <= 0;
			balance_option[8] <= 0;
			balance_option[9] <= 0;
			balance_option[10] <= 0;
		end
		else begin
			if(gastoIn != aux) begin
				aux = gastoIn;
				if(aux <= saldoOut && aux != 0) begin
					aux2 = aux / 5;
					aux = estado_atual - aux2;
					estado_atual = aux;
					saldoOut = estado_atual * 5;
					aux = gastoIn;
				end
				else begin
				end
			end 
			else begin
			end
			
			case (estado_atual)
				s0: begin
					if (~c) begin
						estado_atual <= s50;
						saldoOut <= 5;
						led[0] <= 1;
						led[9:1] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 1;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else if (~u) begin
						estado_atual <= s100;
						saldoOut <= 10;
						led[0] <= 1;
						led[1] <= 1;
						led[9:2] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 1;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else begin
					end
				end
				s50: begin
					if (~c) begin
						estado_atual <= s100;
						saldoOut <= 10;
						led[0] <= 1;
						led[1] <= 1;
						led[9:2] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 1;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else if (~u) begin
						estado_atual <= s150;
						saldoOut <= 15;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[9:3] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 1;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else begin
					end
				end
				s100: begin
					if (~c) begin
						estado_atual <= s150;
						saldoOut <= 15;
						sucesso <= 1;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[9:3] <= 0;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 1;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else if (~u) begin
						estado_atual <= s200;
						saldoOut <= 20;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[9:4] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 1;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else begin
					end
				end
				s150: begin
					if (~c) begin
						estado_atual <= s200;
						saldoOut <= 20;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[9:4] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 1;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else if (~u) begin
						estado_atual <= s250;
						saldoOut <= 25;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[9:5] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 1;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else begin
					end
				end
				s200: begin
					if (~c) begin
						estado_atual <= s250;
						saldoOut <= 25;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[9:5] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 1;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else if (~u) begin
						estado_atual <= s300;
						saldoOut <= 30;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[5] <= 1;
						led[9:6] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 1;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else begin
					end
				end
				s250: begin
					if (~c) begin
						estado_atual <= s300;
						saldoOut <= 30;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[5] <= 1;
						led[9:6] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 1;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else if (~u) begin
						estado_atual <= s350;
						saldoOut <= 35;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[5] <= 1;
						led[6] <= 1;
						led[9:7] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 1;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else begin
					end
				end
				s300: begin
					if (~c) begin
						estado_atual <= s350;
						saldoOut <= 35;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[5] <= 1;
						led[6] <= 1;
						led[9:7] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 1;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else if (~u) begin
						estado_atual <= s400;
						saldoOut <= 40;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[5] <= 1;
						led[6] <= 1;
						led[7] <= 1;
						led[9:8] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 1;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else begin
					end
				end
				s350: begin
					if (~c) begin
						estado_atual <= s400;
						saldoOut <= 40;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[5] <= 1;
						led[6] <= 1;
						led[7] <= 1;
						led[9:8] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 1;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else if (~u) begin
						estado_atual <= s450;
						saldoOut <= 45;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[5] <= 1;
						led[6] <= 1;
						led[7] <= 1;
						led[8] <= 1;
						led[9] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 1;
						balance_option[10] <= 0;
					end
					else begin
					end
				end
				s400: begin
					if (~c) begin
						estado_atual <= s450;
						saldoOut <= 45;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[5] <= 1;
						led[6] <= 1;
						led[7] <= 1;
						led[8] <= 1;
						led[9] <= 0;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 1;
						balance_option[10] <= 0;
					end
					else if (~u) begin
						estado_atual <= s500;
						saldoOut <= 50;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[5] <= 1;
						led[6] <= 1;
						led[7] <= 1;
						led[8] <= 1;
						led[9] <= 1;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 1;
					end
					else begin
					end
				end
				s450: begin
					if (~c) begin
						estado_atual <= s500;
						saldoOut <= 50;
						led[0] <= 1;
						led[1] <= 1;
						led[2] <= 1;
						led[3] <= 1;
						led[4] <= 1;
						led[5] <= 1;
						led[6] <= 1;
						led[7] <= 1;
						led[8] <= 1;
						led[9] <= 1;
						sucesso <= 1;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 1;
					end
					else if (~u) begin
						estado_atual <= s0;
						saldoOut <= 0;
						led[0] <= 0;
						led[1] <= 0;
						led[2] <= 0;
						led[3] <= 0;
						led[4] <= 0;
						led[5] <= 0;
						led[6] <= 0;
						led[7] <= 0;
						led[8] <= 0;
						led[9] <= 0;
						sucesso <= 0;
						balance_option[0] <= 0;
						balance_option[1] <= 0;
						balance_option[2] <= 0;
						balance_option[3] <= 0;
						balance_option[4] <= 0;
						balance_option[5] <= 0;
						balance_option[6] <= 0;
						balance_option[7] <= 0;
						balance_option[8] <= 0;
						balance_option[9] <= 0;
						balance_option[10] <= 0;
					end
					else begin
					end
				end
				default: begin
					$display("default saldoOut");
					if (~c) begin
						estado_atual <= s0;
						saldoOut <= 0;
						led[9:0] <= 0;
						sucesso <= 0;
					end
					else if (~u) begin
						estado_atual <= s0;
						saldoOut <= 0;
						led[9:0] <= 0;
						sucesso <= 0;
					end
					else begin
					end
				end
			endcase
		end
	end
endmodule
