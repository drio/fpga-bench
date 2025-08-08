// test_crypto.c
#include <stdio.h>
#include <sys/auxv.h>

int main() {
    unsigned long hwcap = getauxval(AT_HWCAP);
    printf("HWCAP: 0x%lx\n", hwcap);
    
    if (hwcap & (1 << 6)) {  // HWCAP_SHA2
        printf("SHA2 crypto extensions are supported\n");
    } else {
        printf("SHA2 crypto extensions are NOT supported\n");
    }
    
    return 0;
}
