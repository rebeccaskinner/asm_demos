.PHONY: all
all: fibs

%.o: %.asm
	nasm -fmacho64 $(<) -o $(@)

fibs: fibs.o
	gcc -lc -Wl,-macosx_version_min,10.6 $(<) -o $(@)

.PHONY: clean
clean:
	-rm -f fibs
	-rm -f *.o
