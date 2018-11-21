module MaquinaEstados(SW, LEDR, LEDG, KEY);
	input [17:0]SW;
	input [3:0]KEY;
	
	output [17:0]LEDR;
	output [7:0]LEDG;
	
	assign LEDG[0] = ~KEY[0];
	assign LEDG[1] = ~KEY[1];
	Bloco teste(~KEY[0],~KEY[1],SW[0],SW[5:1],LEDG[7:2], LEDR[2:0]);



endmodule
