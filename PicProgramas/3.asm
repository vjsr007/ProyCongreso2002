p=16f877
org 0x0000 ;Inicia en el vector de reset
;Inicialización del puerto A:
CLRF 0x03 ;Selecciona Banco 0
CLRF 0x05 ;Inicializa latches de datos de PORTA
BSF 0x03,5 ;Selecciona Banco 1
MOVLW 0x06 ;Configura todas las patitas de A
MOVWF 0x9f ;como digitales
MOVLW 0x00 ;configura todas patitas de A
MOVWF 0x85 ;como salidas digitales
;Una vez inicializado el puerto, se procede a controlar los LEDs
BCF 0x03,5 ;regresa al banco 0
ciclo CLRF 0x05 ;Apaga todos los LEDs
BSF 0x05,0 ;enciende el LED RA0
BSF 0x05,1 ;enciende el LED RA1
BSF 0x05,2 ;enciende el LED RA2
BSF 0x05,3 ;enciende el LED RA3
GOTO ciclo
end
