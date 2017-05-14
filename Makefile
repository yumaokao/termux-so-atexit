all: atexit-so-constructor atexit-so

atexit-so-constructor: main.c soatexit.c
	@clang -g -DUSE_CONSTRUCTOR -c -o soatexit.o soatexit.c
	@clang -g -DUSE_CONSTRUCTOR -shared -o libsoatexit.so soatexit.o
	@clang -g -DUSE_CONSTRUCTOR -L. -lsoatexit -o $@ main.c

atexit-so: main.c soatexit.c
	@clang -g -c -o soatexit.o soatexit.c
	@clang -g -shared -o libsoatexit.so soatexit.o
	@clang -g -L. -lsoatexit -o $@ main.c

test_atexit-so-constructor: atexit-so-constructor
	@echo "Should see messages and aborted"
	@LD_LIBRARY_PATH=./ ./atexit-so-constructor

test_atexit-so: atexit-so
	@echo "Should see messages and aborted"
	@LD_LIBRARY_PATH=./ ./atexit-so

test_atexit-main: atexit-so
	@echo "Should see messages and aborted"
	@LD_LIBRARY_PATH=./ ./atexit-so 1

gdb_atexit-so-constructor:
	@LD_LIBRARY_PATH="/data/data/com.termux/files/usr/lib:./" gdb ./atexit-so-constructor

gdb_atexit-so:
	@LD_LIBRARY_PATH="/data/data/com.termux/files/usr/lib:./" gdb ./atexit-so

clean:
	rm -f *.o *.so issue933 core atexit-*

# issue 933
issue933: issue933.c
	apt install -y clang libgpg-error-dev
	clang -o $@ $< -lgpg-error

issue933-ok: issue933-ok.c
	apt install -y clang libgpg-error-dev
	clang -o $@ $< -lgpg-error

test_issue933: issue933
	@[ -f libgpg-error_1.27_aarch64.deb ] && dpkg -i libgpg-error_1.27_aarch64.deb || echo -n
	@[ -f libgpg-error_1.27-1_aarch64.deb ] && dpkg -i libgpg-error_1.27-1_aarch64.deb || echo -n
	./issue933

test_issue933-ok: issue933-ok
	@[ -f libgpg-error_1.27_aarch64.deb ] && dpkg -i libgpg-error_1.27_aarch64.deb || echo -n
	@[ -f libgpg-error_1.27-1_aarch64.deb ] && dpkg -i libgpg-error_1.27-1_aarch64.deb || echo -n
	./issue933-ok
