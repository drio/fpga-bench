#include <stdio.h>
#include <string.h>
#include <time.h>
#include <stdlib.h>
#include "sha256.h"

#define BENCHMARK_SECONDS 10  // Change this to desired benchmark duration

int main(int argc, char *argv[]) {
    SHA256_CTX ctx;
    BYTE hash[SHA256_BLOCK_SIZE];
    char input_buffer[64];
    unsigned long long hash_count = 0;
    time_t start_time, current_time;
    int duration = BENCHMARK_SECONDS;

    // Allow duration to be specified as command line argument
    if (argc > 1) {
        duration = atoi(argv[1]);
        if (duration <= 0) {
            printf("Invalid duration. Using default %d seconds.\n", BENCHMARK_SECONDS);
            duration = BENCHMARK_SECONDS;
        }
    }

    printf("Starting SHA-256 benchmark for %d seconds...\n", duration);

    // Record start time
    start_time = time(NULL);
    current_time = start_time;  // Initialize current_time


    // Benchmark loop
    do {
        // Generate new input by using counter as part of the string
        snprintf(input_buffer, sizeof(input_buffer), "Hello, World! #%llu", hash_count);

        // Initialize and compute hash
        sha256_init(&ctx);
        sha256_update(&ctx, (BYTE*)input_buffer, strlen(input_buffer));
        sha256_final(&ctx, hash);

        hash_count++;

        // Check time every 10000 hashes to reduce system call overhead
        if (hash_count <= 100 || hash_count % 1000 == 0) {
            current_time = time(NULL);
        }

    } while ((current_time - start_time) < duration);

    // Final time check
    current_time = time(NULL);
    double elapsed_time = difftime(current_time, start_time);

    // Calculate and display results
    double hashes_per_second = hash_count / elapsed_time;
    double megahashes_per_second = hashes_per_second / 1000000.0;

    printf("\nBenchmark Results:\n");
    printf("Duration: %.0f seconds\n", elapsed_time);
    printf("Total hashes: %llu\n", hash_count);
    printf("Hashes per second: %.2f\n", hashes_per_second);
    printf("Megahashes per second: %.2f MH/s\n", megahashes_per_second);

    // Display the last hash as verification
    printf("\nLast hash computed: ");
    for (int i = 0; i < SHA256_BLOCK_SIZE; i++) {
        printf("%02x", hash[i]);
    }
    printf("\nLast input: %s\n", input_buffer);

    return 0;
}
