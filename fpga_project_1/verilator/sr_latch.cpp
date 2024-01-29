#include "Vsr_latch.h"
#include "verilated.h"

using namespace std;

int main(int argc, char** argv) {
  Verilated::commandArgs(argc, argv);

  Vsr_latch* top = new Vsr_latch;

  int s = 0;
  int r = 0;
  top -> s = s;
  top -> r = r;

  for (int i = 0; i < ; i ++) {
    top->eval();
    top -> s = ~(top -> s);
    top -> r = ~(top -> r);

    // cout << "q = " << top -> q << "q_n = " << top -> q_n;
    printf("q = %d, q_n = %d \n", top -> q, top -> q_n);

  }

  // Clean up
  delete top;
  exit(0);
}
