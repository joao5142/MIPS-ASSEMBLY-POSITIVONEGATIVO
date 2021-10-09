.data
msgpositivo:     .asciiz "Este numero é positivo\n"
msgnegativo:     .asciiz "Este numero é negativo\n"
msg:             .asciiz "Digite um numero:"
fim:             .asciiz "Fim do programa\n"
.text
 
li $v0,4         #Imprimir uma string
la $a0,msg       #a0=msg
syscall          #Executa

li $v0,5         #aguarda a entrada de um numero
syscall          #Executa
move $t0,$v0     #t0=v0

beq  $t0,$0,sair
jal  verifica    #Pula para o bloco de codigo verifica  

verifica:
bgt  $t0,$0,maior   #t0>0 vai pra o bloco "maior"
blt  $t0,$0,menor   #t0>0 vai pra o bloco "menor"

maior:
li $v0,4           #Prepara o processador v0 para imprimir uma string
la $a0,msgpositivo
syscall
j sair              #Vai para sair 

menor: 
li $v0,4            #Prepara o processador v0 para imprimir uma string  
la $a0,msgnegativo
syscall
j sair              #Vai para sair 

sair:
li $v0,4           #Prepara o processador v0 para imprimir uma string
la $a0,fim         #Imprime a string fim
syscall
li $v0,10          #Prepara o processador v0 para finalizar o programa 
syscall

