all: a.out

libsoatexit.so: soatexit.o
	clang -shared -o $@ $<

soatexit.o: soatexit.c
	clang -c -o $@ $<

a.out: main.o libsoatexit.so
	clang -L. -lsoatexit -o $@ $<

main.o: main.c
	clang -c -o $@ $<

run:
	@LD_LIBRARY_PATH=./ ./a.out

clean:
	rm -f *.o *.so a.out
