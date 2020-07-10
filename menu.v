module menu (cima, baixo, enter, clock, reset, saldoIn,
				 pizza, burguer, torta, soda, gastoOut, menu_option);

	input cima, baixo, enter;
	input clock, reset;
	input [5:0] saldoIn;
	wire clock_out;
	
	integer aux = 0;
	
	output reg pizza, burguer, torta, soda;
	output reg [5:0] gastoOut;
	output reg [3:0] menu_option;
	
	// Variaveis
	reg [2:0] estado_atual;
	reg [32:0] counter;

	parameter sPizza = 0, sBurguer = 1, sTorta = 2, sSoda = 3;
	parameter precoPizza = 45, precoBurguer = 40, precoTorta = 30, precoSoda = 25;

	
	always @(posedge clock) begin
		if (reset)
			counter <= 'd0;
		else
		   counter <= counter + 1;
	end 
	
	assign clock_out = counter[23];
	
	always @ (posedge clock_out, posedge reset) begin // sm mealy
		if (reset) begin
			estado_atual <= sPizza;
			gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
		end
		else begin
			case (estado_atual)
			sPizza: begin
				menu_option[3] <= 1; menu_option[2] <= 0; menu_option[1] <= 0; menu_option[0] <= 0; 
				if (~cima) begin
					estado_atual <= sBurguer;
					$display("hamburguer");
				end
				else if (~baixo) begin
					estado_atual <= sSoda;
					$display("soda else");
				end
				else if (enter) begin
					if(saldoIn != aux) begin
						aux = saldoIn;
						if(aux >= precoPizza) begin
							pizza = 1; burguer = 0; torta = 0; soda = 0;
							gastoOut = precoPizza;
						end 
						else begin
							gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
						end
					end
					else begin
						gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
					end
				end
				else begin
				end
			end
			sBurguer: begin
				menu_option[3] <= 0; menu_option[2] <= 1; menu_option[1] <= 0; menu_option[0] <= 0;
				if (~cima) begin
					estado_atual <= sTorta;
					$display("torta");
				end
				else if (~baixo) begin
					estado_atual <= sPizza;
					$display("pizza else");
				end
				else if (enter) begin
					if(saldoIn != aux) begin
						aux = saldoIn;
						if(aux >= precoBurguer) begin
							pizza = 0; burguer = 1; torta = 0; soda = 0;
							gastoOut = precoBurguer;
						end 
						else begin
							gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
						end
					end
					else begin
						gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
					end
				end
				else begin
				end
			end
			sTorta: begin
				menu_option[3] <= 0; menu_option[2] <= 0; menu_option[1] <= 1; menu_option[0] <= 0;
				if (~cima) begin
					estado_atual <= sSoda;
					$display("soda");
				end
				else if (~baixo) begin
					estado_atual <= sBurguer;
					$display("burguer else");
				end
				else if (enter) begin
					if(saldoIn != aux) begin
						aux = saldoIn;
						if(aux >= precoTorta) begin
							pizza = 0; burguer = 0; torta = 1; soda = 0;
							gastoOut = precoTorta;
						end 
						else begin
							gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
						end
					end
					else begin
						gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
					end
				end
				else begin
				end
			end
			sSoda: begin
				menu_option[3] <= 0; menu_option[2] <= 0; menu_option[1] <= 0; menu_option[0] <= 1;
				if (~cima) begin
					estado_atual <= sPizza;
					$display("pizza");
				end
					else if (~baixo) begin
					estado_atual <= sTorta;
					$display("torta else");
				end
				else if (enter) begin
					if(saldoIn != aux) begin
						aux = saldoIn;
						if(aux >= precoSoda) begin
							pizza = 0; burguer = 0; torta = 0; soda = 1;
							gastoOut = precoSoda;
						end 
						else begin
							gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
						end
					end
					else begin
						gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
					end
				end
				else begin
				end
			end
			default: begin
				$display("default menu");
				if (~cima) begin
					estado_atual <= sPizza;
					gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
				end
				else if (~baixo) begin
					estado_atual <= sPizza;
					gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
				end
				else begin
					estado_atual <= sPizza;
					gastoOut = 0; pizza = 0; burguer = 0; torta = 0; soda = 0;
				end
			end
			endcase
		end
	end
endmodule
