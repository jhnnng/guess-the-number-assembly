# guess-the-number-assembly
An implementation of the _Guess the Number_ game in pure x86-64 Assembly

# WORK IN PROGRESS!

## About
The _Guess the Number_ game is a commonly used as a fairly trivial coding example: 
The _computer_ comes up with a random integer in a defined range and the user has to guess that number but making guesses and receiving feedback if the proposed number was higher / lower as the number imagined by the computer or if the user found the correct solution.
The author of this repository tries to implement this in the _Assembly Language_ for the _x86-64_ architecture.

## Building and Linking
The program can be built and linked via

```
nasm -f elf64 -o game.o game.asm && ld -o game game.o
```


