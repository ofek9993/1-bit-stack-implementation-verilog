//LIFO stack implementation
module Stack(
  //Initialize all of our module components.
  input CLK,//Register clock.
  input data,//The data that enter our stack.
  input push,//Push command to push data in.
  input pop,//Pop command to pop data out.
  output D_out//The component that store our output data.
);
reg register_in[0:7];//Initialize an array of 8 registers each one is 1 bit-wide 
reg register_input[0:7];//Initialize an array of 8 register 1 bit wide to store our input data
//that we later on store in our register_in components.

//every positive edge of the clock we......
always @(posedge CLK) begin
  //Set the data in our registers to our input data.
   register_in[0]=register_input[0];
   register_in[1]=register_input[1];
   register_in[2]=register_input[2];
   register_in[3]=register_input[3];
   register_in[4]=register_input[4];
   register_in[5]=register_input[5];
   register_in[6]=register_input[6];
   register_in[7]=register_input[7];
end

always @(data,push,pop) begin//Combinational Block
  if (push) begin//If we chose to push data in, Then we set our input data as followed.
   register_input[7]=register_input[6];
   register_input[6]=register_input[5];
   register_input[5]=register_input[4];
   register_input[4]=register_input[3];
   register_input[3]=register_input[2];
   register_input[2]=register_input[1];
   register_input[1]=register_input[0];
   //Every bit of data is pushed in the stack except register in position 0 
   //that need to store our new data.
   register_input[0]=data;
  end
  else if (pop) begin
    //same logic here except our data flows backwards.
    register_input[0]=register_input[1];
    register_input[1]=register_input[2];
    register_input[2]=register_input[3];
    register_input[3]=register_input[4];
    register_input[4]=register_input[5];
    register_input[5]=register_input[6];
    register_input[6]=register_input[7];

  end
  else begin
  //else the data is unchanged.
   register_in[0]=register_input[0];
   register_in[1]=register_input[1];
   register_in[2]=register_input[2];
   register_in[3]=register_input[3];
   register_in[4]=register_input[4];
   register_in[5]=register_input[5];
   register_in[6]=register_input[6];
   register_in[7]=register_input[7];
  end
end
//set data_out to the value of our register in position 0 sence this is a LIFO data-structer,
//which means the last to enter is the first to pop. 
assign D_out = register_in[0];

endmodule