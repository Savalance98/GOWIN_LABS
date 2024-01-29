module sr_latch
(
    input   s,
    input   r,
    output  q,
    output  q_n
);
    assign q   = ~ ( r | q_n );
    assign q_n = ~ ( s | q   );

endmodule

module d_latch
(
    input   clk,
    input   d,
    output  q,
    output  q_n
);
    wire r = ~d & clk;
    wire s = d & clk;

    sr_latch sr_latch (s, r, q, q_n);

endmodule


module d_flip_flop
(
    input   clk,
    input   d,
    output  q,
    output  q_n
);
    wire n1;

    d_latch master
    (
        .clk ( ~clk ),
        .d   ( d    ),
        .q   ( n1   )
    );

    d_latch slave
    (
        .clk ( clk ),
        .d   ( n1  ),
        .q   ( q   ),
        .q_n ( q_n )
    );

endmodule



module TOP
(
    
    input  [ 1:0] btn,     // Замените на соответствующие входные сигналы кнопок на вашей плате
    output [ 4:0] LED     // Замените на соответствующие выходные сигналы светодиодов на вашей плате
);

    assign LED[4:2] = 3'b0;

    d_flip_flop d_flip_flop
    (
        .clk   ( ~btn[0] ),
        .d   ( ~btn[1] ),
        .q   (  LED[0] ),
        .q_n (  LED[1] )
    );
endmodule
