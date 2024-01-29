module dff_with_en
(
    input       clk,
    input       en,
    input       d,
    output reg  q
);

    always @ (posedge clk)
        if (en)
            q <= d;
 
endmodule


module TOP
(
    
    input  [ 2:0] btn,     // Замените на соответствующие входные сигналы кнопок на вашей плате
    output [ 4:0] LED     // Замените на соответствующие выходные сигналы светодиодов на вашей плате
);

    assign LED[4:1] = 4'b0;

    dff_with_en dff_with_en
    (
        .clk   ( ~btn[0] ),
        .en   ( btn[2] ),
        .d   (  ~btn[1] ),
        .q   (  LED[0] )
    );
endmodule
