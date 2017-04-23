all: libsoatexit.so

libsoatexit.so: soatexit.o
	clang -shared -o $@ $<

soatexit.o: soatexit.c
	clang -c -o $@ $<

clean:
	rm -f *.o *.so
