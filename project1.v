`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:22 06/08/2015 
// Design Name: 
// Module Name:    Karthik_Project1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
    module Project1(
    input reset1,
     input reset2,
     input reset3,
     input reset4,
     input clock,
     input [3:0] sw,
    output reg a,
    output reg b,
    output reg c,
    output reg d,
    output reg e,
    output reg f,
    output reg g,
    output reg dp,
    output [3:0] led,
    output reg [3:0] an
    );
   
	 reg [3:0] sw1;
	 reg [3:0] sw2;
	 reg [3:0] sw3;
	 reg [3:0] sw4;
    reg [3:0] an_temp;
    reg [7:0] seg1;
    reg [3:0] sw1_temp;
    reg slow_clock;    
    
        
assign led[3] = sw[3];
assign led[2] = sw[2];
assign led[1] = sw[1];
assign led[0] = sw[0];


always @(posedge clock)
create_slow_clock(clock, slow_clock);

always @ (posedge slow_clock)
 begin
 if(reset1)
 sw1=sw[3:0];
 if(reset2)
 sw2=sw[3:0];
 if(reset3)
 sw3=sw[3:0];
 if(reset4)
 sw4=sw[3:0];
 
	case(an_temp)
		4'b1110: an_temp = 4'b1101;
		4'b1101: an_temp = 4'b1011;
		4'b1011: an_temp = 4'b0111;
		4'b0111: an_temp = 4'b1110;
		default: an_temp = 4'b1110;
	endcase
    
 case(an_temp)
 4'b1111:
 begin
 seg1=8'b00000000;
 end
 4'b0111:
  begin
  case(sw4)
   4'b0000 : seg1 = 8'b10000001; //to display 0
   4'b0001 : seg1 = 8'b10011111; //to display 1
   4'b0010 : seg1 = 8'b01001001; //to display 2
   4'b0011 : seg1 = 8'b01100001; //to display 3
   4'b0100 : seg1 = 8'b00110011; //to display 4
   4'b0101 : seg1 = 8'b00100101; //to display 5
   4'b0110 : seg1 = 8'b00000101; //to display 6
   4'b0111 : seg1 = 8'b11110001; //to display 7
   4'b1000 : seg1 = 8'b00000001; //to display 8
   4'b1001 : seg1 = 8'b00110001; //to display 9
   4'b1010 : seg1 = 8'b00010001; //to display A
   4'b1011 : seg1 = 8'b00000111; //to display B
   4'b1100 : seg1 = 8'b10001101; //to display C
   4'b1101 : seg1 = 8'b01000011; //to display D
   4'b1110 : seg1 = 8'b00001101; //to display E
   4'b1111 : seg1 = 8'b00011101; //to display F
   endcase
    end

 4'b1011:
 begin
  case(sw3)
   4'b0000 : seg1 = 8'b10000001; //to display 0
   4'b0001 : seg1 = 8'b10011111; //to display 1
   4'b0010 : seg1 = 8'b01001001; //to display 2
   4'b0011 : seg1 = 8'b01100001; //to display 3
   4'b0100 : seg1 = 8'b00110011; //to display 4
   4'b0101 : seg1 = 8'b00100101; //to display 5
   4'b0110 : seg1 = 8'b00000101; //to display 6
   4'b0111 : seg1 = 8'b11110001; //to display 7
   4'b1000 : seg1 = 8'b00000001; //to display 8
   4'b1001 : seg1 = 8'b00110001; //to display 9
   4'b1010 : seg1 = 8'b00010001; //to display A
   4'b1011 : seg1 = 8'b00000111; //to display B
   4'b1100 : seg1 = 8'b10001101; //to display C
   4'b1101 : seg1 = 8'b01000011; //to display D
   4'b1110 : seg1 = 8'b00001101; //to display E
   4'b1111 : seg1 = 8'b00011101; //to display F
  endcase
  end
 
   4'b1101:
   begin
   case(sw2)
   4'b0000 : seg1 = 8'b10000001; //to display 0
   4'b0001 : seg1 = 8'b10011111; //to display 1
   4'b0010 : seg1 = 8'b01001001; //to display 2
   4'b0011 : seg1 = 8'b01100001; //to display 3
   4'b0100 : seg1 = 8'b00110011; //to display 4
   4'b0101 : seg1 = 8'b00100101; //to display 5
   4'b0110 : seg1 = 8'b00000101; //to display 6
   4'b0111 : seg1 = 8'b11110001; //to display 7
   4'b1000 : seg1 = 8'b00000001; //to display 8
   4'b1001 : seg1 = 8'b00110001; //to display 9
   4'b1010 : seg1 = 8'b00010001; //to display A
   4'b1011 : seg1 = 8'b00000111; //to display B
   4'b1100 : seg1 = 8'b10001101; //to display C
   4'b1101 : seg1 = 8'b01000011; //to display D
   4'b1110 : seg1 = 8'b00001101; //to display E
   4'b1111 : seg1 = 8'b00011101; //to display F
   endcase
   end
      
   4'b1110:
  begin
   case(sw1)
   4'b0000 : seg1 = 8'b10000001; //to display 0
   4'b0001 : seg1 = 8'b10011111; //to display 1
   4'b0010 : seg1 = 8'b01001001; //to display 2
   4'b0011 : seg1 = 8'b01100001; //to display 3
   4'b0100 : seg1 = 8'b00110011; //to display 4
   4'b0101 : seg1 = 8'b00100101; //to display 5
   4'b0110 : seg1 = 8'b00000101; //to display 6
   4'b0111 : seg1 = 8'b11110001; //to display 7
   4'b1000 : seg1 = 8'b00000001; //to display 8
   4'b1001 : seg1 = 8'b00110001; //to display 9
   4'b1010 : seg1 = 8'b00010001; //to display A
   4'b1011 : seg1 = 8'b00000111; //to display B
   4'b1100 : seg1 = 8'b10001101; //to display C
   4'b1101 : seg1 = 8'b01000011; //to display D
   4'b1110 : seg1 = 8'b00001101; //to display E
   4'b1111 : seg1 = 8'b00011101; //to display F
    endcase
    end
      
endcase


assign an = an_temp;
assign {g, f, e, d, c, b, a, dp} = seg1;
end

task create_slow_clock;
input clock;
inout slow_clock;
integer count;
begin
if (count > 25000)
begin
count=0;
slow_clock = ~slow_clock;
end
count = count+1;
end
endtask

endmodule