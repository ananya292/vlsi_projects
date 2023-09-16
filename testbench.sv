
module traffic_tb();
  wire [2:0] north,south,east,west;
  reg clock,reset;
  traffic t1(north,south,east,west,clock,reset);
   
  initial
    begin
      clock=1;
      forever #5 clock=~clock;
    end
  initial
    begin
      reset=1;
      #10 reset=0;
      $dumpfile("traffic_tb.vcd");
      $dumpvars(1,traffic_tb);
      $monitor("clock=%d,north road=%b,south road=%b,east road=%b,west road=%b,reset=%b",clock,north,south,east,west,reset);
      clock=0;
      #1000;
      $finish;
    end
endmodule