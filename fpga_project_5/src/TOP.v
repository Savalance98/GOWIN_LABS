module d_flip_flop
(
    input   clk,
    input   d,
    output  reg q
);

    always @ (posedge clk)
        q <= d;
 
endmodule

module TOP
(
    
    input  [ 1:0] btn,     // Замените на соответствующие входные сигналы кнопок на вашей плате
    output [ 4:0] LED     // Замените на соответствующие выходные сигналы светодиодов на вашей плате
);

    assign LED[4:1] = 4'b0;

    d_flip_flop d_flip_flop
    (
        .clk   ( ~btn[0] ),
        .d   ( ~btn[1] ),
        .q   (  LED[0] )
    );
endmodule
