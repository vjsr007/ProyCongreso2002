;************************************************************************
;* Este programa realiza la conversión de una señal analógica conectada *
;* al canal AN0 y envía a través del puerto serie el resultado de la *
;* conversión en forma de 4 dígitos hexadecimales. *
;************************************************************************
list p=16f877
Include "p16f877.inc"
cont EQU 0x20
msnib EQU 0x22
lsnib EQU 0x23
org 0x0000
inic CALL initrans ;inicializa el puerto serie para transmisión
BSF STATUS,RP0 ;Banco 1
CLRF ADCON1 ;configura 8 canales analógicos, VREF+=VDD y VREF-=VSS
BSF ADCON1,ADFM ;Elije resultado con justificación a la derecha
BSF TRISA,0 ;configura como entrada el canal digital RA0
BCF STATUS,RP0 ;Banco 0
MOVLW 0x01 ;Selecciona el canal AN0, reloj de conversión Fosc/2
MOVWF ADCON0 ;y enciende el convertidor
ciclo CALL pausa ;espera 30 µseg a que pase el tiempo de adquisición
BSF ADCON0,2 ;inicia conversión
espera BTFSC ADCON0,2
GOTO espera ;Espera a que termine la conversión
MOVF ADRESH,W ;Carga en W el Byte alto del resultado
CALL Envbyte ;envía el byte por el puerto serie
BSF STATUS,RP0 ;banco 1
MOVF ADRESL,W ;Carga en W el Byte bajo del resultado
CALL Envbyte ;envía el byte por el puerto serie
MOVLW 0x0D ;carga código de retorno de línea <CR>
CALL envia ;lo envía
MOVLW 0x0A ;carga código de avance de línea <LF>
CALL envia ;lo envía
GOTO ciclo ;repite
;***************************************************************
; Subrutina que envía el byte en W por el puerto serie, separado
; en los códigos ASCII de sus dos nibbles hexadecimales
;***************************************************************
Envbyte:
MOVWF msnib ;pone byte en msnib
MOVWF lsnib ;y una copia en lsnib
SWAPF msnib,1 ;intercambia nibbles en lsnib
MOVLW 0x0F ;máscara para limpiar el nibble alto
ANDWF msnib,1 ;limpia parte alta de msnib
ANDWF lsnib,1 ;limpia parte alta de lsnib
MOVF msnib,W ;carga msnib en W
CALL asc ;obtiene código ASCII equivalente
CALL envia ;lo envía por el puerto serie
MOVF lsnib,W ;carga lsnib en W
CALL asc ;obtiene código ASCII equivalente
CALL envia ;lo envía por el puerto serie
RETURN
asc ADDWF PCL,1 ;Calcula el código a retornar
;Saltando W instrucciones adelante
DT "0123456789ABCDEF"
;************************************************************
; Subrutina de pausa de aprox. 30 µseg (con Fosc=14.7456 MHZ)
;************************************************************
pausa MOVLW 0x23 ;Carga dato para 30 µseg.
MOVWF cont ;inicializa contador con el dato
rep DECFSZ cont,1 ;Decrementa contador y escapa si cero
GOTO rep ;si no es cero, repite
esc RETURN ;regresa de esta subrutina
;****************************************************************
;Subrutina para inicializar el puerto serie USART como transmisor
;a 9600 Bauds, considerando un cristal de reloj de 14.7456 MHZ
;****************************************************************
initrans:
BCF STATUS,RP1
BSF STATUS,RP0 ;banco 1
BCF TXSTA,BRGH ;pone bit BRGH=0 (velocidad baja)
MOVLW 0x06 ;valor para 9600 Bauds (Fosc=14.7456 Mhz)
MOVWF SPBRG ;configura 9600 Bauds
BCF TXSTA,SYNC ;limpia bit SYNC (modo asíncrono)
BSF TXSTA,TXEN ;pone bit TXEN=1 (habilita transmisión)
BSF RCSTA,SPEN ;pone bit SPEN=1 (habilita puerto serie)
RETURN
;***************************************************************
;Subrutina para enviar el byte guardado en W por el puerto serie
;***************************************************************
envia BSF STATUS,RP0 ;banco 1
esp BTFSS TXSTA,TRMT ;checa si el buffer de transmisión
GOTO esp ;si está ocupado espera
BCF STATUS,RP0 ;regresa al banco 0
MOVWF TXREG ;envía dato guardado en W
RETURN
end
