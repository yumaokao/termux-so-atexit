#include <stdio.h>
#include "soatexit.h"

static void so_atexit(void) {
    printf("atexit called from shared library\n");
    abort();
}

int register_atexit(void) {
    atexit(so_atexit);
    return 0;
}
