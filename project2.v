`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   SUNY Buffalo
// Engineer: 	   Karthik Kiran
// Module Name:    project2
// Project Name:  Guess the Number in Verilog
//////////////////////////////////////////////////////////////////////////////////
module project2(clock, pins, btn, led, cathodes, anodes);
	input  clock;
	input [6:0] pins;
	input [3:0] btn;
   output reg [7:0] led = 8'b00000000;
	output reg [7:0] cathodes;
	output reg [3:0] anodes;
	reg [3:0] sw1;
	reg [3:0] sw2;
	reg [3:0] sw3;
	reg [3:0] sw4;
   integer count = 0;
	integer xvar = 0;
	integer cnt = 0;
	integer contestant = 1'b0;
	integer checkterm = 1'b1;
	integer seg3 = 8'b11111111;
	integer seg2 = 8'b11111111;
	integer seg1 = 8'b11111111;
	integer seg0 = 8'b11111111;
	integer playerone0 = 0;
	integer playerone1 = 0;
	integer playerone2 = 0;
	integer playerone3 = 0;
	integer playertwo0 = 0;
	integer playertwo1 = 0;
	integer playertwo2 = 0;
	integer playertwo3 = 0;
	integer equalcheck = 0;
	integer reset = 0;
	integer tries = 0;
	integer triesflag = 0;
	integer playeroneval;
	integer playertwoval;
		
	always @(posedge clock)
	begin
		if(equalcheck != 0)
		begin
			reset = 1;
		end
		else
		begin
			reset = 0;
		end
		
		if(reset == 1)
		begin
			if(equalcheck == 1)
			begin
				if(xvar < 10000000)
				begin
					led = 8'b11111111;
					triesflag = tries;
				end
				else if(xvar < 20000000)
				begin
					led = 8'b00000000;
					triesflag = tries;
				end
				else
				begin
					xvar = 0;
				end
				xvar = xvar + 1;
				seg3 = 8'b11111111;
				seg2 = 8'b11111111;
				seg1 = 8'b11111111;
	case(triesflag)
		0: seg0 = 8'b11000000;
		1: seg0 = 8'b11111001;
		2: seg0 = 8'b10100100;
		3: seg0 = 8'b10110000;
		4: seg0 = 8'b10011001;
		5: seg0 = 8'b10010010;
		6: seg0 = 8'b10000010;
		7: seg0 = 8'b11111000;
		8: seg0 = 8'b10000000;
		9: seg0 = 8'b10010000;
	  10: seg0 = 8'b10001000;
	  11: seg0 = 8'b10000011;
	  12: seg0 = 8'b11000110;
	  13: seg0 = 8'b10100001;
	  14: seg0 = 8'b10000110;
	  15: seg0 = 8'b10001110;
	  default: seg0 = 8'b11000000;
	endcase
	end
			else if(equalcheck == 2)
			begin
				seg3 = 8'b11111111;
				seg2 = 8'b10100100;
				seg1 = 8'b11000111;
				seg0 = 8'b11000000;
			end
			else
			begin
				seg3 = 8'b11111111;
				seg2 = 8'b10100100;
				seg1 = 8'b10001001;
				seg0 = 8'b11001111;
			end
			
			if(pins[5] == 0 && pins[4] == 1 && equalcheck != 1)
			begin
				checkterm = 0;
				equalcheck = 0;
			end
			
			if(pins[5] == 0 && pins[4] == 0 && equalcheck == 1)
			begin
				checkterm = 1;
				equalcheck = 0;
				count = 0;
				xvar = 0;
				contestant = 0;
				led = 0;
				tries = 0;
				triesflag = 0;
				seg0 = 8'b10111111;
				seg1 = 8'b10111111;
				seg2 = 8'b10111111;
				seg3 = 8'b10111111;
				playerone0 = 0;
				playerone1 = 0;
				playerone2 = 0;
				playerone3 = 0;
				playertwo0 = 0;
				playertwo1 = 0;
				playertwo2 = 0;
				playertwo3 = 0;
			end
		end
		else   
		begin
			if(pins[5] == 1 && contestant == 1)
			begin
	playeroneval = playerone3*1000+playerone2*100+playerone1*10+playerone0;
	playertwoval = playertwo3*1000+playertwo2*100+playertwo1*10+playertwo0;
	
				if(playeroneval==playertwoval)
				begin
					equalcheck = 1;
					tries = tries + 1;
				end
				else 
				if(playertwoval<playeroneval)
				begin
					equalcheck = 2;
					tries = tries + 1;
				end
				else
				begin
					equalcheck = 3;
					tries = tries + 1;
				end
			end	
			
			if(pins[4] != contestant)
			begin
				playerone0 = playertwo0;
				playerone1 = playertwo1;
				playerone2 = playertwo2;
				playerone3 = playertwo3;
				
				playertwo0 = 0;
				playertwo1 = 0;
				playertwo2 = 0;
				playertwo3 = 0;
				sw1=4'b0000;
				sw2=4'b0000;
				sw3=4'b0000;
				sw4=4'b0000;
				checkterm = 1;
				cnt = 0;
			end
			
			if (cnt < 15000 && pins[3:0] == 0)
			begin
			
			if(checkterm == 1)
			begin
				seg3 = 8'b10001100;
				seg2 = 8'b11000111;
				seg1 = 8'b11111111;
				
				if(pins[4] == 1'b0)
				begin
					contestant = 0;
					seg0 = 8'b11111001;
				end
				else
				begin
					contestant = 1;
					seg0 = 8'b10100100;
					
				end
			 end
				cnt = cnt + 1;
		end
		if(btn != 4'b0000)
			begin
				if(checkterm == 1)
				begin
					checkterm = 0;
					seg0 = 8'b11000000;
					seg1 = 8'b11000000;
					seg2 = 8'b11000000;
					seg3 = 8'b11000000;
				end
				else
				begin		         
				case (btn)
					4'b0001: sw1 = pins[3:0];
					4'b0010: sw2 = pins[3:0];
					4'b0100: sw3 = pins[3:0];
					4'b1000: sw4 = pins[3:0]; 
				endcase
     end						
   case(sw1)
   4'b0000 : playertwo0 = 0; //to display 0
   4'b0001 : playertwo0 = 1; //to display 1
   4'b0010 : playertwo0 = 2; //to display 2
   4'b0011 : playertwo0 = 3; //to display 3
   4'b0100 : playertwo0 = 4; //to display 4
   4'b0101 : playertwo0 = 5; //to display 5
   4'b0110 : playertwo0 = 6; //to display 6
   4'b0111 : playertwo0 = 7; //to display 7
   4'b1000 : playertwo0 = 8; //to display 8
   4'b1001 : playertwo0 = 9; //to display 9
   4'b1010 : playertwo0 = 10; //to display A
   4'b1011 : playertwo0 = 11; //to display B
   4'b1100 : playertwo0 = 12; //to display C
   4'b1101 : playertwo0 = 13; //to display D
   4'b1110 : playertwo0 = 14; //to display E
   4'b1111 : playertwo0 = 15; //to display F
   endcase
				
   case(sw2)
   4'b0000 : playertwo1 = 0; //to display 0
   4'b0001 : playertwo1 = 1; //to display 1
   4'b0010 : playertwo1 = 2; //to display 2
   4'b0011 : playertwo1 = 3; //to display 3
   4'b0100 : playertwo1 = 4; //to display 4
   4'b0101 : playertwo1 = 5; //to display 5
   4'b0110 : playertwo1 = 6; //to display 6
   4'b0111 : playertwo1 = 7; //to display 7
   4'b1000 : playertwo1 = 8; //to display 8
   4'b1001 : playertwo1 = 9; //to display 9
   4'b1010 : playertwo1 = 10; //to display A
   4'b1011 : playertwo1 = 11; //to display B
   4'b1100 : playertwo1 = 12; //to display C
   4'b1101 : playertwo1 = 13; //to display D
   4'b1110 : playertwo1 = 14; //to display E
   4'b1111 : playertwo1 = 15; //to display F
   endcase
				
   case(sw3)
   4'b0000 : playertwo2 = 0; //to display 0
   4'b0001 : playertwo2 = 1; //to display 1
   4'b0010 : playertwo2 = 2; //to display 2
   4'b0011 : playertwo2 = 3; //to display 3
   4'b0100 : playertwo2 = 4; //to display 4
   4'b0101 : playertwo2 = 5; //to display 5
   4'b0110 : playertwo2 = 6; //to display 6
   4'b0111 : playertwo2 = 7; //to display 7
   4'b1000 : playertwo2 = 8; //to display 8
   4'b1001 : playertwo2 = 9; //to display 9
   4'b1010 : playertwo2 = 10; //to display A
   4'b1011 : playertwo2 = 11; //to display B
   4'b1100 : playertwo2 = 12; //to display C
   4'b1101 : playertwo2 = 13; //to display D
   4'b1110 : playertwo2 = 14; //to display E
   4'b1111 : playertwo2 = 15; //to display F
   endcase
				
   case(sw4)
   4'b0000 : playertwo3 = 0; //to display 0
   4'b0001 : playertwo3 = 1; //to display 1
   4'b0010 : playertwo3 = 2; //to display 2
   4'b0011 : playertwo3 = 3; //to display 3
   4'b0100 : playertwo3 = 4; //to display 4
   4'b0101 : playertwo3 = 5; //to display 5
   4'b0110 : playertwo3 = 6; //to display 6
   4'b0111 : playertwo3 = 7; //to display 7
   4'b1000 : playertwo3 = 8; //to display 8
   4'b1001 : playertwo3 = 9; //to display 9
   4'b1010 : playertwo3 = 10; //to display A
   4'b1011 : playertwo3 = 11; //to display B
   4'b1100 : playertwo3 = 12; //to display C
   4'b1101 : playertwo3 = 13; //to display D
   4'b1110 : playertwo3 = 14; //to display E
   4'b1111 : playertwo3 = 15; //to display F
   endcase
						
	case(playertwo0)
	0: seg0 = 8'b11000000;
	1: seg0 = 8'b11111001;
	2: seg0 = 8'b10100100;
	3: seg0 = 8'b10110000;
	4: seg0 = 8'b10011001;
	5: seg0 = 8'b10010010;
	6: seg0 = 8'b10000010;
	7: seg0 = 8'b11111000;
	8: seg0 = 8'b10000000;
	9: seg0 = 8'b10010000;
	10: seg0 = 8'b10001000;
	11: seg0 = 8'b10000011;
	12: seg0 = 8'b11000110;
	13: seg0 = 8'b10100001;
	14: seg0 = 8'b10000110;
	15: seg0 = 8'b10001110;
	default: seg0 = 8'b11000000;
	endcase
	
	case(playertwo1)
	0: seg1 = 8'b11000000;
	1: seg1 = 8'b11111001;
	2: seg1 = 8'b10100100;
	3: seg1 = 8'b10110000;
	4: seg1 = 8'b10011001;
	5: seg1 = 8'b10010010;
	6: seg1 = 8'b10000010;
	7: seg1 = 8'b11111000;
	8: seg1 = 8'b10000000;
	9: seg1 = 8'b10010000;
	10: seg1 = 8'b10001000;
	11: seg1 = 8'b10000011;
	12: seg1 = 8'b11000110;
	13: seg1 = 8'b10100001;
	14: seg1 = 8'b10000110;
	15: seg1 = 8'b10001110;
	default: seg1 = 8'b11000000;
	endcase
	
	case(playertwo2)
	0: seg2 = 8'b11000000;
	1: seg2 = 8'b11111001;
	2: seg2 = 8'b10100100;
	3: seg2 = 8'b10110000;
	4: seg2 = 8'b10011001;
	5: seg2 = 8'b10010010;
	6: seg2 = 8'b10000010;
	7: seg2 = 8'b11111000;
	8: seg2 = 8'b10000000;
	9: seg2 = 8'b10010000;
	10: seg2 = 8'b10001000;
	11: seg2 = 8'b10000011;
	12: seg2 = 8'b11000110;
	13: seg2 = 8'b10100001;
	14: seg2 = 8'b10000110;
	15: seg2 = 8'b10001110;
	default: seg2 = 8'b11000000;
	endcase
	
	case(playertwo3)
	0: seg3 = 8'b11000000;
	1: seg3 = 8'b11111001;
	2: seg3 = 8'b10100100;
	3: seg3 = 8'b10110000;
	4: seg3 = 8'b10011001;
	5: seg3 = 8'b10010010;
	6: seg3 = 8'b10000010;
	7: seg3 = 8'b11111000;
	8: seg3 = 8'b10000000;
	9: seg3 = 8'b10010000;
	10: seg3 = 8'b10001000;
	11: seg3 = 8'b10000011;
	12: seg3 = 8'b11000110;
	13: seg3 = 8'b10100001;
	14: seg3 = 8'b10000110;
	15: seg3 = 8'b10001110;
	default: seg3 = 8'b11000000;
	endcase
	cnt = 0;
	end	
	end
						
	if(count <= 1500)
	begin
		anodes = 4'b0111;
		cathodes = seg0;
		count = count + 1;
	end
	else if(count <= 2000)
	begin
		anodes = 4'b1011;
		cathodes = seg1;
		count = count + 1;
	end
	else if(count <= 2500)
	begin
		anodes = 4'b1101;
		cathodes = seg2;
		count = count + 1;
	end
	else if(count <= 3000)
	begin
		anodes = 4'b1110;
		cathodes = seg3;
		count = count + 1;
	end
	else
	begin
		count = 0;
	end
end
endmodule