VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Serie Convertidor A/D"
   ClientHeight    =   6750
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8670
   ForeColor       =   &H000000FF&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6750
   ScaleWidth      =   8670
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   7
      Left            =   7320
      TabIndex        =   26
      Top             =   4200
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   6
      Left            =   7320
      TabIndex        =   25
      Top             =   3240
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   5
      Left            =   7320
      TabIndex        =   24
      Top             =   2280
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   4
      Left            =   7320
      TabIndex        =   23
      Top             =   1320
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   3
      Left            =   5640
      TabIndex        =   22
      Top             =   4200
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   2
      Left            =   5640
      TabIndex        =   21
      Top             =   3240
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   1
      Left            =   5640
      TabIndex        =   20
      Top             =   2280
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Index           =   0
      Left            =   5640
      TabIndex        =   19
      Top             =   1320
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Detener"
      Height          =   495
      Left            =   5640
      TabIndex        =   2
      Top             =   5400
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Escuchar"
      Height          =   495
      Left            =   7560
      TabIndex        =   1
      Top             =   5400
      Width           =   975
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   6240
      Width           =   8415
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   6000
      Top             =   4920
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   7560
      Top             =   4800
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
      BaudRate        =   2400
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Covertidor A/D con Sensores de Temperatura LM35  utilizando el PIC16f877 comunicacion en Serie norma rs232"
      Height          =   915
      Left            =   5520
      TabIndex        =   27
      Top             =   240
      Width           =   2985
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   1995
      Index           =   0
      Left            =   360
      Top             =   360
      Width           =   255
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Te"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   7
      Left            =   4800
      TabIndex        =   18
      Top             =   3240
      Width           =   390
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   1995
      Index           =   7
      Left            =   4320
      Top             =   3480
      Width           =   255
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "°C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   7
      Left            =   5160
      TabIndex        =   17
      Top             =   3240
      Width           =   285
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Te"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   6
      Left            =   3480
      TabIndex        =   16
      Top             =   3240
      Width           =   390
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   1995
      Index           =   6
      Left            =   3000
      Top             =   3480
      Width           =   255
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "°C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   6
      Left            =   3840
      TabIndex        =   15
      Top             =   3240
      Width           =   285
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Te"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   5
      Left            =   2160
      TabIndex        =   14
      Top             =   3240
      Width           =   390
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   1995
      Index           =   5
      Left            =   1680
      Top             =   3480
      Width           =   255
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "°C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   5
      Left            =   2520
      TabIndex        =   13
      Top             =   3240
      Width           =   285
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Te"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   4
      Left            =   840
      TabIndex        =   12
      Top             =   3240
      Width           =   390
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   1995
      Index           =   4
      Left            =   360
      Top             =   3480
      Width           =   255
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "°C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   4
      Left            =   1200
      TabIndex        =   11
      Top             =   3240
      Width           =   285
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Te"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   3
      Left            =   4800
      TabIndex        =   10
      Top             =   120
      Width           =   390
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   1995
      Index           =   3
      Left            =   4320
      Top             =   360
      Width           =   255
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "°C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   3
      Left            =   5160
      TabIndex        =   9
      Top             =   120
      Width           =   285
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Te"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   2
      Left            =   3480
      TabIndex        =   8
      Top             =   120
      Width           =   390
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   1995
      Index           =   2
      Left            =   3000
      Top             =   360
      Width           =   255
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "°C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   2
      Left            =   3840
      TabIndex        =   7
      Top             =   120
      Width           =   285
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Te"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   1
      Left            =   2160
      TabIndex        =   6
      Top             =   120
      Width           =   390
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   1995
      Index           =   1
      Left            =   1680
      Top             =   360
      Width           =   255
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "°C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   1
      Left            =   2520
      TabIndex        =   5
      Top             =   120
      Width           =   285
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "°C"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   0
      Left            =   1200
      TabIndex        =   4
      Top             =   120
      Width           =   285
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Te"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Index           =   0
      Left            =   840
      TabIndex        =   3
      Top             =   120
      Width           =   390
   End
   Begin VB.Image Image1 
      Height          =   2415
      Index           =   0
      Left            =   240
      Picture         =   "Form1.frx":0000
      Stretch         =   -1  'True
      Top             =   120
      Width           =   540
   End
   Begin VB.Image Image1 
      Height          =   2415
      Index           =   7
      Left            =   4200
      Picture         =   "Form1.frx":05B8
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   540
   End
   Begin VB.Image Image1 
      Height          =   2415
      Index           =   6
      Left            =   2880
      Picture         =   "Form1.frx":0B70
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   540
   End
   Begin VB.Image Image1 
      Height          =   2415
      Index           =   5
      Left            =   1560
      Picture         =   "Form1.frx":1128
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   540
   End
   Begin VB.Image Image1 
      Height          =   2415
      Index           =   4
      Left            =   240
      Picture         =   "Form1.frx":16E0
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   540
   End
   Begin VB.Image Image1 
      Height          =   2415
      Index           =   3
      Left            =   4200
      Picture         =   "Form1.frx":1C98
      Stretch         =   -1  'True
      Top             =   120
      Width           =   540
   End
   Begin VB.Image Image1 
      Height          =   2415
      Index           =   2
      Left            =   2880
      Picture         =   "Form1.frx":2250
      Stretch         =   -1  'True
      Top             =   120
      Width           =   540
   End
   Begin VB.Image Image1 
      Height          =   2415
      Index           =   1
      Left            =   1560
      Picture         =   "Form1.frx":2808
      Stretch         =   -1  'True
      Top             =   120
      Width           =   540
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  Timer1.Enabled = True
End Sub

