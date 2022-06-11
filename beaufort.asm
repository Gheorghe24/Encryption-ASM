%include "../include/io.mac"
section .data
    key_len dd 0
    text_len dd 0
    curr_key dd 0
    curr_text dd 0

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    mov dword [key_len], ecx
    mov dword [text_len], eax
    xor ecx, ecx
    xor eax, eax
parcurgere:
    mov dword [curr_key], ecx
    ;scad din caracterul din cheie caracterul din text
    mov ch, byte[edx + ecx]
    sub ch, byte[ebx + eax]
    ; verific daca diferenta e mai mica decat 0
    cmp ch, 0
    jl over
    jmp continuare

continuare:
    mov dword [curr_text], eax
    xor eax, eax
    mov al, ch
    xor ecx, ecx
    mov ch, byte[edi + eax]
    ;pun in textul criptat caracterul calculat mai sus
    
    mov [esi], ch
    inc esi
    ;merg mai departe in textul criptat

    mov eax, dword [curr_text]
    mov ecx, dword [curr_key]
    inc eax ;iterez pozitiile 
    inc ecx 
    ;verific daca s-a terminat textul 

    cmp eax, dword [text_len]
    je exit
    ;verific daca se termina cheia 

    cmp ecx, dword [key_len]
    je again
    jmp parcurgere
again:

;incep cu parcurgerea cheii de la inceput,practic e un ciclu

    xor ecx, ecx
    jmp parcurgere
;ptu acest caz, doar trebuie sa mai adaug 26 ca sa ajung iarasi la un caracter din alfabet

over:
    add ch, 26
    jmp continuare
  
exit:
    popa
    leave
    ret
   
