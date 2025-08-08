CC = gcc
#CFLAGS = -O3 -mcpu=generic+crypto
CFLAGS = -O3 -mcpu=cortex-a72+crypto

sha256:sha256.c
	 $(CC) $(CFLAGS) sha256.c -Wall sha256-armv8-aarch64.S -o sha256

test-crypto: test-crypto.c
	 $(CC) $(CFLAGS) test-crypto.c -Wall -o test-crypto
	

