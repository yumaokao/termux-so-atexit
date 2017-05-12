all: a.out

libsoatexit.so: soatexit.o
	clang -g -shared -o $@ $<

soatexit.o: soatexit.c
	clang -g -c -o $@ $<

a.out: main.o libsoatexit.so
	clang -g -L. -lsoatexit -o $@ $<

main.o: main.c
	clang -g -c -o $@ $<

test_so_atexit:
	@LD_LIBRARY_PATH=./ ./a.out

gdb_so_atexit:
	@LD_LIBRARY_PATH="$LD_LIBRARY_PATH:./" gdb ./a.out

test_main_atexit:
	@LD_LIBRARY_PATH=./ ./a.out 1

clean:
	rm -f *.o *.so a.out issue933 core

# issue 933
issue933: issue933.c
	apt install -y clang libgpg-error-dev
	clang -o $@ $< -lgpg-error

test_issue933: issue933
	dpkg -i libgpg-error_1.27_aarch64.deb
	./issue933
