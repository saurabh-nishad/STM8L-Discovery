   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  16                     	bsct
  17  0000               _LED_PORT:
  18  0000 5000          	dc.w	20480
  19  0002 5000          	dc.w	20480
  20  0004 5000          	dc.w	20480
  21  0006 5000          	dc.w	20480
  22  0008 500f          	dc.w	20495
  23                     .const:	section	.text
  24  0000               _LED_PIN:
  25  0000 10            	dc.b	16
  26  0001 20            	dc.b	32
  27  0002 40            	dc.b	64
  28  0003 80            	dc.b	128
  29  0004 04            	dc.b	4
  30                     	bsct
  31  000a               _BUTTON_PORT:
  32  000a 500a          	dc.w	20490
  33  000c 500f          	dc.w	20495
  34  000e 5014          	dc.w	20500
  35  0010 500f          	dc.w	20495
  36  0012 500f          	dc.w	20495
  37  0014 5014          	dc.w	20500
  38                     	switch	.const
  39  0005               _BUTTON_PIN:
  40  0005 02            	dc.b	2
  41  0006 20            	dc.b	32
  42  0007 02            	dc.b	2
  43  0008 80            	dc.b	128
  44  0009 10            	dc.b	16
  45  000a 04            	dc.b	4
  46  000b               _BUTTON_EXTI:
  47  000b 02            	dc.b	2
  48  000c 12            	dc.b	18
  49  000d 02            	dc.b	2
  50  000e 16            	dc.b	22
  51  000f 10            	dc.b	16
  52  0010 04            	dc.b	4
  53                     	bsct
  54  0016               _COM_USART:
  55  0016 5230          	dc.w	21040
  56  0018               _COM_PORT:
  57  0018 500a          	dc.w	20490
  58                     	switch	.const
  59  0011               _COM_USART_CLK:
  60  0011 05            	dc.b	5
  61  0012               _COM_TX_PIN:
  62  0012 08            	dc.b	8
  63  0013               _COM_RX_PIN:
  64  0013 04            	dc.b	4
 149                     ; 123 void STM_EVAL_LEDInit(Led_TypeDef Led)
 149                     ; 124 {
 151                     	switch	.text
 152  0000               _STM_EVAL_LEDInit:
 154  0000 88            	push	a
 155       00000000      OFST:	set	0
 158                     ; 126   GPIO_Init(LED_PORT[Led], LED_PIN[Led], GPIO_Mode_Out_PP_High_Fast);
 160  0001 4bf0          	push	#240
 161  0003 5f            	clrw	x
 162  0004 97            	ld	xl,a
 163  0005 d60000        	ld	a,(_LED_PIN,x)
 164  0008 88            	push	a
 165  0009 7b03          	ld	a,(OFST+3,sp)
 166  000b 5f            	clrw	x
 167  000c 97            	ld	xl,a
 168  000d 58            	sllw	x
 169  000e ee00          	ldw	x,(_LED_PORT,x)
 170  0010 cd0000        	call	_GPIO_Init
 172  0013 85            	popw	x
 173                     ; 127 }
 176  0014 84            	pop	a
 177  0015 81            	ret
 214                     ; 140 void STM_EVAL_LEDOn(Led_TypeDef Led)
 214                     ; 141 {
 215                     	switch	.text
 216  0016               _STM_EVAL_LEDOn:
 218  0016 88            	push	a
 219       00000000      OFST:	set	0
 222                     ; 142   LED_PORT[Led]->ODR &= (uint8_t)~LED_PIN[Led];
 224  0017 5f            	clrw	x
 225  0018 97            	ld	xl,a
 226  0019 58            	sllw	x
 227  001a ee00          	ldw	x,(_LED_PORT,x)
 228  001c 7b01          	ld	a,(OFST+1,sp)
 229  001e 905f          	clrw	y
 230  0020 9097          	ld	yl,a
 231  0022 90d60000      	ld	a,(_LED_PIN,y)
 232  0026 43            	cpl	a
 233  0027 f4            	and	a,(x)
 234  0028 f7            	ld	(x),a
 235                     ; 143 }
 238  0029 84            	pop	a
 239  002a 81            	ret
 276                     ; 156 void STM_EVAL_LEDOff(Led_TypeDef Led)
 276                     ; 157 {
 277                     	switch	.text
 278  002b               _STM_EVAL_LEDOff:
 280  002b 88            	push	a
 281       00000000      OFST:	set	0
 284                     ; 158   LED_PORT[Led]->ODR |= (uint8_t)LED_PIN[Led];
 286  002c 5f            	clrw	x
 287  002d 97            	ld	xl,a
 288  002e 58            	sllw	x
 289  002f ee00          	ldw	x,(_LED_PORT,x)
 290  0031 7b01          	ld	a,(OFST+1,sp)
 291  0033 905f          	clrw	y
 292  0035 9097          	ld	yl,a
 293  0037 f6            	ld	a,(x)
 294  0038 90da0000      	or	a,(_LED_PIN,y)
 295  003c f7            	ld	(x),a
 296                     ; 159 }
 299  003d 84            	pop	a
 300  003e 81            	ret
 337                     ; 172 void STM_EVAL_LEDToggle(Led_TypeDef Led)
 337                     ; 173 {
 338                     	switch	.text
 339  003f               _STM_EVAL_LEDToggle:
 341  003f 88            	push	a
 342       00000000      OFST:	set	0
 345                     ; 174   LED_PORT[Led]->ODR ^= (uint8_t)LED_PIN[Led];
 347  0040 5f            	clrw	x
 348  0041 97            	ld	xl,a
 349  0042 58            	sllw	x
 350  0043 ee00          	ldw	x,(_LED_PORT,x)
 351  0045 7b01          	ld	a,(OFST+1,sp)
 352  0047 905f          	clrw	y
 353  0049 9097          	ld	yl,a
 354  004b f6            	ld	a,(x)
 355  004c 90d80000      	xor	a,(_LED_PIN,y)
 356  0050 f7            	ld	(x),a
 357                     ; 175 }
 360  0051 84            	pop	a
 361  0052 81            	ret
 486                     ; 193 void STM_EVAL_PBInit(Button_TypeDef Button, ButtonMode_TypeDef Button_Mode)
 486                     ; 194 {
 487                     	switch	.text
 488  0053               _STM_EVAL_PBInit:
 490  0053 89            	pushw	x
 491       00000000      OFST:	set	0
 494                     ; 196   if (Button_Mode == BUTTON_MODE_EXTI)
 496  0054 9f            	ld	a,xl
 497  0055 a101          	cp	a,#1
 498  0057 2624          	jrne	L371
 499                     ; 199     GPIO_Init(BUTTON_PORT[Button], BUTTON_PIN[Button], GPIO_Mode_In_FL_IT);
 501  0059 4b20          	push	#32
 502  005b 9e            	ld	a,xh
 503  005c 5f            	clrw	x
 504  005d 97            	ld	xl,a
 505  005e d60005        	ld	a,(_BUTTON_PIN,x)
 506  0061 88            	push	a
 507  0062 7b03          	ld	a,(OFST+3,sp)
 508  0064 5f            	clrw	x
 509  0065 97            	ld	xl,a
 510  0066 58            	sllw	x
 511  0067 ee0a          	ldw	x,(_BUTTON_PORT,x)
 512  0069 cd0000        	call	_GPIO_Init
 514  006c 85            	popw	x
 515                     ; 200     EXTI_SetPinSensitivity((EXTI_Pin_TypeDef)BUTTON_EXTI[(uint8_t)Button], EXTI_Trigger_Falling);
 517  006d 7b01          	ld	a,(OFST+1,sp)
 518  006f 5f            	clrw	x
 519  0070 97            	ld	xl,a
 520  0071 d6000b        	ld	a,(_BUTTON_EXTI,x)
 521  0074 ae0002        	ldw	x,#2
 522  0077 95            	ld	xh,a
 523  0078 cd0000        	call	_EXTI_SetPinSensitivity
 526  007b 2015          	jra	L571
 527  007d               L371:
 528                     ; 204     GPIO_Init(BUTTON_PORT[Button], BUTTON_PIN[Button], GPIO_Mode_In_FL_No_IT);
 530  007d 4b00          	push	#0
 531  007f 7b02          	ld	a,(OFST+2,sp)
 532  0081 5f            	clrw	x
 533  0082 97            	ld	xl,a
 534  0083 d60005        	ld	a,(_BUTTON_PIN,x)
 535  0086 88            	push	a
 536  0087 7b03          	ld	a,(OFST+3,sp)
 537  0089 5f            	clrw	x
 538  008a 97            	ld	xl,a
 539  008b 58            	sllw	x
 540  008c ee0a          	ldw	x,(_BUTTON_PORT,x)
 541  008e cd0000        	call	_GPIO_Init
 543  0091 85            	popw	x
 544  0092               L571:
 545                     ; 206 }
 548  0092 85            	popw	x
 549  0093 81            	ret
 588                     ; 220 uint8_t STM_EVAL_PBGetState(Button_TypeDef Button)
 588                     ; 221 {
 589                     	switch	.text
 590  0094               _STM_EVAL_PBGetState:
 592  0094 88            	push	a
 593       00000000      OFST:	set	0
 596                     ; 222   return GPIO_ReadInputDataBit(BUTTON_PORT[Button], (GPIO_Pin_TypeDef)BUTTON_PIN[Button]);
 598  0095 5f            	clrw	x
 599  0096 97            	ld	xl,a
 600  0097 d60005        	ld	a,(_BUTTON_PIN,x)
 601  009a 88            	push	a
 602  009b 7b02          	ld	a,(OFST+2,sp)
 603  009d 5f            	clrw	x
 604  009e 97            	ld	xl,a
 605  009f 58            	sllw	x
 606  00a0 ee0a          	ldw	x,(_BUTTON_PORT,x)
 607  00a2 cd0000        	call	_GPIO_ReadInputDataBit
 609  00a5 5b01          	addw	sp,#1
 612  00a7 5b01          	addw	sp,#1
 613  00a9 81            	ret
 814                     ; 234 void STM_EVAL_COMInit(COM_TypeDef COM, uint32_t USART_BaudRate,
 814                     ; 235                       USART_WordLength_TypeDef USART_WordLength,
 814                     ; 236                       USART_StopBits_TypeDef USART_StopBits,
 814                     ; 237                       USART_Parity_TypeDef USART_Parity,
 814                     ; 238                       USART_Mode_TypeDef USART_Mode)
 814                     ; 239 {
 815                     	switch	.text
 816  00aa               _STM_EVAL_COMInit:
 818  00aa 88            	push	a
 819       00000000      OFST:	set	0
 822                     ; 241   CLK_PeripheralClockConfig((CLK_Peripheral_TypeDef)COM_USART_CLK[COM], ENABLE);
 824  00ab 5f            	clrw	x
 825  00ac 97            	ld	xl,a
 826  00ad d60011        	ld	a,(_COM_USART_CLK,x)
 827  00b0 ae0001        	ldw	x,#1
 828  00b3 95            	ld	xh,a
 829  00b4 cd0000        	call	_CLK_PeripheralClockConfig
 831                     ; 244   GPIO_ExternalPullUpConfig(COM_PORT[COM], COM_TX_PIN[COM], ENABLE);
 833  00b7 4b01          	push	#1
 834  00b9 7b02          	ld	a,(OFST+2,sp)
 835  00bb 5f            	clrw	x
 836  00bc 97            	ld	xl,a
 837  00bd d60012        	ld	a,(_COM_TX_PIN,x)
 838  00c0 88            	push	a
 839  00c1 7b03          	ld	a,(OFST+3,sp)
 840  00c3 5f            	clrw	x
 841  00c4 97            	ld	xl,a
 842  00c5 58            	sllw	x
 843  00c6 ee18          	ldw	x,(_COM_PORT,x)
 844  00c8 cd0000        	call	_GPIO_ExternalPullUpConfig
 846  00cb 85            	popw	x
 847                     ; 247   GPIO_ExternalPullUpConfig(COM_PORT[COM], COM_RX_PIN[COM], ENABLE);
 849  00cc 4b01          	push	#1
 850  00ce 7b02          	ld	a,(OFST+2,sp)
 851  00d0 5f            	clrw	x
 852  00d1 97            	ld	xl,a
 853  00d2 d60013        	ld	a,(_COM_RX_PIN,x)
 854  00d5 88            	push	a
 855  00d6 7b03          	ld	a,(OFST+3,sp)
 856  00d8 5f            	clrw	x
 857  00d9 97            	ld	xl,a
 858  00da 58            	sllw	x
 859  00db ee18          	ldw	x,(_COM_PORT,x)
 860  00dd cd0000        	call	_GPIO_ExternalPullUpConfig
 862  00e0 85            	popw	x
 863                     ; 250   USART_Init(COM_USART[COM], USART_BaudRate,
 863                     ; 251              USART_WordLength,
 863                     ; 252              USART_StopBits,
 863                     ; 253              USART_Parity,
 863                     ; 254              USART_Mode);
 865  00e1 7b0b          	ld	a,(OFST+11,sp)
 866  00e3 88            	push	a
 867  00e4 7b0b          	ld	a,(OFST+11,sp)
 868  00e6 88            	push	a
 869  00e7 7b0b          	ld	a,(OFST+11,sp)
 870  00e9 88            	push	a
 871  00ea 7b0b          	ld	a,(OFST+11,sp)
 872  00ec 88            	push	a
 873  00ed 1e0a          	ldw	x,(OFST+10,sp)
 874  00ef 89            	pushw	x
 875  00f0 1e0a          	ldw	x,(OFST+10,sp)
 876  00f2 89            	pushw	x
 877  00f3 7b09          	ld	a,(OFST+9,sp)
 878  00f5 5f            	clrw	x
 879  00f6 97            	ld	xl,a
 880  00f7 58            	sllw	x
 881  00f8 ee16          	ldw	x,(_COM_USART,x)
 882  00fa cd0000        	call	_USART_Init
 884  00fd 5b08          	addw	sp,#8
 885                     ; 255 }
 888  00ff 84            	pop	a
 889  0100 81            	ret
 915                     ; 262 void SD_LowLevel_DeInit(void)
 915                     ; 263 {
 916                     	switch	.text
 917  0101               _SD_LowLevel_DeInit:
 921                     ; 264   SPI_Cmd(SD_SPI, DISABLE); /*!< SD_SPI disable */
 923  0101 4b00          	push	#0
 924  0103 ae5200        	ldw	x,#20992
 925  0106 cd0000        	call	_SPI_Cmd
 927  0109 84            	pop	a
 928                     ; 267   CLK_PeripheralClockConfig(SD_SPI_CLK, DISABLE);
 930  010a ae0400        	ldw	x,#1024
 931  010d cd0000        	call	_CLK_PeripheralClockConfig
 933                     ; 270   GPIO_Init(SD_SPI_SCK_GPIO_PORT, SD_SPI_SCK_PIN, GPIO_Mode_In_FL_No_IT);
 935  0110 4b00          	push	#0
 936  0112 4b20          	push	#32
 937  0114 ae5005        	ldw	x,#20485
 938  0117 cd0000        	call	_GPIO_Init
 940  011a 85            	popw	x
 941                     ; 273   GPIO_Init(SD_SPI_MISO_GPIO_PORT, SD_SPI_MISO_PIN, GPIO_Mode_In_FL_No_IT);
 943  011b 4b00          	push	#0
 944  011d 4b80          	push	#128
 945  011f ae5005        	ldw	x,#20485
 946  0122 cd0000        	call	_GPIO_Init
 948  0125 85            	popw	x
 949                     ; 276   GPIO_Init(SD_SPI_MOSI_GPIO_PORT, SD_SPI_MOSI_PIN, GPIO_Mode_In_FL_No_IT);
 951  0126 4b00          	push	#0
 952  0128 4b40          	push	#64
 953  012a ae5005        	ldw	x,#20485
 954  012d cd0000        	call	_GPIO_Init
 956  0130 85            	popw	x
 957                     ; 279   GPIO_Init(SD_CS_GPIO_PORT, SD_CS_PIN, GPIO_Mode_In_FL_No_IT);
 959  0131 4b00          	push	#0
 960  0133 4b08          	push	#8
 961  0135 ae5014        	ldw	x,#20500
 962  0138 cd0000        	call	_GPIO_Init
 964  013b 85            	popw	x
 965                     ; 282   GPIO_Init(SD_DETECT_GPIO_PORT, SD_DETECT_PIN, GPIO_Mode_In_FL_No_IT);
 967  013c 4b00          	push	#0
 968  013e 4b40          	push	#64
 969  0140 ae500f        	ldw	x,#20495
 970  0143 cd0000        	call	_GPIO_Init
 972  0146 85            	popw	x
 973                     ; 283 }
 976  0147 81            	ret
1004                     ; 290 void SD_LowLevel_Init(void)
1004                     ; 291 {
1005                     	switch	.text
1006  0148               _SD_LowLevel_Init:
1010                     ; 293   CLK_PeripheralClockConfig(SD_SPI_CLK, ENABLE);
1012  0148 ae0401        	ldw	x,#1025
1013  014b cd0000        	call	_CLK_PeripheralClockConfig
1015                     ; 296   GPIO_ExternalPullUpConfig(SD_SPI_SCK_GPIO_PORT, SD_SPI_MISO_PIN | SD_SPI_MOSI_PIN | \
1015                     ; 297                             SD_SPI_SCK_PIN, ENABLE);
1017  014e 4b01          	push	#1
1018  0150 4be0          	push	#224
1019  0152 ae5005        	ldw	x,#20485
1020  0155 cd0000        	call	_GPIO_ExternalPullUpConfig
1022  0158 85            	popw	x
1023                     ; 300   SPI_Init(SD_SPI, SPI_FirstBit_MSB, SPI_BaudRatePrescaler_4, SPI_Mode_Master,
1023                     ; 301            SPI_CPOL_High, SPI_CPHA_2Edge, SPI_Direction_2Lines_FullDuplex,
1023                     ; 302            SPI_NSS_Soft, 0x07);
1025  0159 4b07          	push	#7
1026  015b 4b02          	push	#2
1027  015d 4b00          	push	#0
1028  015f 4b01          	push	#1
1029  0161 4b02          	push	#2
1030  0163 4b04          	push	#4
1031  0165 4b08          	push	#8
1032  0167 4b00          	push	#0
1033  0169 ae5200        	ldw	x,#20992
1034  016c cd0000        	call	_SPI_Init
1036  016f 5b08          	addw	sp,#8
1037                     ; 306   SPI_Cmd(SD_SPI, ENABLE);
1039  0171 4b01          	push	#1
1040  0173 ae5200        	ldw	x,#20992
1041  0176 cd0000        	call	_SPI_Cmd
1043  0179 84            	pop	a
1044                     ; 309   GPIO_Init(SD_CS_GPIO_PORT, SD_CS_PIN, GPIO_Mode_Out_PP_High_Slow);
1046  017a 4bd0          	push	#208
1047  017c 4b08          	push	#8
1048  017e ae5014        	ldw	x,#20500
1049  0181 cd0000        	call	_GPIO_Init
1051  0184 85            	popw	x
1052                     ; 310 }
1055  0185 81            	ret
1082                     ; 317 void sFLASH_LowLevel_DeInit(void)
1082                     ; 318 {
1083                     	switch	.text
1084  0186               _sFLASH_LowLevel_DeInit:
1088                     ; 320   SPI_Cmd(sFLASH_SPI, DISABLE);
1090  0186 4b00          	push	#0
1091  0188 ae5200        	ldw	x,#20992
1092  018b cd0000        	call	_SPI_Cmd
1094  018e 84            	pop	a
1095                     ; 323   CLK_PeripheralClockConfig(sFLASH_SPI_CLK, DISABLE);
1097  018f ae0400        	ldw	x,#1024
1098  0192 cd0000        	call	_CLK_PeripheralClockConfig
1100                     ; 326   GPIO_Init(sFLASH_SPI_SCK_GPIO_PORT, sFLASH_SPI_SCK_PIN, GPIO_Mode_In_FL_No_IT);
1102  0195 4b00          	push	#0
1103  0197 4b20          	push	#32
1104  0199 ae5005        	ldw	x,#20485
1105  019c cd0000        	call	_GPIO_Init
1107  019f 85            	popw	x
1108                     ; 329   GPIO_Init(sFLASH_SPI_MISO_GPIO_PORT, sFLASH_SPI_MISO_PIN, GPIO_Mode_In_FL_No_IT);
1110  01a0 4b00          	push	#0
1111  01a2 4b80          	push	#128
1112  01a4 ae5005        	ldw	x,#20485
1113  01a7 cd0000        	call	_GPIO_Init
1115  01aa 85            	popw	x
1116                     ; 332   GPIO_Init(sFLASH_SPI_MOSI_GPIO_PORT, sFLASH_SPI_MOSI_PIN, GPIO_Mode_In_FL_No_IT);
1118  01ab 4b00          	push	#0
1119  01ad 4b40          	push	#64
1120  01af ae5005        	ldw	x,#20485
1121  01b2 cd0000        	call	_GPIO_Init
1123  01b5 85            	popw	x
1124                     ; 335   GPIO_Init(sFLASH_CS_GPIO_PORT, sFLASH_CS_PIN, GPIO_Mode_In_FL_No_IT);
1126  01b6 4b00          	push	#0
1127  01b8 4b10          	push	#16
1128  01ba ae5014        	ldw	x,#20500
1129  01bd cd0000        	call	_GPIO_Init
1131  01c0 85            	popw	x
1132                     ; 336 }
1135  01c1 81            	ret
1162                     ; 343 void sFLASH_LowLevel_Init(void)
1162                     ; 344 {
1163                     	switch	.text
1164  01c2               _sFLASH_LowLevel_Init:
1168                     ; 347   CLK_PeripheralClockConfig(sFLASH_SPI_CLK, ENABLE);
1170  01c2 ae0401        	ldw	x,#1025
1171  01c5 cd0000        	call	_CLK_PeripheralClockConfig
1173                     ; 350   GPIO_ExternalPullUpConfig(sFLASH_SPI_SCK_GPIO_PORT, sFLASH_SPI_SCK_PIN | \
1173                     ; 351                             sFLASH_SPI_MISO_PIN | sFLASH_SPI_MOSI_PIN, ENABLE);
1175  01c8 4b01          	push	#1
1176  01ca 4be0          	push	#224
1177  01cc ae5005        	ldw	x,#20485
1178  01cf cd0000        	call	_GPIO_ExternalPullUpConfig
1180  01d2 85            	popw	x
1181                     ; 354   GPIO_Init(sFLASH_CS_GPIO_PORT, sFLASH_CS_PIN, GPIO_Mode_Out_PP_High_Slow);
1183  01d3 4bd0          	push	#208
1184  01d5 4b10          	push	#16
1185  01d7 ae5014        	ldw	x,#20500
1186  01da cd0000        	call	_GPIO_Init
1188  01dd 85            	popw	x
1189                     ; 356 }
1192  01de 81            	ret
1222                     ; 363 void sEE_LowLevel_DeInit(void)
1222                     ; 364 {
1223                     	switch	.text
1224  01df               _sEE_LowLevel_DeInit:
1228                     ; 366   I2C_Cmd(sEE_I2C, DISABLE);
1230  01df 4b00          	push	#0
1231  01e1 ae5210        	ldw	x,#21008
1232  01e4 cd0000        	call	_I2C_Cmd
1234  01e7 84            	pop	a
1235                     ; 369   I2C_DeInit(sEE_I2C);
1237  01e8 ae5210        	ldw	x,#21008
1238  01eb cd0000        	call	_I2C_DeInit
1240                     ; 372   CLK_PeripheralClockConfig(sEE_I2C_CLK, DISABLE);
1242  01ee ae0300        	ldw	x,#768
1243  01f1 cd0000        	call	_CLK_PeripheralClockConfig
1245                     ; 376   GPIO_Init(sEE_I2C_SCL_GPIO_PORT, sEE_I2C_SCL_PIN, GPIO_Mode_In_PU_No_IT);
1247  01f4 4b40          	push	#64
1248  01f6 4b02          	push	#2
1249  01f8 ae500a        	ldw	x,#20490
1250  01fb cd0000        	call	_GPIO_Init
1252  01fe 85            	popw	x
1253                     ; 379   GPIO_Init(sEE_I2C_SDA_GPIO_PORT, sEE_I2C_SDA_PIN, GPIO_Mode_In_PU_No_IT);
1255  01ff 4b40          	push	#64
1256  0201 4b01          	push	#1
1257  0203 ae500a        	ldw	x,#20490
1258  0206 cd0000        	call	_GPIO_Init
1260  0209 85            	popw	x
1261                     ; 382   DMA_Cmd(sEE_I2C_DMA_CHANNEL_TX, DISABLE);
1263  020a 4b00          	push	#0
1264  020c ae5093        	ldw	x,#20627
1265  020f cd0000        	call	_DMA_Cmd
1267  0212 84            	pop	a
1268                     ; 383   DMA_Cmd(sEE_I2C_DMA_CHANNEL_RX, DISABLE);
1270  0213 4b00          	push	#0
1271  0215 ae5075        	ldw	x,#20597
1272  0218 cd0000        	call	_DMA_Cmd
1274  021b 84            	pop	a
1275                     ; 384   DMA_DeInit(sEE_I2C_DMA_CHANNEL_TX);
1277  021c ae5093        	ldw	x,#20627
1278  021f cd0000        	call	_DMA_DeInit
1280                     ; 385   DMA_DeInit(sEE_I2C_DMA_CHANNEL_RX);
1282  0222 ae5075        	ldw	x,#20597
1283  0225 cd0000        	call	_DMA_DeInit
1285                     ; 386 }
1288  0228 81            	ret
1314                     ; 393 void sEE_LowLevel_Init(void)
1314                     ; 394 {
1315                     	switch	.text
1316  0229               _sEE_LowLevel_Init:
1320                     ; 396   CLK_PeripheralClockConfig(sEE_I2C_CLK, ENABLE);
1322  0229 ae0301        	ldw	x,#769
1323  022c cd0000        	call	_CLK_PeripheralClockConfig
1325                     ; 399   CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, ENABLE);
1327  022f ae1401        	ldw	x,#5121
1328  0232 cd0000        	call	_CLK_PeripheralClockConfig
1330                     ; 402   DMA_DeInit(sEE_I2C_DMA_CHANNEL_TX);
1332  0235 ae5093        	ldw	x,#20627
1333  0238 cd0000        	call	_DMA_DeInit
1335                     ; 403   DMA_Init(sEE_I2C_DMA_CHANNEL_TX,
1335                     ; 404            0, /* This parameter will be configured durig communication */
1335                     ; 405            sEE_I2C_DR_Address,
1335                     ; 406            0xFF, /* This parameter will be configured durig communication */
1335                     ; 407            DMA_DIR_PeripheralToMemory,/* This parameter will be configured durig communication */
1335                     ; 408            DMA_Mode_Normal,
1335                     ; 409            DMA_MemoryIncMode_Inc,
1335                     ; 410            DMA_Priority_VeryHigh,
1335                     ; 411            DMA_MemoryDataSize_Byte);
1337  023b 4b00          	push	#0
1338  023d 4b30          	push	#48
1339  023f 4b20          	push	#32
1340  0241 4b00          	push	#0
1341  0243 4b00          	push	#0
1342  0245 4bff          	push	#255
1343  0247 ae5216        	ldw	x,#21014
1344  024a 89            	pushw	x
1345  024b ae0000        	ldw	x,#0
1346  024e 89            	pushw	x
1347  024f ae0000        	ldw	x,#0
1348  0252 89            	pushw	x
1349  0253 ae5093        	ldw	x,#20627
1350  0256 cd0000        	call	_DMA_Init
1352  0259 5b0c          	addw	sp,#12
1353                     ; 414   DMA_DeInit(sEE_I2C_DMA_CHANNEL_RX);
1355  025b ae5075        	ldw	x,#20597
1356  025e cd0000        	call	_DMA_DeInit
1358                     ; 415   DMA_Init(sEE_I2C_DMA_CHANNEL_RX, 0, /* This parameter will be configured durig communication */
1358                     ; 416            sEE_I2C_DR_Address,
1358                     ; 417            0xFF, /* This parameter will be configured durig communication */
1358                     ; 418            DMA_DIR_PeripheralToMemory,/* This parameter will be configured durig communication */
1358                     ; 419            DMA_Mode_Normal,
1358                     ; 420            DMA_MemoryIncMode_Inc,
1358                     ; 421            DMA_Priority_VeryHigh,
1358                     ; 422            DMA_MemoryDataSize_Byte);
1360  0261 4b00          	push	#0
1361  0263 4b30          	push	#48
1362  0265 4b20          	push	#32
1363  0267 4b00          	push	#0
1364  0269 4b00          	push	#0
1365  026b 4bff          	push	#255
1366  026d ae5216        	ldw	x,#21014
1367  0270 89            	pushw	x
1368  0271 ae0000        	ldw	x,#0
1369  0274 89            	pushw	x
1370  0275 ae0000        	ldw	x,#0
1371  0278 89            	pushw	x
1372  0279 ae5075        	ldw	x,#20597
1373  027c cd0000        	call	_DMA_Init
1375  027f 5b0c          	addw	sp,#12
1376                     ; 425 }
1379  0281 81            	ret
1434                     ; 433 void sEE_LowLevel_DMAConfig(uint16_t pBuffer, uint8_t BufferSize, uint16_t Direction)
1434                     ; 434 {
1435                     	switch	.text
1436  0282               _sEE_LowLevel_DMAConfig:
1438  0282 89            	pushw	x
1439       00000000      OFST:	set	0
1442                     ; 436   if (Direction == sEE_DIRECTION_TX)
1444  0283 1e06          	ldw	x,(OFST+6,sp)
1445  0285 2626          	jrne	L734
1446                     ; 439     DMA_Init(sEE_I2C_DMA_CHANNEL_TX, pBuffer, sEE_I2C_DR_Address, BufferSize,
1446                     ; 440              DMA_DIR_MemoryToPeripheral, DMA_Mode_Normal, DMA_MemoryIncMode_Inc,
1446                     ; 441              DMA_Priority_VeryHigh, DMA_MemoryDataSize_Byte);
1448  0287 4b00          	push	#0
1449  0289 4b30          	push	#48
1450  028b 4b20          	push	#32
1451  028d 4b00          	push	#0
1452  028f 4b08          	push	#8
1453  0291 7b0a          	ld	a,(OFST+10,sp)
1454  0293 88            	push	a
1455  0294 ae5216        	ldw	x,#21014
1456  0297 89            	pushw	x
1457  0298 1e09          	ldw	x,(OFST+9,sp)
1458  029a cd0000        	call	c_uitolx
1460  029d be02          	ldw	x,c_lreg+2
1461  029f 89            	pushw	x
1462  02a0 be00          	ldw	x,c_lreg
1463  02a2 89            	pushw	x
1464  02a3 ae5093        	ldw	x,#20627
1465  02a6 cd0000        	call	_DMA_Init
1467  02a9 5b0c          	addw	sp,#12
1469  02ab 2024          	jra	L144
1470  02ad               L734:
1471                     ; 446     DMA_Init(sEE_I2C_DMA_CHANNEL_RX, pBuffer, sEE_I2C_DR_Address, BufferSize,
1471                     ; 447              DMA_DIR_PeripheralToMemory, DMA_Mode_Normal, DMA_MemoryIncMode_Inc,
1471                     ; 448              DMA_Priority_VeryHigh, DMA_MemoryDataSize_Byte);
1473  02ad 4b00          	push	#0
1474  02af 4b30          	push	#48
1475  02b1 4b20          	push	#32
1476  02b3 4b00          	push	#0
1477  02b5 4b00          	push	#0
1478  02b7 7b0a          	ld	a,(OFST+10,sp)
1479  02b9 88            	push	a
1480  02ba ae5216        	ldw	x,#21014
1481  02bd 89            	pushw	x
1482  02be 1e09          	ldw	x,(OFST+9,sp)
1483  02c0 cd0000        	call	c_uitolx
1485  02c3 be02          	ldw	x,c_lreg+2
1486  02c5 89            	pushw	x
1487  02c6 be00          	ldw	x,c_lreg
1488  02c8 89            	pushw	x
1489  02c9 ae5075        	ldw	x,#20597
1490  02cc cd0000        	call	_DMA_Init
1492  02cf 5b0c          	addw	sp,#12
1493  02d1               L144:
1494                     ; 452   DMA_ITConfig(sEE_I2C_DMA_CHANNEL_TX, DMA_ITx_TC, ENABLE);
1496  02d1 4b01          	push	#1
1497  02d3 4b02          	push	#2
1498  02d5 ae5093        	ldw	x,#20627
1499  02d8 cd0000        	call	_DMA_ITConfig
1501  02db 85            	popw	x
1502                     ; 453   DMA_ITConfig(sEE_I2C_DMA_CHANNEL_RX, DMA_ITx_TC, ENABLE);
1504  02dc 4b01          	push	#1
1505  02de 4b02          	push	#2
1506  02e0 ae5075        	ldw	x,#20597
1507  02e3 cd0000        	call	_DMA_ITConfig
1509  02e6 85            	popw	x
1510                     ; 454 }
1513  02e7 85            	popw	x
1514  02e8 81            	ret
1542                     ; 461 void LM75_LowLevel_DeInit(void)
1542                     ; 462 {
1543                     	switch	.text
1544  02e9               _LM75_LowLevel_DeInit:
1548                     ; 464   I2C_Cmd(LM75_I2C, DISABLE);
1550  02e9 4b00          	push	#0
1551  02eb ae5210        	ldw	x,#21008
1552  02ee cd0000        	call	_I2C_Cmd
1554  02f1 84            	pop	a
1555                     ; 466   I2C_DeInit(LM75_I2C);
1557  02f2 ae5210        	ldw	x,#21008
1558  02f5 cd0000        	call	_I2C_DeInit
1560                     ; 469   CLK_PeripheralClockConfig(LM75_I2C_CLK, DISABLE);
1562  02f8 ae0300        	ldw	x,#768
1563  02fb cd0000        	call	_CLK_PeripheralClockConfig
1565                     ; 472   GPIO_Init(LM75_I2C_SCL_GPIO_PORT, LM75_I2C_SCL_PIN, GPIO_Mode_In_PU_No_IT);
1567  02fe 4b40          	push	#64
1568  0300 4b02          	push	#2
1569  0302 ae500a        	ldw	x,#20490
1570  0305 cd0000        	call	_GPIO_Init
1572  0308 85            	popw	x
1573                     ; 475   GPIO_Init(LM75_I2C_SDA_GPIO_PORT, LM75_I2C_SDA_PIN, GPIO_Mode_In_PU_No_IT);
1575  0309 4b40          	push	#64
1576  030b 4b01          	push	#1
1577  030d ae500a        	ldw	x,#20490
1578  0310 cd0000        	call	_GPIO_Init
1580  0313 85            	popw	x
1581                     ; 478   GPIO_Init(LM75_I2C_SMBUSALERT_GPIO_PORT, LM75_I2C_SMBUSALERT_PIN, GPIO_Mode_In_FL_No_IT);
1583  0314 4b00          	push	#0
1584  0316 4b10          	push	#16
1585  0318 ae500a        	ldw	x,#20490
1586  031b cd0000        	call	_GPIO_Init
1588  031e 85            	popw	x
1589                     ; 479 }
1592  031f 81            	ret
1617                     ; 486 void LM75_LowLevel_Init(void)
1617                     ; 487 {
1618                     	switch	.text
1619  0320               _LM75_LowLevel_Init:
1623                     ; 489   CLK_PeripheralClockConfig(LM75_I2C_CLK, ENABLE);
1625  0320 ae0301        	ldw	x,#769
1626  0323 cd0000        	call	_CLK_PeripheralClockConfig
1628                     ; 492   GPIO_Init(LM75_I2C_SMBUSALERT_GPIO_PORT, LM75_I2C_SMBUSALERT_PIN, GPIO_Mode_In_FL_No_IT);
1630  0326 4b00          	push	#0
1631  0328 4b10          	push	#16
1632  032a ae500a        	ldw	x,#20490
1633  032d cd0000        	call	_GPIO_Init
1635  0330 85            	popw	x
1636                     ; 494 }
1639  0331 81            	ret
1924                     	xdef	_COM_RX_PIN
1925                     	xdef	_COM_TX_PIN
1926                     	xdef	_COM_USART_CLK
1927                     	xdef	_COM_PORT
1928                     	xdef	_COM_USART
1929                     	xdef	_BUTTON_EXTI
1930                     	xdef	_BUTTON_PIN
1931                     	xdef	_BUTTON_PORT
1932                     	xdef	_LED_PIN
1933                     	xdef	_LED_PORT
1934                     	xdef	_LM75_LowLevel_Init
1935                     	xdef	_LM75_LowLevel_DeInit
1936                     	xdef	_sEE_LowLevel_DMAConfig
1937                     	xdef	_sEE_LowLevel_Init
1938                     	xdef	_sEE_LowLevel_DeInit
1939                     	xdef	_sFLASH_LowLevel_Init
1940                     	xdef	_sFLASH_LowLevel_DeInit
1941                     	xdef	_SD_LowLevel_Init
1942                     	xdef	_SD_LowLevel_DeInit
1943                     	xdef	_STM_EVAL_COMInit
1944                     	xdef	_STM_EVAL_PBGetState
1945                     	xdef	_STM_EVAL_PBInit
1946                     	xdef	_STM_EVAL_LEDToggle
1947                     	xdef	_STM_EVAL_LEDOff
1948                     	xdef	_STM_EVAL_LEDOn
1949                     	xdef	_STM_EVAL_LEDInit
1950                     	xref	_USART_Init
1951                     	xref	_SPI_Cmd
1952                     	xref	_SPI_Init
1953                     	xref	_I2C_Cmd
1954                     	xref	_I2C_DeInit
1955                     	xref	_GPIO_ReadInputDataBit
1956                     	xref	_GPIO_ExternalPullUpConfig
1957                     	xref	_GPIO_Init
1958                     	xref	_EXTI_SetPinSensitivity
1959                     	xref	_DMA_ITConfig
1960                     	xref	_DMA_Cmd
1961                     	xref	_DMA_Init
1962                     	xref	_DMA_DeInit
1963                     	xref	_CLK_PeripheralClockConfig
1964                     	xref.b	c_lreg
1983                     	xref	c_uitolx
1984                     	end
