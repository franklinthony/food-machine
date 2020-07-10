module topLevelVendingMachine(
  input c, u, //    Botao 1, 2,
  input cima, baixo, enter, // Botao 3,4,5
  input clock, reset, // 50 MHz Clock
  
  output [9:0] led, // Led
  output sucesso,    // Parametro para afirmar se funcionou ou nao
  output pizza, burguer, torta, soda  // saidas da maquina
);

wire [5:0] saldo, gasto;
wire [10:0] balance_option;
wire [3:0] menu_option;

assign oVGA_R = 10'd0;
assign oVGA_G = 10'd0;
assign oVGA_B = 10'd0;

controle_de_saldo cds(.c(c), .u(u), .clock(clock), .reset(reset), .gastoIn(gasto), 
							 .sucesso(sucesso), .led(led), .saldoOut(saldo), .balance_option(balance_option));

menu main(.cima(cima), .baixo(baixo), .enter(enter), .clock(clock), .reset(reset), .saldoIn(saldo),
			 .pizza(pizza), .burguer(burguer), .torta(torta), .soda(soda), .gastoOut(gasto), .menu_option(menu_option));

endmodule