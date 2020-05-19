;
LIST P = P16F877
Include <p16f877.inc>
cont EQU 0x20
org 0x0000
BSF STATUS,RP0 ;Banco 1
CLRF ADCON1 ;configura 8 canales analógicos, VREF+=VDD y VREF-=VSS
BSF ADCON1,ADFM ;Elije resultado con justificación a la derecha
BSF TRISA,5 ;configura como entrada el canal digital RA0
CLRF TRISB
CLRF TRISC
BCF STATUS,RP0 ;Banco 0
CLRF PORTB
CLRF PORTC
MOVLW 0x21 ;Selecciona el canal AN4, reloj de conversión Fosc/2
MOVWF ADCON0 ;y enciende el convertidor
ciclo CALL pausa ;espera 30 µseg a que pase el tiempo de adquisición
BSF ADCON0,2 ;inicia conversión
espera BTFSC ADCON0,2;GO/DONE
GOTO espera ;Espera a que termine la conversión
MOVF ADRESH,W ;Carga en W el Byte alto del resultado
MOVWF PORTB
BSF STATUS,RP0 ;banco 1
MOVF ADRESL,W ;Carga en W el Byte bajo del resultado
BCF STATUS,RP0 ;banco 0
MOVWF PORTC
GOTO ciclo ;repite
;************************************************************
pausa MOVLW 0x23 ;Carga dato para 30 µseg.
MOVWF cont ;inicializa contador con el dato
rep DECFSZ cont,1 ;Decrementa contador y escapa si cero
GOTO rep ;si no es cero, repite
esc RETURN ;regresa de esta subrutina
;
end
