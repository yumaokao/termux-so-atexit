#include <stdio.h>
#include "soatexit.h"

void so_atexit(void) {
    printf("atexit called from shared library\n");
}

int register_atexit(void) {
    atexit(so_atexit);
    return 0;
}
