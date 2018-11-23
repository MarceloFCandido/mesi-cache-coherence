module Bloco(CLK, CLR, Controle, CPU_event, BUS, state);

	input CLK, CLR, Controle;
	input [4:0] CPU_event;
	output reg[5:0] BUS;
	output reg [2:0] state;


	always @(posedge CLK, posedge CLR) begin

		// Cinco bits para os eventos da CPU
		// 4 		3 		2 		1		0
		// inv   wh    wm    rh    rm
		// sendo:
		// - inv: invalid
		// - wh: write hit
		// - wm: write miss
		// - rh: read hit
		// - rm: read miss

		// Sinais que podem passar pelo BUS
		// 001 - write-back block
		// 010 - abort memory access

		if (CLR) begin
			state = 3'b001;
			BUS = 6'b000_000;
		end else begin
			if(~Controle)begin
			//Ouvinte
			BUS = 6'b000000;
				case (state)
					3'b001: begin // Invalid
						// NADA
					end
					3'b010: begin // Shared
						case (CPU_event)
							5'b10000: begin // sinal de invalido
								state = 3'b001; // vai para invalid
							end
							5'b00100: begin // write miss
								state = 3'b001; // vai para invalid
							end
							5'b00001: begin // read miss
								// NADA
							end
						endcase
					end
					3'b011: begin // Exclusive
						case (CPU_event)
							5'b10000: begin // sinal de invalido
								state = 3'b001; // vai para invalid
							end
							5'b00100: begin // write miss
								state = 3'b001; // vai para invalid
							end
							5'b00001: begin // read miss
								state = 3'b010; // vai para shared
							end
						endcase
					end
					3'b100: begin // Modified
						case (CPU_event)
							5'b00001: begin // read miss
								state = 3'b010; // vai para shared
								BUS = {3'b010, 3'b001}; // abort memory access/ write-back block
							end
							5'b00100: begin	//Write miss
								state = 3'b010; // vai para shared
								BUS = {3'b010, 3'b001}; // abort memory access/ write-back block
							end
						endcase
					end
				endcase
			end

			if(Controle) begin
				//Emissor

				// Sinais que podem passar pelo BUS
				// 001 - read miss
				// 010 - write miss
				// 011 - write-back cache block
				// 100 - invalidate

				// Cinco bits para os eventos da CPU
				// 4	3	2	1	0
				// sh   wh  wm  rh  rm
				// sendo:
				// - sh: no shares; 1 -> other shared block (bit auxiliar)
				// - wh: write hit
				// - wm: write miss
				// - rh: read hit
				// - rm: read miss

				BUS = 6'b000000;
				case (state)
					3'b001: begin // estado invalido
						case (CPU_event)
							5'b00010: begin // CPU read hit, no shares
								state = 3'b011; // passa para o exclusive
								BUS = {3'b000, 3'b001}; // read miss
							end
							5'b00001: begin // CPU read miss, no shares
								state = 3'b011; // passa para o exclusive
								BUS = {3'b000, 3'b001}; // read miss
							end
							5'b10001: begin // CPU read miss, other shared block
								state = 3'b010; // passa para o shared
								BUS = {3'b000, 3'b001}; // read miss
							end
							5'b01000: begin // CPU write hit
								state = 3'b100; // passa para o modified
								BUS = {3'b000, 3'b010}; // write miss
							end
							5'b00100: begin // CPU write miss
								state = 3'b100; // passa para o modified
								BUS = {3'b000, 3'b010}; // write miss
							end
						endcase
					end
					3'b010: begin // estado shared
						case (CPU_event)
							5'b00010: begin // read hit
								// Nada
							end
							5'b00001: begin // read miss
								BUS = {3'b000, 3'b001}; // read miss
							end
							5'b01000: begin // write hit
								state = 3'b100; // vai para modified
								BUS = {3'b000, 3'b100}; // invalidate
							end
							5'b00100: begin // write miss
								state = 3'b100; // vai para modified
								BUS = {3'b010, 3'b100}; // write miss / invalidate
							end
						endcase
					end
					3'b011: begin // estado exclusive
						case (CPU_event)
							5'b00010: begin // read hit
								// Nada
							end
							5'b00001: begin // read miss
								state = 3'b010; // vai para shared
							end
							5'b01000: begin // write hit
								state = 3'b100; // vai para modified
							end
							5'b00100: begin // write miss
								state = 3'b100; // vai para modified
								BUS = {3'b000, 3'b010}; // write miss
							end
						endcase
					end
					3'b100: begin // estado modified
						case (CPU_event)
							5'b00010: begin // read hit
								// Nada
							end
							5'b01000: begin // write hit
								// Nada
							end
							5'b00100: begin // write miss
								BUS = {3'b001, 3'b011}; // read miss, write-back
							end
							5'b00001: begin // read miss
								state = 3'b010;
								BUS = {3'b001, 3'b011}; //read miss, write-back
							end
						endcase
					end
				endcase
			end
		end
	end

endmodule
