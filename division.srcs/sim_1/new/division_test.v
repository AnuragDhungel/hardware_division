`timescale 1ns / 1ps

module division_test(    );
    localparam BIT    = 64;
    localparam period = 20;
        reg  [ BIT  :0 ] CT,CL;
        reg  clk=0,start=1'b1,reset=1'b0;
        wire [ BIT  :0 ] inv_CT,inv_CL;

  

always #100 clk =~ clk;
division                                     
    #(BIT)
    UUT1(                                                    
        // Inputs   
        clk,
        start,
        reset,
        CL,                                         
        CT,                     
        inv_CL,
        inv_CT
    );


initial
    begin
        CT  = 65'b00100000000000000000000000000000000000000000000000000000000000000;//0.25
        CL = 65'b110011001100110011001100110011001100110011001100110011001101; //0.05
        
    end
 
     
endmodule
