#include <stdio.h>
#include "soatexit.h"

int register_atexit(void) {
    printf("ATEXIT\n");
    return 0;
}
