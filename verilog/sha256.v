`default_nettype none `timescale 1 ns / 1ns

module sha256(
  input logic clk
);

typedef logic [7:0]  BYTE;   // 8-bit byte (char)
typedef int unsigned WORD;   // 32-bit word, change to "long" for 16-bit machines

typedef struct packed {
  BYTE data[64];
	WORD datalen, state[8];
	logic [63:0] bitlen; // instead of unsigned long long
} SHA256_CTX;

endmodule
