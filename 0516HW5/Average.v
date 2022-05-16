module Average(clk, reset, data, valid, out);
input        clk, reset;
input  [7:0] data;
output reg valid;
output reg[7:0] out;
//===================== Your Design =====================
reg [8:0] sum;
reg [7:0] form1[127:0]; //  �s��J���
integer cnt = 0, i = 0, j = 0;
//�}�l�s���
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
        // 128 ����Ʀs�J
        if(cnt <=127) begin
            form1[cnt] <= data;
            cnt <= cnt + 1;
            valid <= 1'b0;
        end
        // �s������ﰵ�o��
        else begin
            valid = 1'b0;
            if(j < 120)begin
                sum = form1[j][7:0] + form1[j+8][7:0];
                out = (sum >> 1) + sum[0];
                valid = 1'b1;
                j = j + 1;    
            end
        end
    end
end
//===================== Your Design =====================
endmodule
