# 1-bit-wdith-8-bit-depth-stack-implementation

This project consisnt of 2 parts. 
In the first part i will describe how i implemented my 1-bit stack design using an electric circuit i build via logisim program.
In the seconde part i will analyze the gtkwave data that is based on my verilog code and verilog test bench i'v written.
Also i will upload all of my verilog code and verilog test bench. All of these files are well explained via comments.

# logical part and electric circuit design
My 1-bit stack implementation uses the basic stack functions which is push and pop. 
In this photo you can easly visualized my stack module process 
![stack_explain](https://user-images.githubusercontent.com/43711624/135645845-5016d237-bed0-453d-8a91-08b509ce3cfb.png)

In first glance you can see that my stack implementation uses 8 one bit registers in total. Our controller variable Determine which of our basic operation is working. Mux gates help us in our determination process. If our controller Equals to 0 data is inserted via "Din" variable from left to right, If our controller Equals to 1 then we perfore our pop operation and our data get's pushed from right to left and our last bit of data that got inserted is the first one to go out because stack is a Lifo data structure. Our bits of data stored in "Dout" variable which holds our last data input, And when pop operation is preformed it's assign to "Dout" variable our next data bit in line.
Here is a video of my stack module in process to give a better example of what i just explained.

![stack vid](https://user-images.githubusercontent.com/43711624/135649966-13037c77-5ef8-4030-b010-5c1add473b8f.gif)
