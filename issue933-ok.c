#define GPGRT_ENABLE_ES_MACROS
#include <gpg-error.h>
int main() {
    gpgrt_init();
    es_putc('A', es_stdout);
    exit(0);
}
