game: init main.o io.o
	ld build/main.o build/io.o -o build/game

init:
	mkdir -p build

main.o: src/main.asm
	nasm -f elf64 src/main.asm -o build/main.o

io.o: src/io.asm
	nasm -f elf64 src/io.asm -o build/io.o

clean:
	rm -rf build/ 
