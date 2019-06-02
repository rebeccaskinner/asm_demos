.PHONY: all
all: addnums

%.o: %.asm
	nasm -fmacho64 $(<) -o $(@)

%.o: %.c
	gcc -c $(<) -o $(@)

addnums: addnums.o sumvec.o
	gcc $(^) -o $(@)

.PHONY: clean
clean:
	-rm -f addnums
	-rm -f *.o
