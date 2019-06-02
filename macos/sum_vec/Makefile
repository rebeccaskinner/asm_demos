.PHONY: all
all: addnums hsAddNums

%.o: %.asm
	nasm -fmacho64 $(<) -o $(@)

%.o: %.c
	gcc -c $(<) -o $(@)

addnums: addnums.o sumvec.o
	gcc $(^) -o $(@)

%.o: %.hs
	ghc -c $(<) -o $(@)

hsAddNums: hsAddNums.o sumvec.o
	ghc $(^) -o $(@)

.PHONY: clean
clean:
	-rm -f addnums
	-rm -f hsAddNums
	-rm -f *.o
	-rm -f *.hi
