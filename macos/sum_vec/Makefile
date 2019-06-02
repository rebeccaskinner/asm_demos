.PHONY: all
all: addnums

%.o: %.asm
	nasm -fmacho64 $(<) -o $(@)

%.o: %.c
	gcc -c $(<) -o $(@)

addnums: addnums.o sumvec.asm
	ld -demangle -lto_library -dynamic -arch x86_64 -macosx_version_min 10.14.0 -lc $(^) -o $(@)

.PHONY: clean
clean:
	-rm -f addnums
	-rm -f *.o
