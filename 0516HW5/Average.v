module Average(clk, reset, data, valid, out);
input        clk, reset;
input  [7:0] data;
output reg valid;
output reg[7:0] out;
//===================== Your Design =====================
reg [8:0] sum;
reg [7:0] form1[127:0]; //  存輸入資料
reg [7:0] a,b; //   做加減
integer cnt = 0;
integer i;
//開始存資料
always @(posedge clk)
begin
    if(reset)
    begin
        valid = 1'b0;
        out = 8'b0000000;
        for(i = 0; i <127;i = i + 1)begin
            form1[i] <= 8'b00000000;
        end
    end
    else begin
        // 128 筆資料存入
        if(cnt <=127) begin
            form1[cnt] <= data;
            cnt <= cnt + 1;
            valid <= 1'b0;
        end
        // 存完之後改做這邊
        else begin
            for(i = 0; i <= 119; i = i + 1)begin
                a = form1[i];
                b = form1[i+8];
                sum = a + b;
                if(clk == 1)
                begin   
                    valid = 1'b1;
                    out = (sum >> 1) + sum[0];
                end
                else
                    valid = 1'b0;
            end
        end
    end
end
//===================== Your Design =====================
endmodule
