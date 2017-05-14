#ifdef USE_CONSTRUCTOR
#define ATTR_CONSTRUCTOR __attribute__ ((__constructor__));
#else
#define ATTR_CONSTRUCTOR
#endif

int register_atexit(void);
int constructor_atexit(void) ATTR_CONSTRUCTOR;
