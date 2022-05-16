module Average(clk, reset, data, valid, out);
input        clk, reset;
input  [7:0] data;
output reg[1:0] valid;
output reg[7:0] out;
//===================== Your Design =====================
reg [8:0] sum;
reg [7:0] form1[127:0]; //  存輸入資料
reg [7:0] a,b; //   做加減
integer cnt = 0;
integer i,j;
//開始存資料
always @(posedge clk)
begin
    if(reset)
    begin
        for(i = 0; i <127;i = i + 1)begin
            form1[i] = 8'b00000000;
        end
    end
    else begin
        if(cnt <=127) begin
            form1[cnt] = data;
            cnt = cnt + 1;
            valid = 1'b0;
        end
        else begin
            for(i = 0; i <= 119; i = i + 1)begin
                a = form1[i];
                b = form1[i+8];
                sum = a + b;
                out = sum[8:1]+sum[0];
                if(clk)
                    valid = 1'b1;
                else
                    valid = 1'b0;
            end
        end
    end
end
//===================== Your Design =====================
endmodule
