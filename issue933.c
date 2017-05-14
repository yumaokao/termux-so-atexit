#define GPGRT_ENABLE_ES_MACROS
#include <gpg-error.h>
/* #include <stdio.h>
#include <stdlib.h>

void main_atexit(void) {
    printf("atexit called from main\n");
} */

int main() {
    /* printf("atexit(main_atexit)\n");
    atexit(main_atexit); */
    es_putc('A', es_stdout);
    exit(0);
}
