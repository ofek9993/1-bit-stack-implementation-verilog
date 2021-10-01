`timescale 1ns/1ns
`include "Stack.v"
module stack_tb;

// Inputs
reg data_in=0,clk=0;
reg push=0;
reg pop=0;

// Outputs
wire data_out;

 // Instantiate the Unit Under Test (UUT)
Stack uut(
  .CLK(clk),
  .data(data_in),
  .push(push),
  .pop(pop),
  .D_out(data_out)
);

always begin
  clk=~clk;
  #5;
end

//Read stack opertion which set push to 0 then pop to 1, Then our pop command in Stack.v file
//is initialize. After that we wait 7 sec and then set pop to 0 again. 
task read_stack();
begin
  push=1'b0;
  pop=1'b1;
  #7;
  pop=1'b0;
end
endtask

//Write stack opertion which get data later on in our test batch set pop to 0 push to 1 
//After that we set our input stack input data to our new datat then, We wait 7 sec and set push to 0
task write_stack(input data);
begin
  pop=1'b0;
  push=1'b1;
  data_in=data;
  #7;
  push=1'b0;
end
endtask

initial begin//main test bench code....
    $dumpfile("stack.vcd");
    $dumpvars(0,stack_tb);
    write_stack(1'b0);//First, We write to our 1 bit stack a 0 data bit.
    //wait 7 sec
    #7;
    //Then we write to our stack 2 bits one holds the value of 1 and the other the value of 0.
    //We repeat this process twice.
    repeat(2)begin
       write_stack(1'b1);
       #7;
       write_stack(1'b0);
       #7;
    end
    //after process ends we hold for 7 sec
    #7;
    //After that we write 2 bits to our stack with the value of 1 
    //we repeat twice
    repeat(2)begin
       write_stack(1'b1);
       #7;
    end
    //hold
    #7;
    //Finally, We end our test bench with our read stack opertion, Which help us see and read all the 
    //data we have written to our stack.
    repeat(6)begin
      read_stack();
      #7;
    end
    #7;
    $display("test complete");
    $finish;
end
endmodule