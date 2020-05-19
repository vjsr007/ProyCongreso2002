;************************************************************************
list p=16f877
Include<p16f877.inc>
cont equ 0x20
org 0x0000
inic BSF STATUS,RP0 ;banco 1
MOVLW 0x80 ;Todos los bits del puerto C como salidas
MOVWF TRISC ;y el MSB como entrada
BCF STATUS,RP0 ;regresa al Banco 0
MOVLW 0x01 ;
MOVWF PORTC ;Despliega un cero
CLRF cont ;Inicializa contador en cero
tecla BTFSS PORTC,7 ;checa botón
GOTO tecla ;Si no se ha presionado espera
BTFSS PORTC,7 ;checa nuevamente el botón
GOTO tecla ;tecla falsa, espera de nuevo
INCF cont,1 ;tecla válida, incrementa contador
CALL codigo ;obtiene código para desplegar el contador
MOVWF PORTC ;despliega contador
suelt BTFSC PORTC,7 ;checa de nuevo el botón
GOTO suelt ;si sigue presionado espera
GOTO tecla ;si ya se soltó espera nueva presión.
codigo:
MOVLW 0x0F ;carga máscara
ANDWF cont,0 ;enmascara el contador y lo deja en W
ADDWF PCL,1 ;Salta W instrucciones adelante
RETLW 0x01 ;código del 0
RETLW 0x4F ;código del 1
RETLW 0x12 ;código del 2
RETLW 0x06 ;código del 3
RETLW 0x4C ;código del 4
RETLW 0x24 ;código del 5
RETLW 0x20 ;código del 6
RETLW 0x0F ;código del 7
RETLW 0x00 ;código del 8
RETLW 0x04 ;código del 9
RETLW 0x08 ;código de la A
RETLW 0x60 ;código de la b
RETLW 0x31 ;código del c
RETLW 0x42 ;código de la d
RETLW 0x30 ;código de la e
RETLW 0x38 ;código de la F
end
