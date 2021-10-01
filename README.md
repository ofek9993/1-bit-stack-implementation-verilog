# 1-bit-width-8-bit-depth-stack-implementation

This project consisnt of 2 parts. 
In the first part i will describe how i implemented my 1-bit stack design using an electric circuit i build via logisim program.
In the seconde part i will analyze the gtkwave data that is based on my verilog code and verilog test bench i'v written.
Also i will upload all of my verilog code and verilog test bench. All of these files are well explained via comments.

# Logical part and electric circuit design
My 1-bit stack implementation uses the basic stack functions which is push and pop. 
In this photo you can easly visualized my stack module process 
![stack_explain](https://user-images.githubusercontent.com/43711624/135645845-5016d237-bed0-453d-8a91-08b509ce3cfb.png)

In first glance you can see that my stack implementation uses 8 one bit registers in total. Our controller variable Determine which of our basic operation is working. Mux gates help us in our determination process. If our controller Equals to 0 data is inserted via "Din" variable from left to right, If our controller Equals to 1 then we perfore our pop operation and our data get's pushed from right to left. Our last bit of data that got inserted is the first one to go out because stack is a Lifo data structure. Our bits of data stored in "Dout" variable which holds our last data input, And when pop operation is preformed it's assign to "Dout" variable our next data bit in line.
Here is a video of my stack module in process to give a better example of what i just explained.

![stack vid](https://user-images.githubusercontent.com/43711624/135649966-13037c77-5ef8-4030-b010-5c1add473b8f.gif)

# Analyzing verilog gtkwave data
I recommend to see the verilog V files that where attached to this repositorie to better understand the analyzing process.

![stack_verilog_gtkwave_1](https://user-images.githubusercontent.com/43711624/135651647-69eb81c4-98b5-4b81-b5ef-95e3f6fe04e4.png)

Like our logisim circuit we can see here that we have the same variables. Clock variable for our reigisters and Data_in and Data_out that represent "Din" and "Dout" respectively. Also we have our push and pop operations. We can easliy see that in our test bench we perform 7 push and 6 pop operations. At the begining we performed a push operation with the value 0 respectively we can see that "Data_out" is now 0 as well. We can see our stack functionality more clearly in the folloing photo.

![stack_verilog_gtkwave_2](https://user-images.githubusercontent.com/43711624/135652962-1353f2d4-e46e-4d2b-b52c-b110eebf9d51.png)

As we can easily see, Marked by the red line. We performed a push operation and set the value of our Data_in to 1. Later on we see, Marked by the yellow line. That "Data_out" value updates only when we reach the positive edge of the clock. We keep inserting data to our stack and then we perform 6 pop operations. Respectively we see that all of our data that got inserted to our stack pop's out exactly like our logisim module.

# verilog files

you can find all of the verilog code i'v wirtten to implement this stack module plus a test bench code. These files will be named stack.v and stack_tb.v for stack module and stack test bench respectively.
