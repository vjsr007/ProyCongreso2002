list p=16f877
;* Este programa recibe un carácter por el puerto serie asíncrono USART
;* y lo regresa tal cual por el mismo puerto, hasta recibir un <esc>
;* Se supone un oscilador a cristal Fosc=14.7456 Mhz
;************************************************************************
Include <p16f877.inc>
dato EQU 0x20
org 0x0000
trans BSF STATUS,RP0 ;banco 1
BCF TXSTA,BRGH ;pone bit BRGH=0 (velocidad baja)
MOVLW 0x17 ;valor para 9600 Bauds (Fosc=14.7456 Mhz)
MOVWF SPBRG ;configura 9600 Bauds
BCF TXSTA,SYNC ;limpia bit SYNC (modo asíncrono)
BSF TXSTA,TXEN ;pone bit TXEN=1 (habilita transmisión)
BCF STATUS,RP0 ;regresa al banco 0
BSF RCSTA,SPEN ;pone bit SPEN=1 (habilita puerto serie)
BSF RCSTA,CREN ;Habilita recepción
rep CALL recibe ;recibe dato
MOVLW 0x1B ;carga código ASCII de <escape>
SUBWF dato,W ;es igual?
BTFSC STATUS,Z ;
GOTO fin ;si es igual termina
CALL envia ;si n, retransmite el dato
GOTO rep ;repite
fin GOTO fin ;ciclo infinito
;*************************************************
;Subrutina para enviar un dato por el puerto serie
;*************************************************
envia BSF STATUS,RP0 ;banco 1
esp BTFSS TXSTA,TRMT ;checa si el buffer de transmisión
GOTO esp ;si está ocupado espera
BCF STATUS,RP0 ;regresa al banco 0
MOVF dato,W ;rescata dato a enviar
MOVWF TXREG ;lo envía
RETURN
;**************************************************
;subrutina de recepción de un dato del puerto serie
;**************************************************
recibe BTFSS PIR1,RCIF ;checa el buffer de recepción
GOTO recibe ;si no hay dato listo espera
MOVF RCREG,W ;si hay dato, lo lee
MOVWF dato ;lo almacena en dato
RETURN
end
