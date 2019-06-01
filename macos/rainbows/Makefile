.PHONY: all
all: rainbows

%.o: %.asm
	nasm -fmacho64 $(<) -o $(@)

rainbows: rainbows.o
	ld -lSystem -macosx_version_min 10.6 $(<) -o $(@)

.PHONY: clean
clean:
	-rm -f rainbows
	-rm -f *.o
