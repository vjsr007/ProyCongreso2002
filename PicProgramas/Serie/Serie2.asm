Include <p16f877.inc>
LIST P=16F877
cont equ 0x20
org 0x0000
inic BSF STATUS,RP0 ;banco 1
MOVLW 0x80 ;Todos los bits del puerto C como salidas
MOVWF TRISC ;y el MSB como entrada
BCF STATUS,RP0 ;regresa al Banco 0
MOVLW 0x01 ;
MOVWF PORTC ;Despliega un cero
CLRF cont ;Inicializa contador en cero
tecla INCF cont,1 ;tecla v�lida, incrementa contador
CALL codigo ;obtiene c�digo para desplegar el contador
MOVWF PORTC ;despliega contador
GOTO tecla ;si ya se solt� espera nueva presi�n.
codigo:
MOVLW 0x0F ;carga m�scara
ANDWF cont,0 ;enmascara el contador y lo deja en W
ADDWF PCL,1 ;Salta W instrucciones adelante
RETLW 0x01 ;c�digo del 0
RETLW 0x4F ;c�digo del 1
RETLW 0x12 ;c�digo del 2
RETLW 0x06 ;c�digo del 3
RETLW 0x4C ;c�digo del 4
RETLW 0x24 ;c�digo del 5
RETLW 0x3F ;c�digo del 6
RETLW 0x0F ;c�digo del 7
RETLW 0x00 ;c�digo del 8
RETLW 0x04 ;c�digo del 9
RETLW 0x08 ;c�digo de la A
RETLW 0x60 ;c�digo de la b
RETLW 0x31 ;c�digo de la c
RETLW 0x42 ;c�digo de la d
RETLW 0x30 ;c�digo de la e
RETLW 0x38 ;c�digo de la F
end
