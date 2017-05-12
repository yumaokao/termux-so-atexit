all: a.out

libsoatexit.so: soatexit.o
	clang -shared -o $@ $<

soatexit.o: soatexit.c
	clang -c -o $@ $<

a.out: main.o libsoatexit.so
	clang -L. -lsoatexit -o $@ $<

main.o: main.c
	clang -c -o $@ $<

test_so_atexit:
	@LD_LIBRARY_PATH=./ ./a.out

test_main_atexit:
	@LD_LIBRARY_PATH=./ ./a.out 1

clean:
	rm -f *.o *.so a.out

# issue 933
issue933: issue933.c
	apt install -y clang libgpg-error-dev
	clang -o $@ $< -lgpg-error

test-issue933: issue933
	./issue933