Private Sub Command2_Click()
  Timer1.Enabled = False
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
 If KeyAscii = 49 Then
   Unload Me
  End If
End Sub

Private Sub Form_Load()
  MSComm1.Settings = "2400,n,8,1"
  MSComm1.CommPort = 1
  MSComm1.PortOpen = True
  pos_index = 1
  speed = 1
End Sub





Private Sub Timer1_Timer()
Dim cad As String
 cad = ""
 i = 0
 j = 1
 While Len(cad) < 250
    x = MSComm1.Input
    cad = cad + x
 Wend
 Text2 = cad
 pos = InStrRev(cad, "$", 6)
 j = 0
 While j < 31
   cad2 = Mid(cad, pos + 1, 6)
   error1 = False
   i = 1
   dato = 0
   While i < 7
     car = Mid(cad2, i, 1)
     If Not car = "$" And i < 6 And error1 = False Then
       x = Asc(car)
       If x > 47 And x < 58 Then
            x = x - 48
            Select Case i
                Case 1
                    sensor = x
                Case 2
                    dato = dato + 0
                Case 3
                    dato = x * 256 + dato
                Case 4
                    dato = x * 16 + dato
                Case 5
                    dato = x + dato
            End Select
       Else
            x = x - 65 + 10
            Select Case i
                Case 1
                    sensor = x
                Case 2
                    dato = dato + 0
                Case 3
                    dato = x * 256 + dato
                Case 4
                    dato = x * 16 + dato
                Case 5
                    dato = x + dato
            End Select
       End If
     Else
        If i = 6 Then
            If Not car = "$" Then
                error1 = True
                pos = pos + 6
             End If
        Else
            error1 = True
        End If
     End If
     i = i + 1
   Wend
   If error1 = False Then
     Text1(sensor).Text = Int((dato / 1023) * 500)
     Shape1(sensor).Height = Int(Text1(sensor).Text) / 500 * 2000
     Label1(sensor).Caption = Text1(sensor).Text
   End If
   j = j + 1
   pos = pos + i
   pos = InStrRev(cad, "$", pos)
 Wend
End Sub
