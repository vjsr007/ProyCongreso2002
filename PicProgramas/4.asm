;* Este programa Enciende en secuencia (uno a la vez) 8 LEDs conectados
;* a las patitas del puerto B
;**********************************************************************
LIST    p = 16f84
RADIX	HEX
INCLUDE <P16F84.INC>
P2 EQU 0x05
cont3 EQU 0x22
PORTB EQU 0x06
N EQU 0x1A
M EQU 0x0
cont1 EQU 0x20
cont2 EQU 0x21
org 0x0000
CLRF STATUS
CLRF PORTB
BSF STATUS,RP0
CLRF TRISB
BCF STATUS,RP0
CLRF PORTB
BSF PORTB,0
ciclo CALL d1seg
RLF PORTB,1
GOTO ciclo
;* Subrutina de Pausa de 1 segundo
;**********************************************************************
;
d1seg MOVLW P2 ;(1)carga duración del ciclo
MOVWF cont3 ;(1)inicializa contador3
ciclo2 CALL pau ;(196868)pausa de 0.197639 seg
DECFSZ cont3,1 ;(1,2)Decrementa y escapa si cero
GOTO ciclo2 ;(2)si no es cero repite
RETURN ;(2)si es cero retorna
;* Rutina de Pausa para tiempos largos
;* (Adecuada para un reloj de 4 Mhz)
;**************************************************************************
;Define constantes Para 20 milisegundos
;inicia rutina
pau MOVLW N ;(1) Carga dato N
MOVWF cont1 ;(1) inicializa contador1 ciclo externo
rep1 MOVLW M ;(1) Carga dato M
MOVWF cont2 ;(1) inicializa contador2 ciclo interno
rep2 DECFSZ cont2,1 ;(1,2)Decrementa contador2 y escapa si cero
GOTO rep2 ;(2) si no es cero, repite ciclo interno
DECFSZ cont1,1 ;(1,2)Decrementa contador1 y escapa si cero
GOTO rep1 ;(2) si no es cero repite ciclo externo
esc RETURN ;(2) regresa de esta subrutina
;
end
