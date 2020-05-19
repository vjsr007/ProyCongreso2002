;************************************************************************
;* Este programa realiza la conversión de una señal analógica conectada *
;* al canal AN0 y envía a través del puerto serie el resultado de la *
;* conversión en forma de 4 dígitos hexadecimales. *
;************************************************************************
;
;
p=16f877
Include <p16F877.inc>
cont EQU 0x20
sensor EQU 0X10
aux1 EQU 0x11
aux2 EQU 0x12
aux3 EQU 0x13
msnib EQU 0x22
lsnib EQU 0x23
STATUS EQU 0x03
ADCON1 EQU 0x9f
ADCON0 EQU 0x1f
PORTA EQU 0x05
TRISA EQU 0X85
ADRESH EQU 0x1e
ADRESL EQU 0x9e
TXSTA EQU 0x98
RCSTA EQU 0x18
PCL EQU 0x02
TXREG EQU 0x19
SPBRG EQU 0x99
org 0x0000
inic CALL initrans ;inicializa el puerto serie para transmisión
CLRF sensor
BSF STATUS,5 ;Banco 1 RP0
CLRF ADCON1 ;configura 8 canales analógicos, VREF+=VDD y VREF-=VSS
BSF ADCON1,7 ;Elije resultado con justificación a la derecha ADFM
CLRF TRISA ;configura como entradas
CLRF TRISE
ciclo BCF STATUS,5 ;Banco 0
RLF sensor,0
MOVWF aux1
RLF aux1,1
RLF aux1,1
MOVLW 0x01
IORWF aux1,0 ;Selecciona el canal ANx, reloj de conversión Fosc/2
MOVWF ADCON0 ;y enciende el convertidor
CALL pausa ;espera 30 µseg a que pase el tiempo de adquisición
BSF ADCON0,2 ;inicia conversión GO/DONE
espera BTFSC ADCON0,2
GOTO espera ;Espera a que termine la conversión
MOVLW 0x24 ;carga $
CALL envia ;lo envía
MOVLW 0x30
ADDWF sensor,0
CALL envia
MOVF ADRESH,W ;Carga en W el Byte alto del resultado
CALL Envbyte ;envía el byte por el puerto serie
BSF STATUS,5 ;banco 1
MOVF ADRESL,W ;Carga en W el Byte bajo del resultado
CALL Envbyte ;envía el byte por el puerto serie
INCF sensor,1
MOVLW 0X00
ADDWF sensor,0
SUBLW 0X08
BTFSC STATUS,Z
CLRF sensor
GOTO ciclo
;***************************************************************
; Subrutina que envía el byte en W por el puerto serie, separado
; en los códigos ASCII de sus dos nibbles hexadecimales
;***************************************************************
;
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
;
;************************************************************
; Subrutina de pausa de aprox. 30 µseg (con Fosc=4 MHZ)
;************************************************************
pausa MOVLW 0x23 ;Carga dato para 30 µseg.
MOVWF cont ;inicializa contador con el dato
rep DECFSZ cont,1 ;Decrementa contador y escapa si cero
GOTO rep ;si no es cero, repite
esc RETURN ;regresa de esta subrutina
;
;****************************************************************
;Subrutina para inicializar el puerto serie USART como transmisor
;a 9600 Bauds, considerando un cristal de reloj de 14.7456 MHZ
;****************************************************************
initrans:
BCF STATUS,6 ;RP1=6
BSF STATUS,5 ;banco 1
BCF TXSTA,2 ;pone bit BRGH=0 (velocidad baja)
MOVLW 0x19 ;valor para 9600 Bauds (Fosc=4 Mhz) SPBRG=6.....5.51
MOVWF SPBRG ;configura 9600 Bauds
BCF TXSTA,4 ;limpia bit SYNC (modo asíncrono)
BSF TXSTA,5 ;pone bit TXEN=1 (habilita transmisión)
BCF STATUS,5 ;regresa al banco 0
BSF RCSTA,7 ;pone bit SPEN=1 (habilita puerto serie)
RETURN
;***************************************************************
;Subrutina para enviar el byte guardado en W por el puerto serie
;***************************************************************
;
envia BSF STATUS,5 ;banco 1
esp BTFSS TXSTA,1 ;checa si el buffer de transmisión TRMT
GOTO esp ;si está ocupado espera
BCF STATUS,5 ;regresa al banco 0
MOVWF TXREG ;envía dato guardado en W
RETURN
end
