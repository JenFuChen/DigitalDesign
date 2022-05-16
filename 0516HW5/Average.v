module Average(clk, reset, data, valid, out);
input        clk, reset;
input  [7:0] data;
output       valid;
output [7:0] out;
//===================== Your Design =====================
wire [8:0] sum;
reg [7:0] form1[15:0][7:0]; //  存資料
reg [7:0] form2[14:0][7:0]; //  輸出的
integer col = 0;
integer row = 0;
integer cnt = 0;
integer i,j;
//開始存資料
always @(clk)
begin
    form1[row][col] = data;
    col = col + 1;
	 cnt = cnt + 1;
    if( col % 8 == 0) 
    begin
        row = row + 1 ;
        col = 0;
    end
end
//===================== Your Design =====================
endmodule
