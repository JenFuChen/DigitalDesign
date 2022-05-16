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
<<<<<<< HEAD
end

for(i = 0; i <= 1; i = i + 1)
begin
    for(j = 0; j <= 7 ; j = j + 1)begin
        sum = (form1[i][j] + form1[i+1][j]);
        form2[i][j] = sum / 2;
=======
	 if(cnt >= 127)
	 begin
		 for(i = 0; i <= 14; i = i + 1)begin
			for(j = 0; j <= 7 ; j = j + 1)begin
				  assign sum = (form1[i][j] + form1[i+1][j]) /2 ;
				  form2[i][j] = sum ;
			end
		end
>>>>>>> c3efc3be3a626c5daaf7ac55f97796ef4e239a00
    end
end
//===================== Your Design =====================
endmodule
