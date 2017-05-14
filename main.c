#include "soatexit.h"
#include <stdio.h>
#include <stdlib.h>

void main_atexit(void) {
    printf("atexit called from main\n");
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        atexit(main_atexit);
    } else {
#ifndef USE_CONSTRUCTOR
        register_atexit();
#endif
    }
    return 0;
}
