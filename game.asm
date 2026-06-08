global _start


; machine code
section .text 

_start:
  call seed 

; debug output
  mov rax, 1
  mov rdi, 1
  mov rsi, rand_state
  mov rdx, 8 
  syscall

  call print_newline

  call x_or_shift

; second debug output
  mov rax, 1
  mov rdi, 1
  mov rsi, rand_state
  mov rdx, 64
  syscall

  call print_newline

  mov rax, 60 ; exit syscall
  mov rdi, 0
  syscall

print_newline:
  mov rax, 1
  mov rdi, 1
  mov rsi, newline
  mov rdx, 1
  syscall
  ret
 
seed:
; syscall to getrandom with the args
  mov rax, 318        ; getrandom 
  mov rdi, rand_state ; buffer
  mov rsi, 8          ; buffer_size
  xor rdx, rdx        ; flags
  syscall
  ret

x_or_shift:
  mov rax, [rel rand_state]
  mov rdx, rax
  shl rdx, 13           ; shift to the left
  xor rax, rdx

  mov rdx, rax
  shr rdx, 7
  xor rax, rdx

  mov rdx, rax
  shl rdx, 17
  xor rax, rdx

  mov [rel rand_state], rax
  ret

; read-only constants
section .rodata

  newline: db 10
 

; initialized writable data would be in .data


; unitialized / zeros writable data (Block Started by Symbol)
section .bss
  rand_state: resq 1 ; one quadword = 64 bit
