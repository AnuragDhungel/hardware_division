`timescale 1ns / 1ps
module division
 #(parameter BIT = 64)//Module parametrization           //
 (
    input clk,
    input start,
    input reset,
    input  unsigned [ BIT : 0 ] CL,                      //    
    input  unsigned [ BIT : 0 ] CT,                      // 
    output unsigned [ BIT : 0 ] inv_CL,
    output unsigned [ BIT : 0 ] inv_CT
    );
reg unsigned [BIT + 1 : 0] divisor;
reg unsigned [BIT + 1 : 0] divident,temp_divident;
reg unsigned [BIT +1 : 0 ] quotient=0;
reg unsigned [BIT  +1 : 0] quotient_ready=0;
reg unsigned [ BIT : 0 ] one =1'b1<<BIT;
reg [8:0]counter=0;


always @(posedge clk) begin
if (reset==1'b0) begin
if ((counter > 9'b0)&& (counter < 9'b1000011)) begin
    if ( divident >= divisor)begin
        temp_divident=divident-divisor;
        divident=temp_divident<<1;
        quotient={quotient[BIT :0],1'b1};
        end
    else begin
        divident<=divident<<1;
        quotient<=quotient<<1;
    end
    counter<=counter+1;
end
else if ((counter ==9'b0) && (start==1'b1)) begin
    divisor<=CL+CT;
    divident<= CL;
    counter<=counter+1;
end   
else if (counter == 9'b1000011) begin 
    quotient_ready<=quotient; 
end
end
else begin
    counter<=0;
end
end
assign inv_CL=quotient_ready[BIT+1:1]+quotient_ready[0];
assign inv_CT=one-inv_CL;
endmodule
