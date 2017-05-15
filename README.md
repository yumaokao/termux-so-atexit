# termux-so-atexit

This repo is about verification of **`atexit`** on Android in **termux**.

Includes several test .c files which used to figure out the issue [#933]

## Setup
It's easy to setup the repo to run the verification under **termux**.

```
$ apt install hub
$ hub clone yumaokao/termux-so-atexit
$ cd termux-so-atexit
```

## Verification
To check **atexit called from shared library** is printed out or not.
```
$ make test_atexit-so-constructor
Should see messages and aborted
atexit called from shared library
make: *** [Makefile:15: test_atexit-so-constructor] Aborted
```

## Make Targets
There are several targets in Makefile.
1. test_atexit-so-constructor:
    - `atexit` is called from a function decorated with `__attribute__ ((__constructor__));`
    - expected to see: **atexit called from shared library**
1. test_atexit-so
    - `atexit` is called from a function in shared library
    - expected to see: **atexit called from shared library**
1. test_atexit-so-main
    - `atexit` is called from main executable
    - expected to see: **atexit called from main**
1. test_issue933
    - original test code in issue [#933]
1. test_issue933-ok
    - modified version for issue [#933]

[#933]: https://github.com/termux/termux-packages/issues/933
