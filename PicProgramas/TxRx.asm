list p=16f877
;* Este programa recibe un car�cter por el puerto serie as�ncrono USART
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
BCF TXSTA,SYNC ;limpia bit SYNC (modo as�ncrono)
BSF TXSTA,TXEN ;pone bit TXEN=1 (habilita transmisi�n)
BCF STATUS,RP0 ;regresa al banco 0
BSF RCSTA,SPEN ;pone bit SPEN=1 (habilita puerto serie)
BSF RCSTA,CREN ;Habilita recepci�n
rep CALL recibe ;recibe dato
MOVLW 0x1B ;carga c�digo ASCII de <escape>
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
esp BTFSS TXSTA,TRMT ;checa si el buffer de transmisi�n
GOTO esp ;si est� ocupado espera
BCF STATUS,RP0 ;regresa al banco 0
MOVF dato,W ;rescata dato a enviar
MOVWF TXREG ;lo env�a
RETURN
;**************************************************
;subrutina de recepci�n de un dato del puerto serie
;**************************************************
recibe BTFSS PIR1,RCIF ;checa el buffer de recepci�n
GOTO recibe ;si no hay dato listo espera
MOVF RCREG,W ;si hay dato, lo lee
MOVWF dato ;lo almacena en dato
RETURN
end
