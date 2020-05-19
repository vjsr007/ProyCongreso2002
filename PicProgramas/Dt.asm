;* Este programa envía repetidamente una cadena de caracteres a través
;* del puerto serie asíncrono USART, La cadena utiliza como terminador
;* un carácter "$". Se supone un oscilador a cristal Fosc=14.7456 Mhz
;************************************************************************
list p=16f877
Include <p16f877.inc>
apun EQU 0x20
dato EQU 0x21
org 0x0000
trans BSF STATUS,RP0 ;banco 1
BCF TXSTA,BRGH ;pone bit BRGH=0 (velocidad baja)
MOVLW 0x06 ;valor para 9600 Bauds (Fosc=14.7456 Mhz)
MOVWF SPBRG ;configura 9600 Bauds
BCF TXSTA,SYNC ;limpia bit SYNC (modo asíncrono)
BSF TXSTA,TXEN ;pone bit TXEN=1 (habilita transmisión)
BCF STATUS,RP0 ;regresa al banco 0
BSF RCSTA,SPEN ;pone bit SPEN=1 (habilita puerto serie)
rep CLRF apun ;inicializa apuntador
cic2 CALL letrero ;obtiene el siguiente carácter apuntado
MOVWF dato ;lo guarda en dato
SUBLW "$" ;Compara con el signo "$"
BTFSC STATUS,Z ;
GOTO rep ;si es, reinicia
CALL envia ;si no es "$" envía el dato
INCF apun,1 ;apunta al siguiente carácter
GOTO cic2 ;repite
;*************************************************
;Subrutina para enviar un dato por el puerto serie
;*************************************************
envia BSF STATUS,RP0 ;banco 1
BCF STATUS,RP0 ;regresa al banco 0
MOVF dato,W ;rescata dato a enviar
MOVWF TXREG ;lo envía
RETURN
letrero:
MOVF apun,W ;carga apuntador en W
ADDWF PCL,1 ;Salta W instrucciones adelante
DT "HOLA MUNDO 14.756 Mhz",0x0D,0x0A,"$"
end
