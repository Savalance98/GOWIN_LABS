#include "Vdff_async_rst_n.h"
#include "verilated.h"

using namespace std;

int main(int argc, char **argv)
{
    Verilated::commandArgs(argc, argv);

    Vdff_async_rst_n *top = new Vdff_async_rst_n;

    int clk = 0;
    int rst_n = 0;
    top->rst_n = rst_n;
    int d = 0;
    top->d = d;

    for (int i = 0; i < 10; i++)
    {
        clk = ~clk;
        rst_n = ~rst_n;
        d = d + 1;
        top->eval();
        top->clk = clk;
        top->rst_n = rst_n;
        top->d = d;

        // cout << "q = " << top -> q << "q_n = " << top -> q_n;
        printf("q = %d \n", top->q);
    }

    // Clean up
    delete top;
    exit(0);
}