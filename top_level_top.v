module topLevel_top(
  input c, u, //    Botao 1, 2,
  input cima, baixo, enter, // Botao 3,4,5
  input clock, reset, // 50 MHz Clock
  
  output [9:0] led, // Led
  output [3:0] ledTeste,
  output sucesso,    // Parametro para afirmar se funcionou ou nao
  output pizza, burguer, torta, soda    // saidas da maquina
  );
	
wire [5:0] saldo, gasto;

controle_de_saldo cds(.c(c), .u(u), .clock(clock), .reset(reset), .gastoIn(gasto), 
								           .sucesso(sucesso), .led(led), .saldoOut(saldo));

menu main(.cima(cima), .baixo(baixo), .enter(enter), .clock(clock), .reset(reset), .saldoIn(saldo),
						  .pizza(pizza), .burguer(burguer), .torta(torta), .soda(soda), .gastoOut(gasto), .ledTeste(ledTeste));

endmodule