.PHONY: all
all: fibs cfibs hsfibs

%.o: %.asm
	nasm -fmacho64 $(<) -o $(@)

fibs: fibs.o
	ld -demangle -lto_library -dynamic -arch x86_64 -macosx_version_min 10.14.0 -lc $(<) -o $(@)

cfibs:
	gcc -O3 -std=gnu99 cfibs.c -o cfibs

hsfibs:
	ghc -O3 --make Main.hs -o hsfibs

.PHONY: clean
clean:
	-rm -f fibs
	-rm -f cfibs
	-rm -f hsfibs
	-rm -f Main.hi
	-rm -f *.o
