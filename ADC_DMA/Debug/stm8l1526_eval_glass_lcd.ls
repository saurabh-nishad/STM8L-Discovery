   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  16                     .const:	section	.text
  17  0000               _mask:
  18  0000 f000          	dc.w	-4096
  19  0002 0f00          	dc.w	3840
  20  0004 00f0          	dc.w	240
  21  0006 000f          	dc.w	15
  22  0008               _shift:
  23  0008 0c            	dc.b	12
  24  0009 08            	dc.b	8
  25  000a 04            	dc.b	4
  26  000b 00            	dc.b	0
  27  000c               _LetterMap:
  28  000c 4d70          	dc.w	19824
  29  000e 6469          	dc.w	25705
  30  0010 4111          	dc.w	16657
  31  0012 6449          	dc.w	25673
  32  0014 4911          	dc.w	18705
  33  0016 4910          	dc.w	18704
  34  0018 4171          	dc.w	16753
  35  001a 0d70          	dc.w	3440
  36  001c 6009          	dc.w	24585
  37  001e 0451          	dc.w	1105
  38  0020 0b12          	dc.w	2834
  39  0022 0111          	dc.w	273
  40  0024 8750          	dc.w	-30896
  41  0026 8552          	dc.w	-31406
  42  0028 4551          	dc.w	17745
  43  002a 4d30          	dc.w	19760
  44  002c 4553          	dc.w	17747
  45  002e 4d32          	dc.w	19762
  46  0030 4961          	dc.w	18785
  47  0032 6008          	dc.w	24584
  48  0034 0551          	dc.w	1361
  49  0036 0390          	dc.w	912
  50  0038 05d2          	dc.w	1490
  51  003a 8282          	dc.w	-32126
  52  003c 8208          	dc.w	-32248
  53  003e 4281          	dc.w	17025
  54  0040               _NumberMap:
  55  0040 47d1          	dc.w	18385
  56  0042 0640          	dc.w	1600
  57  0044 4c31          	dc.w	19505
  58  0046 4c61          	dc.w	19553
  59  0048 0d60          	dc.w	3424
  60  004a 4961          	dc.w	18785
  61  004c 4971          	dc.w	18801
  62  004e 4440          	dc.w	17472
  63  0050 4d71          	dc.w	19825
  64  0052 4d61          	dc.w	19809
  65                     	bsct
  66  0000               _str:
  67  0000 00            	dc.b	0
  68  0001 000000000000  	ds.b	6
 106                     ; 130 void LCD_GLASS_Init(void)
 106                     ; 131 {
 108                     	switch	.text
 109  0000               _LCD_GLASS_Init:
 113                     ; 144   CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);
 115  0000 ae1301        	ldw	x,#4865
 116  0003 cd0000        	call	_CLK_PeripheralClockConfig
 118                     ; 145   CLK_RTCClockConfig(CLK_RTCCLKSource_LSE, CLK_RTCCLKDiv_1);
 120  0006 ae1000        	ldw	x,#4096
 121  0009 cd0000        	call	_CLK_RTCClockConfig
 123                     ; 148   LCD_Init(LCD_Prescaler_2, LCD_Divider_18, LCD_Duty_1_4,
 123                     ; 149            LCD_Bias_1_3, LCD_VoltageSource_Internal);
 125  000c 4b00          	push	#0
 126  000e 4b00          	push	#0
 127  0010 4b06          	push	#6
 128  0012 ae1002        	ldw	x,#4098
 129  0015 cd0000        	call	_LCD_Init
 131  0018 5b03          	addw	sp,#3
 132                     ; 152   LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
 134  001a ae00ff        	ldw	x,#255
 135  001d cd0000        	call	_LCD_PortMaskConfig
 137                     ; 153   LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFF);
 139  0020 ae01ff        	ldw	x,#511
 140  0023 cd0000        	call	_LCD_PortMaskConfig
 142                     ; 154   LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0xFF);
 144  0026 ae02ff        	ldw	x,#767
 145  0029 cd0000        	call	_LCD_PortMaskConfig
 147                     ; 155   LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0xFF);
 149  002c ae03ff        	ldw	x,#1023
 150  002f cd0000        	call	_LCD_PortMaskConfig
 152                     ; 157   LCD_ContrastConfig(LCD_Contrast_Level_7);
 154  0032 a60e          	ld	a,#14
 155  0034 cd0000        	call	_LCD_ContrastConfig
 157                     ; 158   LCD_DeadTimeConfig(LCD_DeadTime_0);
 159  0037 4f            	clr	a
 160  0038 cd0000        	call	_LCD_DeadTimeConfig
 162                     ; 159   LCD_PulseOnDurationConfig(LCD_PulseOnDuration_1);
 164  003b a620          	ld	a,#32
 165  003d cd0000        	call	_LCD_PulseOnDurationConfig
 167                     ; 161   LCD_Cmd(ENABLE); /*!< Enable LCD peripheral */
 169  0040 a601          	ld	a,#1
 170  0042 cd0000        	call	_LCD_Cmd
 172                     ; 162 }
 175  0045 81            	ret
 282                     ; 176 void LCD_GLASS_WriteChar(uint8_t* ch, Point_Typedef point,
 282                     ; 177                          Apostrophe_Typedef apostrophe, uint8_t position)
 282                     ; 178 {
 283                     	switch	.text
 284  0046               _LCD_GLASS_WriteChar:
 286  0046 89            	pushw	x
 287       00000000      OFST:	set	0
 290                     ; 179   Convert(ch, point, apostrophe);
 292  0047 7b06          	ld	a,(OFST+6,sp)
 293  0049 88            	push	a
 294  004a 7b06          	ld	a,(OFST+6,sp)
 295  004c 88            	push	a
 296  004d cd05ee        	call	L3_Convert
 298  0050 85            	popw	x
 299                     ; 181   switch (position)
 301  0051 7b07          	ld	a,(OFST+7,sp)
 303                     ; 267     default:
 303                     ; 268       break;
 304  0053 4d            	tnz	a
 305  0054 2725          	jreq	L52
 306  0056 4a            	dec	a
 307  0057 2770          	jreq	L72
 308  0059 4a            	dec	a
 309  005a 2603          	jrne	L01
 310  005c cc0117        	jp	L13
 311  005f               L01:
 312  005f 4a            	dec	a
 313  0060 2603          	jrne	L21
 314  0062 cc0165        	jp	L33
 315  0065               L21:
 316  0065 4a            	dec	a
 317  0066 2603          	jrne	L41
 318  0068 cc01b3        	jp	L53
 319  006b               L41:
 320  006b 4a            	dec	a
 321  006c 2603          	jrne	L61
 322  006e cc0201        	jp	L73
 323  0071               L61:
 324  0071 4a            	dec	a
 325  0072 2603          	jrne	L02
 326  0074 cc024d        	jp	L14
 327  0077               L02:
 328  0077 ac970297      	jpf	L121
 329  007b               L52:
 330                     ; 184     case 0:
 330                     ; 185       LCD->RAM[LCD_RAMRegister_3] &= LCD_CLEAR_LSB;
 332  007b c6540f        	ld	a,21519
 333  007e a4f0          	and	a,#240
 334  0080 c7540f        	ld	21519,a
 335                     ; 186       LCD->RAM[LCD_RAMRegister_3] |=  digit[0];
 337  0083 c6540f        	ld	a,21519
 338  0086 ba00          	or	a,_digit
 339  0088 c7540f        	ld	21519,a
 340                     ; 187       LCD->RAM[LCD_RAMRegister_6] &= LCD_CLEAR_MSB;
 342  008b c65412        	ld	a,21522
 343  008e a40f          	and	a,#15
 344  0090 c75412        	ld	21522,a
 345                     ; 188       LCD->RAM[LCD_RAMRegister_6] |=  (uint8_t)(digit[1] << 4);
 347  0093 b601          	ld	a,_digit+1
 348  0095 97            	ld	xl,a
 349  0096 a610          	ld	a,#16
 350  0098 42            	mul	x,a
 351  0099 9f            	ld	a,xl
 352  009a ca5412        	or	a,21522
 353  009d c75412        	ld	21522,a
 354                     ; 189       LCD->RAM[LCD_RAMRegister_10] &= LCD_CLEAR_LSB;
 356  00a0 c65416        	ld	a,21526
 357  00a3 a4f0          	and	a,#240
 358  00a5 c75416        	ld	21526,a
 359                     ; 190       LCD->RAM[LCD_RAMRegister_10] |=  digit[2];
 361  00a8 c65416        	ld	a,21526
 362  00ab ba02          	or	a,_digit+2
 363  00ad c75416        	ld	21526,a
 364                     ; 191       LCD->RAM[LCD_RAMRegister_13] &= LCD_CLEAR_MSB;
 366  00b0 c65419        	ld	a,21529
 367  00b3 a40f          	and	a,#15
 368  00b5 c75419        	ld	21529,a
 369                     ; 192       LCD->RAM[LCD_RAMRegister_13] |=  (uint8_t)((uint8_t)digit[3] << 4);
 371  00b8 b603          	ld	a,_digit+3
 372  00ba 97            	ld	xl,a
 373  00bb a610          	ld	a,#16
 374  00bd 42            	mul	x,a
 375  00be 9f            	ld	a,xl
 376  00bf ca5419        	or	a,21529
 377  00c2 c75419        	ld	21529,a
 378                     ; 193       break;
 380  00c5 ac970297      	jpf	L121
 381  00c9               L72:
 382                     ; 196     case 1:
 382                     ; 197       LCD->RAM[LCD_RAMRegister_2] &= LCD_CLEAR_MSB;
 384  00c9 c6540e        	ld	a,21518
 385  00cc a40f          	and	a,#15
 386  00ce c7540e        	ld	21518,a
 387                     ; 198       LCD->RAM[LCD_RAMRegister_2] |=  (uint8_t)(digit[0] << 4);
 389  00d1 b600          	ld	a,_digit
 390  00d3 97            	ld	xl,a
 391  00d4 a610          	ld	a,#16
 392  00d6 42            	mul	x,a
 393  00d7 9f            	ld	a,xl
 394  00d8 ca540e        	or	a,21518
 395  00db c7540e        	ld	21518,a
 396                     ; 199       LCD->RAM[LCD_RAMRegister_6] &= LCD_CLEAR_LSB;
 398  00de c65412        	ld	a,21522
 399  00e1 a4f0          	and	a,#240
 400  00e3 c75412        	ld	21522,a
 401                     ; 200       LCD->RAM[LCD_RAMRegister_6] |=  digit[1];
 403  00e6 c65412        	ld	a,21522
 404  00e9 ba01          	or	a,_digit+1
 405  00eb c75412        	ld	21522,a
 406                     ; 201       LCD->RAM[LCD_RAMRegister_9] &= LCD_CLEAR_MSB;
 408  00ee c65415        	ld	a,21525
 409  00f1 a40f          	and	a,#15
 410  00f3 c75415        	ld	21525,a
 411                     ; 202       LCD->RAM[LCD_RAMRegister_9] |=   (uint8_t)(digit[2] << 4);
 413  00f6 b602          	ld	a,_digit+2
 414  00f8 97            	ld	xl,a
 415  00f9 a610          	ld	a,#16
 416  00fb 42            	mul	x,a
 417  00fc 9f            	ld	a,xl
 418  00fd ca5415        	or	a,21525
 419  0100 c75415        	ld	21525,a
 420                     ; 203       LCD->RAM[LCD_RAMRegister_13] &= LCD_CLEAR_LSB;
 422  0103 c65419        	ld	a,21529
 423  0106 a4f0          	and	a,#240
 424  0108 c75419        	ld	21529,a
 425                     ; 204       LCD->RAM[LCD_RAMRegister_13] |=  digit[3];
 427  010b c65419        	ld	a,21529
 428  010e ba03          	or	a,_digit+3
 429  0110 c75419        	ld	21529,a
 430                     ; 205       break;
 432  0113 ac970297      	jpf	L121
 433  0117               L13:
 434                     ; 208     case 2:
 434                     ; 209       LCD->RAM[LCD_RAMRegister_2] &= LCD_CLEAR_LSB;
 436  0117 c6540e        	ld	a,21518
 437  011a a4f0          	and	a,#240
 438  011c c7540e        	ld	21518,a
 439                     ; 210       LCD->RAM[LCD_RAMRegister_2] |=  digit[0];
 441  011f c6540e        	ld	a,21518
 442  0122 ba00          	or	a,_digit
 443  0124 c7540e        	ld	21518,a
 444                     ; 211       LCD->RAM[LCD_RAMRegister_5] &= LCD_CLEAR_MSB;
 446  0127 c65411        	ld	a,21521
 447  012a a40f          	and	a,#15
 448  012c c75411        	ld	21521,a
 449                     ; 212       LCD->RAM[LCD_RAMRegister_5] |=  (uint8_t)(digit[1] << 4);
 451  012f b601          	ld	a,_digit+1
 452  0131 97            	ld	xl,a
 453  0132 a610          	ld	a,#16
 454  0134 42            	mul	x,a
 455  0135 9f            	ld	a,xl
 456  0136 ca5411        	or	a,21521
 457  0139 c75411        	ld	21521,a
 458                     ; 213       LCD->RAM[LCD_RAMRegister_9] &= LCD_CLEAR_LSB;
 460  013c c65415        	ld	a,21525
 461  013f a4f0          	and	a,#240
 462  0141 c75415        	ld	21525,a
 463                     ; 214       LCD->RAM[LCD_RAMRegister_9] |=   digit[2];
 465  0144 c65415        	ld	a,21525
 466  0147 ba02          	or	a,_digit+2
 467  0149 c75415        	ld	21525,a
 468                     ; 215       LCD->RAM[LCD_RAMRegister_12] &= LCD_CLEAR_MSB;
 470  014c c65418        	ld	a,21528
 471  014f a40f          	and	a,#15
 472  0151 c75418        	ld	21528,a
 473                     ; 216       LCD->RAM[LCD_RAMRegister_12] |=  (uint8_t)(digit[3] << 4);
 475  0154 b603          	ld	a,_digit+3
 476  0156 97            	ld	xl,a
 477  0157 a610          	ld	a,#16
 478  0159 42            	mul	x,a
 479  015a 9f            	ld	a,xl
 480  015b ca5418        	or	a,21528
 481  015e c75418        	ld	21528,a
 482                     ; 217       break;
 484  0161 ac970297      	jpf	L121
 485  0165               L33:
 486                     ; 220     case 3:
 486                     ; 221       LCD->RAM[LCD_RAMRegister_1] &= LCD_CLEAR_MSB;
 488  0165 c6540d        	ld	a,21517
 489  0168 a40f          	and	a,#15
 490  016a c7540d        	ld	21517,a
 491                     ; 222       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0] << 4);
 493  016d b600          	ld	a,_digit
 494  016f 97            	ld	xl,a
 495  0170 a610          	ld	a,#16
 496  0172 42            	mul	x,a
 497  0173 9f            	ld	a,xl
 498  0174 ca540d        	or	a,21517
 499  0177 c7540d        	ld	21517,a
 500                     ; 223       LCD->RAM[LCD_RAMRegister_5] &= LCD_CLEAR_LSB;
 502  017a c65411        	ld	a,21521
 503  017d a4f0          	and	a,#240
 504  017f c75411        	ld	21521,a
 505                     ; 224       LCD->RAM[LCD_RAMRegister_5] |=  digit[1];
 507  0182 c65411        	ld	a,21521
 508  0185 ba01          	or	a,_digit+1
 509  0187 c75411        	ld	21521,a
 510                     ; 225       LCD->RAM[LCD_RAMRegister_8] &= LCD_CLEAR_MSB;
 512  018a c65414        	ld	a,21524
 513  018d a40f          	and	a,#15
 514  018f c75414        	ld	21524,a
 515                     ; 226       LCD->RAM[LCD_RAMRegister_8] |=   (uint8_t)(digit[2] << 4);
 517  0192 b602          	ld	a,_digit+2
 518  0194 97            	ld	xl,a
 519  0195 a610          	ld	a,#16
 520  0197 42            	mul	x,a
 521  0198 9f            	ld	a,xl
 522  0199 ca5414        	or	a,21524
 523  019c c75414        	ld	21524,a
 524                     ; 227       LCD->RAM[LCD_RAMRegister_12] &= LCD_CLEAR_LSB;
 526  019f c65418        	ld	a,21528
 527  01a2 a4f0          	and	a,#240
 528  01a4 c75418        	ld	21528,a
 529                     ; 228       LCD->RAM[LCD_RAMRegister_12] |=  digit[3];
 531  01a7 c65418        	ld	a,21528
 532  01aa ba03          	or	a,_digit+3
 533  01ac c75418        	ld	21528,a
 534                     ; 229       break;
 536  01af ac970297      	jpf	L121
 537  01b3               L53:
 538                     ; 232     case 4:
 538                     ; 233       LCD->RAM[LCD_RAMRegister_1] &= LCD_CLEAR_LSB;
 540  01b3 c6540d        	ld	a,21517
 541  01b6 a4f0          	and	a,#240
 542  01b8 c7540d        	ld	21517,a
 543                     ; 234       LCD->RAM[LCD_RAMRegister_1] |=  digit[0];
 545  01bb c6540d        	ld	a,21517
 546  01be ba00          	or	a,_digit
 547  01c0 c7540d        	ld	21517,a
 548                     ; 235       LCD->RAM[LCD_RAMRegister_4] &= LCD_CLEAR_MSB;
 550  01c3 c65410        	ld	a,21520
 551  01c6 a40f          	and	a,#15
 552  01c8 c75410        	ld	21520,a
 553                     ; 236       LCD->RAM[LCD_RAMRegister_4] |=  (uint8_t)(digit[1] << 4);
 555  01cb b601          	ld	a,_digit+1
 556  01cd 97            	ld	xl,a
 557  01ce a610          	ld	a,#16
 558  01d0 42            	mul	x,a
 559  01d1 9f            	ld	a,xl
 560  01d2 ca5410        	or	a,21520
 561  01d5 c75410        	ld	21520,a
 562                     ; 237       LCD->RAM[LCD_RAMRegister_8] &= LCD_CLEAR_LSB;
 564  01d8 c65414        	ld	a,21524
 565  01db a4f0          	and	a,#240
 566  01dd c75414        	ld	21524,a
 567                     ; 238       LCD->RAM[LCD_RAMRegister_8] |=   digit[2];
 569  01e0 c65414        	ld	a,21524
 570  01e3 ba02          	or	a,_digit+2
 571  01e5 c75414        	ld	21524,a
 572                     ; 239       LCD->RAM[LCD_RAMRegister_11] &= LCD_CLEAR_MSB;
 574  01e8 c65417        	ld	a,21527
 575  01eb a40f          	and	a,#15
 576  01ed c75417        	ld	21527,a
 577                     ; 240       LCD->RAM[LCD_RAMRegister_11] |=  (uint8_t)(digit[3] << 4);
 579  01f0 b603          	ld	a,_digit+3
 580  01f2 97            	ld	xl,a
 581  01f3 a610          	ld	a,#16
 582  01f5 42            	mul	x,a
 583  01f6 9f            	ld	a,xl
 584  01f7 ca5417        	or	a,21527
 585  01fa c75417        	ld	21527,a
 586                     ; 241       break;
 588  01fd ac970297      	jpf	L121
 589  0201               L73:
 590                     ; 244     case 5:
 590                     ; 245       LCD->RAM[LCD_RAMRegister_0] &= LCD_CLEAR_MSB;
 592  0201 c6540c        	ld	a,21516
 593  0204 a40f          	and	a,#15
 594  0206 c7540c        	ld	21516,a
 595                     ; 246       LCD->RAM[LCD_RAMRegister_0] |=  (uint8_t)(digit[0] << 4);
 597  0209 b600          	ld	a,_digit
 598  020b 97            	ld	xl,a
 599  020c a610          	ld	a,#16
 600  020e 42            	mul	x,a
 601  020f 9f            	ld	a,xl
 602  0210 ca540c        	or	a,21516
 603  0213 c7540c        	ld	21516,a
 604                     ; 247       LCD->RAM[LCD_RAMRegister_4] &= LCD_CLEAR_LSB;
 606  0216 c65410        	ld	a,21520
 607  0219 a4f0          	and	a,#240
 608  021b c75410        	ld	21520,a
 609                     ; 248       LCD->RAM[LCD_RAMRegister_4] |=  digit[1];
 611  021e c65410        	ld	a,21520
 612  0221 ba01          	or	a,_digit+1
 613  0223 c75410        	ld	21520,a
 614                     ; 249       LCD->RAM[LCD_RAMRegister_7] &= LCD_CLEAR_MSB;
 616  0226 c65413        	ld	a,21523
 617  0229 a40f          	and	a,#15
 618  022b c75413        	ld	21523,a
 619                     ; 250       LCD->RAM[LCD_RAMRegister_7] |=   (uint8_t)(digit[2] << 4);
 621  022e b602          	ld	a,_digit+2
 622  0230 97            	ld	xl,a
 623  0231 a610          	ld	a,#16
 624  0233 42            	mul	x,a
 625  0234 9f            	ld	a,xl
 626  0235 ca5413        	or	a,21523
 627  0238 c75413        	ld	21523,a
 628                     ; 251       LCD->RAM[LCD_RAMRegister_11] &= LCD_CLEAR_LSB;
 630  023b c65417        	ld	a,21527
 631  023e a4f0          	and	a,#240
 632  0240 c75417        	ld	21527,a
 633                     ; 252       LCD->RAM[LCD_RAMRegister_11] |=  digit[3];
 635  0243 c65417        	ld	a,21527
 636  0246 ba03          	or	a,_digit+3
 637  0248 c75417        	ld	21527,a
 638                     ; 253       break;
 640  024b 204a          	jra	L121
 641  024d               L14:
 642                     ; 256     case 6:
 642                     ; 257       LCD->RAM[LCD_RAMRegister_0] &= LCD_CLEAR_LSB;
 644  024d c6540c        	ld	a,21516
 645  0250 a4f0          	and	a,#240
 646  0252 c7540c        	ld	21516,a
 647                     ; 258       LCD->RAM[LCD_RAMRegister_0] |=  digit[0];
 649  0255 c6540c        	ld	a,21516
 650  0258 ba00          	or	a,_digit
 651  025a c7540c        	ld	21516,a
 652                     ; 259       LCD->RAM[LCD_RAMRegister_3] &= LCD_CLEAR_MSB;
 654  025d c6540f        	ld	a,21519
 655  0260 a40f          	and	a,#15
 656  0262 c7540f        	ld	21519,a
 657                     ; 260       LCD->RAM[LCD_RAMRegister_3] |=  (uint8_t)(digit[1] << 4);
 659  0265 b601          	ld	a,_digit+1
 660  0267 97            	ld	xl,a
 661  0268 a610          	ld	a,#16
 662  026a 42            	mul	x,a
 663  026b 9f            	ld	a,xl
 664  026c ca540f        	or	a,21519
 665  026f c7540f        	ld	21519,a
 666                     ; 261       LCD->RAM[LCD_RAMRegister_7] &= LCD_CLEAR_LSB;
 668  0272 c65413        	ld	a,21523
 669  0275 a4f0          	and	a,#240
 670  0277 c75413        	ld	21523,a
 671                     ; 262       LCD->RAM[LCD_RAMRegister_7] |=  digit[2];
 673  027a c65413        	ld	a,21523
 674  027d ba02          	or	a,_digit+2
 675  027f c75413        	ld	21523,a
 676                     ; 263       LCD->RAM[LCD_RAMRegister_10] &= LCD_CLEAR_MSB;
 678  0282 c65416        	ld	a,21526
 679  0285 a40f          	and	a,#15
 680  0287 c75416        	ld	21526,a
 681                     ; 264       LCD->RAM[LCD_RAMRegister_10] |=  (uint8_t)(digit[3] << 4);
 683  028a b603          	ld	a,_digit+3
 684  028c 97            	ld	xl,a
 685  028d a610          	ld	a,#16
 686  028f 42            	mul	x,a
 687  0290 9f            	ld	a,xl
 688  0291 ca5416        	or	a,21526
 689  0294 c75416        	ld	21526,a
 690                     ; 265       break;
 692  0297               L34:
 693                     ; 267     default:
 693                     ; 268       break;
 695  0297               L121:
 696                     ; 270 }
 699  0297 85            	popw	x
 700  0298 81            	ret
 746                     ; 277 void LCD_GLASS_DisplayString(uint8_t* ptr)
 746                     ; 278 {
 747                     	switch	.text
 748  0299               _LCD_GLASS_DisplayString:
 750  0299 89            	pushw	x
 751  029a 88            	push	a
 752       00000001      OFST:	set	1
 755                     ; 279   uint8_t i = 0x00;
 757  029b 0f01          	clr	(OFST+0,sp)
 760  029d 2017          	jra	L151
 761  029f               L541:
 762                     ; 285     LCD_GLASS_WriteChar(ptr, POINT_OFF, APOSTROPHE_OFF, i);
 764  029f 7b01          	ld	a,(OFST+0,sp)
 765  02a1 88            	push	a
 766  02a2 4b00          	push	#0
 767  02a4 4b00          	push	#0
 768  02a6 1e05          	ldw	x,(OFST+4,sp)
 769  02a8 cd0046        	call	_LCD_GLASS_WriteChar
 771  02ab 5b03          	addw	sp,#3
 772                     ; 288     ptr++;
 774  02ad 1e02          	ldw	x,(OFST+1,sp)
 775  02af 1c0001        	addw	x,#1
 776  02b2 1f02          	ldw	(OFST+1,sp),x
 777                     ; 291     i++;
 779  02b4 0c01          	inc	(OFST+0,sp)
 781  02b6               L151:
 782                     ; 282   while ((*ptr != 0) & (i < 8))
 784  02b6 1e02          	ldw	x,(OFST+1,sp)
 785  02b8 7d            	tnz	(x)
 786  02b9 2706          	jreq	L551
 788  02bb 7b01          	ld	a,(OFST+0,sp)
 789  02bd a108          	cp	a,#8
 790  02bf 25de          	jrult	L541
 791  02c1               L551:
 792                     ; 293 }
 795  02c1 5b03          	addw	sp,#3
 796  02c3 81            	ret
 831                     ; 300 void LCD_GLASS_ClearChar(uint8_t position)
 831                     ; 301 {
 832                     	switch	.text
 833  02c4               _LCD_GLASS_ClearChar:
 837                     ; 302   switch (position)
 840                     ; 360     default:
 840                     ; 361       break;
 841  02c4 4d            	tnz	a
 842  02c5 2722          	jreq	L751
 843  02c7 4a            	dec	a
 844  02c8 2743          	jreq	L161
 845  02ca 4a            	dec	a
 846  02cb 2764          	jreq	L361
 847  02cd 4a            	dec	a
 848  02ce 2603          	jrne	L62
 849  02d0 cc0355        	jp	L561
 850  02d3               L62:
 851  02d3 4a            	dec	a
 852  02d4 2603          	jrne	L03
 853  02d6 cc0377        	jp	L761
 854  02d9               L03:
 855  02d9 4a            	dec	a
 856  02da 2603          	jrne	L23
 857  02dc cc0399        	jp	L171
 858  02df               L23:
 859  02df 4a            	dec	a
 860  02e0 2603          	jrne	L43
 861  02e2 cc03bb        	jp	L371
 862  02e5               L43:
 863  02e5 acdb03db      	jpf	L712
 864  02e9               L751:
 865                     ; 305     case 0:
 865                     ; 306       LCD->RAM[LCD_RAMRegister_3]  &=  LCD_CLEAR_LSB;
 867  02e9 c6540f        	ld	a,21519
 868  02ec a4f0          	and	a,#240
 869  02ee c7540f        	ld	21519,a
 870                     ; 307       LCD->RAM[LCD_RAMRegister_6]  &=  LCD_CLEAR_MSB;
 872  02f1 c65412        	ld	a,21522
 873  02f4 a40f          	and	a,#15
 874  02f6 c75412        	ld	21522,a
 875                     ; 308       LCD->RAM[LCD_RAMRegister_10] &=  LCD_CLEAR_LSB;
 877  02f9 c65416        	ld	a,21526
 878  02fc a4f0          	and	a,#240
 879  02fe c75416        	ld	21526,a
 880                     ; 309       LCD->RAM[LCD_RAMRegister_13] &=  LCD_CLEAR_MSB;
 882  0301 c65419        	ld	a,21529
 883  0304 a40f          	and	a,#15
 884  0306 c75419        	ld	21529,a
 885                     ; 310       break;
 887  0309 acdb03db      	jpf	L712
 888  030d               L161:
 889                     ; 313     case 1:
 889                     ; 314       LCD->RAM[LCD_RAMRegister_2]  &=  LCD_CLEAR_MSB;
 891  030d c6540e        	ld	a,21518
 892  0310 a40f          	and	a,#15
 893  0312 c7540e        	ld	21518,a
 894                     ; 315       LCD->RAM[LCD_RAMRegister_6]  &=  LCD_CLEAR_LSB;
 896  0315 c65412        	ld	a,21522
 897  0318 a4f0          	and	a,#240
 898  031a c75412        	ld	21522,a
 899                     ; 316       LCD->RAM[LCD_RAMRegister_9]  &=  LCD_CLEAR_MSB;
 901  031d c65415        	ld	a,21525
 902  0320 a40f          	and	a,#15
 903  0322 c75415        	ld	21525,a
 904                     ; 317       LCD->RAM[LCD_RAMRegister_13] &=  LCD_CLEAR_LSB;
 906  0325 c65419        	ld	a,21529
 907  0328 a4f0          	and	a,#240
 908  032a c75419        	ld	21529,a
 909                     ; 318       break;
 911  032d acdb03db      	jpf	L712
 912  0331               L361:
 913                     ; 321     case 2:
 913                     ; 322       LCD->RAM[LCD_RAMRegister_2]  &=  LCD_CLEAR_LSB;
 915  0331 c6540e        	ld	a,21518
 916  0334 a4f0          	and	a,#240
 917  0336 c7540e        	ld	21518,a
 918                     ; 323       LCD->RAM[LCD_RAMRegister_5]  &=  LCD_CLEAR_MSB;
 920  0339 c65411        	ld	a,21521
 921  033c a40f          	and	a,#15
 922  033e c75411        	ld	21521,a
 923                     ; 324       LCD->RAM[LCD_RAMRegister_9]  &=  LCD_CLEAR_LSB;
 925  0341 c65415        	ld	a,21525
 926  0344 a4f0          	and	a,#240
 927  0346 c75415        	ld	21525,a
 928                     ; 325       LCD->RAM[LCD_RAMRegister_12] &=  LCD_CLEAR_MSB;
 930  0349 c65418        	ld	a,21528
 931  034c a40f          	and	a,#15
 932  034e c75418        	ld	21528,a
 933                     ; 326       break;
 935  0351 acdb03db      	jpf	L712
 936  0355               L561:
 937                     ; 329     case 3:
 937                     ; 330       LCD->RAM[LCD_RAMRegister_1]  &=  LCD_CLEAR_MSB;
 939  0355 c6540d        	ld	a,21517
 940  0358 a40f          	and	a,#15
 941  035a c7540d        	ld	21517,a
 942                     ; 331       LCD->RAM[LCD_RAMRegister_5]  &=  LCD_CLEAR_LSB;
 944  035d c65411        	ld	a,21521
 945  0360 a4f0          	and	a,#240
 946  0362 c75411        	ld	21521,a
 947                     ; 332       LCD->RAM[LCD_RAMRegister_8]  &=  LCD_CLEAR_MSB;
 949  0365 c65414        	ld	a,21524
 950  0368 a40f          	and	a,#15
 951  036a c75414        	ld	21524,a
 952                     ; 333       LCD->RAM[LCD_RAMRegister_12] &=  LCD_CLEAR_LSB;
 954  036d c65418        	ld	a,21528
 955  0370 a4f0          	and	a,#240
 956  0372 c75418        	ld	21528,a
 957                     ; 334       break;
 959  0375 2064          	jra	L712
 960  0377               L761:
 961                     ; 337     case 4:
 961                     ; 338       LCD->RAM[LCD_RAMRegister_1]  &=  LCD_CLEAR_LSB;
 963  0377 c6540d        	ld	a,21517
 964  037a a4f0          	and	a,#240
 965  037c c7540d        	ld	21517,a
 966                     ; 339       LCD->RAM[LCD_RAMRegister_4]  &=  LCD_CLEAR_MSB;
 968  037f c65410        	ld	a,21520
 969  0382 a40f          	and	a,#15
 970  0384 c75410        	ld	21520,a
 971                     ; 340       LCD->RAM[LCD_RAMRegister_8]  &=  LCD_CLEAR_LSB;
 973  0387 c65414        	ld	a,21524
 974  038a a4f0          	and	a,#240
 975  038c c75414        	ld	21524,a
 976                     ; 341       LCD->RAM[LCD_RAMRegister_11] &=  LCD_CLEAR_MSB;
 978  038f c65417        	ld	a,21527
 979  0392 a40f          	and	a,#15
 980  0394 c75417        	ld	21527,a
 981                     ; 342       break;
 983  0397 2042          	jra	L712
 984  0399               L171:
 985                     ; 345     case 5:
 985                     ; 346       LCD->RAM[LCD_RAMRegister_0]  &=  LCD_CLEAR_MSB;
 987  0399 c6540c        	ld	a,21516
 988  039c a40f          	and	a,#15
 989  039e c7540c        	ld	21516,a
 990                     ; 347       LCD->RAM[LCD_RAMRegister_4]  &=  LCD_CLEAR_LSB;
 992  03a1 c65410        	ld	a,21520
 993  03a4 a4f0          	and	a,#240
 994  03a6 c75410        	ld	21520,a
 995                     ; 348       LCD->RAM[LCD_RAMRegister_7]  &=  LCD_CLEAR_MSB;
 997  03a9 c65413        	ld	a,21523
 998  03ac a40f          	and	a,#15
 999  03ae c75413        	ld	21523,a
1000                     ; 349       LCD->RAM[LCD_RAMRegister_11] &=  LCD_CLEAR_LSB;
1002  03b1 c65417        	ld	a,21527
1003  03b4 a4f0          	and	a,#240
1004  03b6 c75417        	ld	21527,a
1005                     ; 350       break;
1007  03b9 2020          	jra	L712
1008  03bb               L371:
1009                     ; 353     case 6:
1009                     ; 354       LCD->RAM[LCD_RAMRegister_0]  &=  LCD_CLEAR_LSB;
1011  03bb c6540c        	ld	a,21516
1012  03be a4f0          	and	a,#240
1013  03c0 c7540c        	ld	21516,a
1014                     ; 355       LCD->RAM[LCD_RAMRegister_3]  &=  LCD_CLEAR_MSB;
1016  03c3 c6540f        	ld	a,21519
1017  03c6 a40f          	and	a,#15
1018  03c8 c7540f        	ld	21519,a
1019                     ; 356       LCD->RAM[LCD_RAMRegister_7]  &=  LCD_CLEAR_LSB;
1021  03cb c65413        	ld	a,21523
1022  03ce a4f0          	and	a,#240
1023  03d0 c75413        	ld	21523,a
1024                     ; 357       LCD->RAM[LCD_RAMRegister_10] &=  LCD_CLEAR_MSB;
1026  03d3 c65416        	ld	a,21526
1027  03d6 a40f          	and	a,#15
1028  03d8 c75416        	ld	21526,a
1029                     ; 358       break;
1031  03db               L571:
1032                     ; 360     default:
1032                     ; 361       break;
1034  03db               L712:
1035                     ; 363 }
1038  03db 81            	ret
1072                     ; 370 void LCD_GLASS_Clear(void)
1072                     ; 371 {
1073                     	switch	.text
1074  03dc               _LCD_GLASS_Clear:
1076  03dc 88            	push	a
1077       00000001      OFST:	set	1
1080                     ; 372   uint8_t counter = 0;
1082                     ; 373   for (counter = 0;counter < 0x0E; counter++)
1084  03dd 0f01          	clr	(OFST+0,sp)
1086  03df               L732:
1087                     ; 375     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
1089  03df 7b01          	ld	a,(OFST+0,sp)
1090  03e1 5f            	clrw	x
1091  03e2 97            	ld	xl,a
1092  03e3 724f540c      	clr	(21516,x)
1093                     ; 373   for (counter = 0;counter < 0x0E; counter++)
1095  03e7 0c01          	inc	(OFST+0,sp)
1099  03e9 7b01          	ld	a,(OFST+0,sp)
1100  03eb a10e          	cp	a,#14
1101  03ed 25f0          	jrult	L732
1102                     ; 377 }
1105  03ef 84            	pop	a
1106  03f0 81            	ret
1183                     ; 388 void LCD_GLASS_ScrollString(uint8_t* ptr, uint16_t nScroll, uint16_t ScrollSpeed)
1183                     ; 389 {
1184                     	switch	.text
1185  03f1               _LCD_GLASS_ScrollString:
1187  03f1 89            	pushw	x
1188  03f2 5203          	subw	sp,#3
1189       00000003      OFST:	set	3
1192                     ; 390   uint8_t Repetition = 0;
1194                     ; 392   ptr1 = ptr;
1196  03f4 1f02          	ldw	(OFST-1,sp),x
1198                     ; 394   LCD_GLASS_DisplayString(ptr1);
1200  03f6 1e02          	ldw	x,(OFST-1,sp)
1201  03f8 cd0299        	call	_LCD_GLASS_DisplayString
1203                     ; 396   delay(ScrollSpeed);
1205  03fb 1e0a          	ldw	x,(OFST+7,sp)
1206  03fd cd0000        	call	c_uitolx
1208  0400 be02          	ldw	x,c_lreg+2
1209  0402 89            	pushw	x
1210  0403 be00          	ldw	x,c_lreg
1211  0405 89            	pushw	x
1212  0406 cd0688        	call	L5_delay
1214  0409 5b04          	addw	sp,#4
1215                     ; 398   for (Repetition = 0; Repetition < nScroll; Repetition++)
1217  040b 0f01          	clr	(OFST-2,sp)
1220  040d ace005e0      	jpf	L703
1221  0411               L303:
1222                     ; 400     *(str + 1) = *ptr1;
1224  0411 1e02          	ldw	x,(OFST-1,sp)
1225  0413 f6            	ld	a,(x)
1226  0414 b701          	ld	_str+1,a
1227                     ; 401     *(str + 2) = *(ptr1 + 1);
1229  0416 1e02          	ldw	x,(OFST-1,sp)
1230  0418 e601          	ld	a,(1,x)
1231  041a b702          	ld	_str+2,a
1232                     ; 402     *(str + 3) = *(ptr1 + 2);
1234  041c 1e02          	ldw	x,(OFST-1,sp)
1235  041e e602          	ld	a,(2,x)
1236  0420 b703          	ld	_str+3,a
1237                     ; 403     *(str + 4) = *(ptr1 + 3);
1239  0422 1e02          	ldw	x,(OFST-1,sp)
1240  0424 e603          	ld	a,(3,x)
1241  0426 b704          	ld	_str+4,a
1242                     ; 404     *(str + 5) = *(ptr1 + 4);
1244  0428 1e02          	ldw	x,(OFST-1,sp)
1245  042a e604          	ld	a,(4,x)
1246  042c b705          	ld	_str+5,a
1247                     ; 405     *(str + 6) = *(ptr1 + 5);
1249  042e 1e02          	ldw	x,(OFST-1,sp)
1250  0430 e605          	ld	a,(5,x)
1251  0432 b706          	ld	_str+6,a
1252                     ; 406     *(str) = *(ptr1 + 6);
1254  0434 1e02          	ldw	x,(OFST-1,sp)
1255  0436 e606          	ld	a,(6,x)
1256  0438 b700          	ld	_str,a
1257                     ; 407     LCD_GLASS_Clear();
1259  043a ada0          	call	_LCD_GLASS_Clear
1261                     ; 408     LCD_GLASS_DisplayString((uint8_t*)str);
1263  043c ae0000        	ldw	x,#_str
1264  043f cd0299        	call	_LCD_GLASS_DisplayString
1266                     ; 409     delay(ScrollSpeed);
1268  0442 1e0a          	ldw	x,(OFST+7,sp)
1269  0444 cd0000        	call	c_uitolx
1271  0447 be02          	ldw	x,c_lreg+2
1272  0449 89            	pushw	x
1273  044a be00          	ldw	x,c_lreg
1274  044c 89            	pushw	x
1275  044d cd0688        	call	L5_delay
1277  0450 5b04          	addw	sp,#4
1278                     ; 411     *(str + 1) = *(ptr1 + 6);
1280  0452 1e02          	ldw	x,(OFST-1,sp)
1281  0454 e606          	ld	a,(6,x)
1282  0456 b701          	ld	_str+1,a
1283                     ; 412     *(str + 2) = *ptr1;
1285  0458 1e02          	ldw	x,(OFST-1,sp)
1286  045a f6            	ld	a,(x)
1287  045b b702          	ld	_str+2,a
1288                     ; 413     *(str + 3) = *(ptr1 + 1);
1290  045d 1e02          	ldw	x,(OFST-1,sp)
1291  045f e601          	ld	a,(1,x)
1292  0461 b703          	ld	_str+3,a
1293                     ; 414     *(str + 4) = *(ptr1 + 2);
1295  0463 1e02          	ldw	x,(OFST-1,sp)
1296  0465 e602          	ld	a,(2,x)
1297  0467 b704          	ld	_str+4,a
1298                     ; 415     *(str + 5) = *(ptr1 + 3);
1300  0469 1e02          	ldw	x,(OFST-1,sp)
1301  046b e603          	ld	a,(3,x)
1302  046d b705          	ld	_str+5,a
1303                     ; 416     *(str + 6) = *(ptr1 + 4);
1305  046f 1e02          	ldw	x,(OFST-1,sp)
1306  0471 e604          	ld	a,(4,x)
1307  0473 b706          	ld	_str+6,a
1308                     ; 417     *(str) = *(ptr1 + 5);
1310  0475 1e02          	ldw	x,(OFST-1,sp)
1311  0477 e605          	ld	a,(5,x)
1312  0479 b700          	ld	_str,a
1313                     ; 418     LCD_GLASS_Clear();
1315  047b cd03dc        	call	_LCD_GLASS_Clear
1317                     ; 419     LCD_GLASS_DisplayString((uint8_t*)str);
1319  047e ae0000        	ldw	x,#_str
1320  0481 cd0299        	call	_LCD_GLASS_DisplayString
1322                     ; 420     delay(ScrollSpeed);
1324  0484 1e0a          	ldw	x,(OFST+7,sp)
1325  0486 cd0000        	call	c_uitolx
1327  0489 be02          	ldw	x,c_lreg+2
1328  048b 89            	pushw	x
1329  048c be00          	ldw	x,c_lreg
1330  048e 89            	pushw	x
1331  048f cd0688        	call	L5_delay
1333  0492 5b04          	addw	sp,#4
1334                     ; 422     *(str + 1) = *(ptr1 + 5);
1336  0494 1e02          	ldw	x,(OFST-1,sp)
1337  0496 e605          	ld	a,(5,x)
1338  0498 b701          	ld	_str+1,a
1339                     ; 423     *(str + 2) = *(ptr1 + 6);
1341  049a 1e02          	ldw	x,(OFST-1,sp)
1342  049c e606          	ld	a,(6,x)
1343  049e b702          	ld	_str+2,a
1344                     ; 424     *(str + 3) = *ptr1;
1346  04a0 1e02          	ldw	x,(OFST-1,sp)
1347  04a2 f6            	ld	a,(x)
1348  04a3 b703          	ld	_str+3,a
1349                     ; 425     *(str + 4) = *(ptr1 + 1);
1351  04a5 1e02          	ldw	x,(OFST-1,sp)
1352  04a7 e601          	ld	a,(1,x)
1353  04a9 b704          	ld	_str+4,a
1354                     ; 426     *(str + 5) = *(ptr1 + 2);
1356  04ab 1e02          	ldw	x,(OFST-1,sp)
1357  04ad e602          	ld	a,(2,x)
1358  04af b705          	ld	_str+5,a
1359                     ; 427     *(str + 6) = *(ptr1 + 3);
1361  04b1 1e02          	ldw	x,(OFST-1,sp)
1362  04b3 e603          	ld	a,(3,x)
1363  04b5 b706          	ld	_str+6,a
1364                     ; 428     *(str) = *(ptr1 + 4);
1366  04b7 1e02          	ldw	x,(OFST-1,sp)
1367  04b9 e604          	ld	a,(4,x)
1368  04bb b700          	ld	_str,a
1369                     ; 429     LCD_GLASS_Clear();
1371  04bd cd03dc        	call	_LCD_GLASS_Clear
1373                     ; 430     LCD_GLASS_DisplayString((uint8_t*)str);
1375  04c0 ae0000        	ldw	x,#_str
1376  04c3 cd0299        	call	_LCD_GLASS_DisplayString
1378                     ; 431     delay(ScrollSpeed);
1380  04c6 1e0a          	ldw	x,(OFST+7,sp)
1381  04c8 cd0000        	call	c_uitolx
1383  04cb be02          	ldw	x,c_lreg+2
1384  04cd 89            	pushw	x
1385  04ce be00          	ldw	x,c_lreg
1386  04d0 89            	pushw	x
1387  04d1 cd0688        	call	L5_delay
1389  04d4 5b04          	addw	sp,#4
1390                     ; 433     *(str + 1) = *(ptr1 + 4);
1392  04d6 1e02          	ldw	x,(OFST-1,sp)
1393  04d8 e604          	ld	a,(4,x)
1394  04da b701          	ld	_str+1,a
1395                     ; 434     *(str + 2) = *(ptr1 + 5);
1397  04dc 1e02          	ldw	x,(OFST-1,sp)
1398  04de e605          	ld	a,(5,x)
1399  04e0 b702          	ld	_str+2,a
1400                     ; 435     *(str + 3) = *(ptr1 + 6);
1402  04e2 1e02          	ldw	x,(OFST-1,sp)
1403  04e4 e606          	ld	a,(6,x)
1404  04e6 b703          	ld	_str+3,a
1405                     ; 436     *(str + 4) = *ptr1;
1407  04e8 1e02          	ldw	x,(OFST-1,sp)
1408  04ea f6            	ld	a,(x)
1409  04eb b704          	ld	_str+4,a
1410                     ; 437     *(str + 5) = *(ptr1 + 1);
1412  04ed 1e02          	ldw	x,(OFST-1,sp)
1413  04ef e601          	ld	a,(1,x)
1414  04f1 b705          	ld	_str+5,a
1415                     ; 438     *(str + 6) = *(ptr1 + 2);
1417  04f3 1e02          	ldw	x,(OFST-1,sp)
1418  04f5 e602          	ld	a,(2,x)
1419  04f7 b706          	ld	_str+6,a
1420                     ; 439     *(str) = *(ptr1 + 3);
1422  04f9 1e02          	ldw	x,(OFST-1,sp)
1423  04fb e603          	ld	a,(3,x)
1424  04fd b700          	ld	_str,a
1425                     ; 440     LCD_GLASS_Clear();
1427  04ff cd03dc        	call	_LCD_GLASS_Clear
1429                     ; 441     LCD_GLASS_DisplayString((uint8_t*)str);
1431  0502 ae0000        	ldw	x,#_str
1432  0505 cd0299        	call	_LCD_GLASS_DisplayString
1434                     ; 442     delay(ScrollSpeed);
1436  0508 1e0a          	ldw	x,(OFST+7,sp)
1437  050a cd0000        	call	c_uitolx
1439  050d be02          	ldw	x,c_lreg+2
1440  050f 89            	pushw	x
1441  0510 be00          	ldw	x,c_lreg
1442  0512 89            	pushw	x
1443  0513 cd0688        	call	L5_delay
1445  0516 5b04          	addw	sp,#4
1446                     ; 444     *(str + 1) = *(ptr1 + 3);
1448  0518 1e02          	ldw	x,(OFST-1,sp)
1449  051a e603          	ld	a,(3,x)
1450  051c b701          	ld	_str+1,a
1451                     ; 445     *(str + 2) = *(ptr1 + 4);
1453  051e 1e02          	ldw	x,(OFST-1,sp)
1454  0520 e604          	ld	a,(4,x)
1455  0522 b702          	ld	_str+2,a
1456                     ; 446     *(str + 3) = *(ptr1 + 5);
1458  0524 1e02          	ldw	x,(OFST-1,sp)
1459  0526 e605          	ld	a,(5,x)
1460  0528 b703          	ld	_str+3,a
1461                     ; 447     *(str + 4) = *(ptr1 + 6);
1463  052a 1e02          	ldw	x,(OFST-1,sp)
1464  052c e606          	ld	a,(6,x)
1465  052e b704          	ld	_str+4,a
1466                     ; 448     *(str + 5) = *ptr1;
1468  0530 1e02          	ldw	x,(OFST-1,sp)
1469  0532 f6            	ld	a,(x)
1470  0533 b705          	ld	_str+5,a
1471                     ; 449     *(str + 6) = *(ptr1 + 1);
1473  0535 1e02          	ldw	x,(OFST-1,sp)
1474  0537 e601          	ld	a,(1,x)
1475  0539 b706          	ld	_str+6,a
1476                     ; 450     *(str) = *(ptr1 + 2);
1478  053b 1e02          	ldw	x,(OFST-1,sp)
1479  053d e602          	ld	a,(2,x)
1480  053f b700          	ld	_str,a
1481                     ; 451     LCD_GLASS_Clear();
1483  0541 cd03dc        	call	_LCD_GLASS_Clear
1485                     ; 452     LCD_GLASS_DisplayString((uint8_t*)str);
1487  0544 ae0000        	ldw	x,#_str
1488  0547 cd0299        	call	_LCD_GLASS_DisplayString
1490                     ; 453     delay(ScrollSpeed);
1492  054a 1e0a          	ldw	x,(OFST+7,sp)
1493  054c cd0000        	call	c_uitolx
1495  054f be02          	ldw	x,c_lreg+2
1496  0551 89            	pushw	x
1497  0552 be00          	ldw	x,c_lreg
1498  0554 89            	pushw	x
1499  0555 cd0688        	call	L5_delay
1501  0558 5b04          	addw	sp,#4
1502                     ; 455     *(str + 1) = *(ptr1 + 2);
1504  055a 1e02          	ldw	x,(OFST-1,sp)
1505  055c e602          	ld	a,(2,x)
1506  055e b701          	ld	_str+1,a
1507                     ; 456     *(str + 2) = *(ptr1 + 3);
1509  0560 1e02          	ldw	x,(OFST-1,sp)
1510  0562 e603          	ld	a,(3,x)
1511  0564 b702          	ld	_str+2,a
1512                     ; 457     *(str + 3) = *(ptr1 + 4);
1514  0566 1e02          	ldw	x,(OFST-1,sp)
1515  0568 e604          	ld	a,(4,x)
1516  056a b703          	ld	_str+3,a
1517                     ; 458     *(str + 4) = *(ptr1 + 5);
1519  056c 1e02          	ldw	x,(OFST-1,sp)
1520  056e e605          	ld	a,(5,x)
1521  0570 b704          	ld	_str+4,a
1522                     ; 459     *(str + 5) = *(ptr1 + 6);
1524  0572 1e02          	ldw	x,(OFST-1,sp)
1525  0574 e606          	ld	a,(6,x)
1526  0576 b705          	ld	_str+5,a
1527                     ; 460     *(str + 6) = *ptr1;
1529  0578 1e02          	ldw	x,(OFST-1,sp)
1530  057a f6            	ld	a,(x)
1531  057b b706          	ld	_str+6,a
1532                     ; 461     *(str) = *(ptr1 + 1);
1534  057d 1e02          	ldw	x,(OFST-1,sp)
1535  057f e601          	ld	a,(1,x)
1536  0581 b700          	ld	_str,a
1537                     ; 462     LCD_GLASS_Clear();
1539  0583 cd03dc        	call	_LCD_GLASS_Clear
1541                     ; 463     LCD_GLASS_DisplayString((uint8_t*)str);
1543  0586 ae0000        	ldw	x,#_str
1544  0589 cd0299        	call	_LCD_GLASS_DisplayString
1546                     ; 464     delay(ScrollSpeed);
1548  058c 1e0a          	ldw	x,(OFST+7,sp)
1549  058e cd0000        	call	c_uitolx
1551  0591 be02          	ldw	x,c_lreg+2
1552  0593 89            	pushw	x
1553  0594 be00          	ldw	x,c_lreg
1554  0596 89            	pushw	x
1555  0597 cd0688        	call	L5_delay
1557  059a 5b04          	addw	sp,#4
1558                     ; 466     *(str + 1) = *(ptr1 + 1);
1560  059c 1e02          	ldw	x,(OFST-1,sp)
1561  059e e601          	ld	a,(1,x)
1562  05a0 b701          	ld	_str+1,a
1563                     ; 467     *(str + 2) = *(ptr1 + 2);
1565  05a2 1e02          	ldw	x,(OFST-1,sp)
1566  05a4 e602          	ld	a,(2,x)
1567  05a6 b702          	ld	_str+2,a
1568                     ; 468     *(str + 3) = *(ptr1 + 3);
1570  05a8 1e02          	ldw	x,(OFST-1,sp)
1571  05aa e603          	ld	a,(3,x)
1572  05ac b703          	ld	_str+3,a
1573                     ; 469     *(str + 4) = *(ptr1 + 4);
1575  05ae 1e02          	ldw	x,(OFST-1,sp)
1576  05b0 e604          	ld	a,(4,x)
1577  05b2 b704          	ld	_str+4,a
1578                     ; 470     *(str + 5) = *(ptr1 + 5);
1580  05b4 1e02          	ldw	x,(OFST-1,sp)
1581  05b6 e605          	ld	a,(5,x)
1582  05b8 b705          	ld	_str+5,a
1583                     ; 471     *(str + 6) = *(ptr1 + 6);
1585  05ba 1e02          	ldw	x,(OFST-1,sp)
1586  05bc e606          	ld	a,(6,x)
1587  05be b706          	ld	_str+6,a
1588                     ; 472     *(str) = *ptr1;
1590  05c0 1e02          	ldw	x,(OFST-1,sp)
1591  05c2 f6            	ld	a,(x)
1592  05c3 b700          	ld	_str,a
1593                     ; 473     LCD_GLASS_Clear();
1595  05c5 cd03dc        	call	_LCD_GLASS_Clear
1597                     ; 474     LCD_GLASS_DisplayString((uint8_t*)str);
1599  05c8 ae0000        	ldw	x,#_str
1600  05cb cd0299        	call	_LCD_GLASS_DisplayString
1602                     ; 475     delay(ScrollSpeed);
1604  05ce 1e0a          	ldw	x,(OFST+7,sp)
1605  05d0 cd0000        	call	c_uitolx
1607  05d3 be02          	ldw	x,c_lreg+2
1608  05d5 89            	pushw	x
1609  05d6 be00          	ldw	x,c_lreg
1610  05d8 89            	pushw	x
1611  05d9 cd0688        	call	L5_delay
1613  05dc 5b04          	addw	sp,#4
1614                     ; 398   for (Repetition = 0; Repetition < nScroll; Repetition++)
1616  05de 0c01          	inc	(OFST-2,sp)
1618  05e0               L703:
1621  05e0 7b01          	ld	a,(OFST-2,sp)
1622  05e2 5f            	clrw	x
1623  05e3 97            	ld	xl,a
1624  05e4 1308          	cpw	x,(OFST+5,sp)
1625  05e6 2403          	jruge	L24
1626  05e8 cc0411        	jp	L303
1627  05eb               L24:
1628                     ; 477 }
1631  05eb 5b05          	addw	sp,#5
1632  05ed 81            	ret
1719                     ; 489 static void Convert(uint8_t* c, Point_Typedef point, Apostrophe_Typedef apostrophe)
1719                     ; 490 {
1720                     	switch	.text
1721  05ee               L3_Convert:
1723  05ee 89            	pushw	x
1724  05ef 5205          	subw	sp,#5
1725       00000005      OFST:	set	5
1728                     ; 491   uint16_t ch = 0 , tmp = 0;
1730  05f1 5f            	clrw	x
1731  05f2 1f03          	ldw	(OFST-2,sp),x
1735                     ; 495   if ((*c < 0x5B)&(*c > 0x40))
1737  05f4 1e06          	ldw	x,(OFST+1,sp)
1738  05f6 f6            	ld	a,(x)
1739  05f7 a15b          	cp	a,#91
1740  05f9 2415          	jruge	L553
1742  05fb 1e06          	ldw	x,(OFST+1,sp)
1743  05fd f6            	ld	a,(x)
1744  05fe a141          	cp	a,#65
1745  0600 250e          	jrult	L553
1746                     ; 497     ch = LetterMap[*c-0x41];
1748  0602 1e06          	ldw	x,(OFST+1,sp)
1749  0604 f6            	ld	a,(x)
1750  0605 5f            	clrw	x
1751  0606 97            	ld	xl,a
1752  0607 58            	sllw	x
1753  0608 1d0082        	subw	x,#130
1754  060b de000c        	ldw	x,(_LetterMap,x)
1755  060e 1f03          	ldw	(OFST-2,sp),x
1757  0610               L553:
1758                     ; 500   if ((*c < 0x3A)&(*c > 0x2F))
1760  0610 1e06          	ldw	x,(OFST+1,sp)
1761  0612 f6            	ld	a,(x)
1762  0613 a13a          	cp	a,#58
1763  0615 2415          	jruge	L753
1765  0617 1e06          	ldw	x,(OFST+1,sp)
1766  0619 f6            	ld	a,(x)
1767  061a a130          	cp	a,#48
1768  061c 250e          	jrult	L753
1769                     ; 502     ch = NumberMap[*c-0x30];
1771  061e 1e06          	ldw	x,(OFST+1,sp)
1772  0620 f6            	ld	a,(x)
1773  0621 5f            	clrw	x
1774  0622 97            	ld	xl,a
1775  0623 58            	sllw	x
1776  0624 1d0060        	subw	x,#96
1777  0627 de0040        	ldw	x,(_NumberMap,x)
1778  062a 1f03          	ldw	(OFST-2,sp),x
1780  062c               L753:
1781                     ; 505   if (*c == 0x20)
1783  062c 1e06          	ldw	x,(OFST+1,sp)
1784  062e f6            	ld	a,(x)
1785  062f a120          	cp	a,#32
1786  0631 2603          	jrne	L163
1787                     ; 507     ch = 0x00;
1789  0633 5f            	clrw	x
1790  0634 1f03          	ldw	(OFST-2,sp),x
1792  0636               L163:
1793                     ; 510   if (point == POINT_ON)
1795  0636 7b0a          	ld	a,(OFST+5,sp)
1796  0638 a101          	cp	a,#1
1797  063a 2606          	jrne	L363
1798                     ; 512     ch |= 0x0004;
1800  063c 7b04          	ld	a,(OFST-1,sp)
1801  063e aa04          	or	a,#4
1802  0640 6b04          	ld	(OFST-1,sp),a
1804  0642               L363:
1805                     ; 516   if (apostrophe == APOSTROPHE_ON)
1807  0642 7b0b          	ld	a,(OFST+6,sp)
1808  0644 a101          	cp	a,#1
1809  0646 2606          	jrne	L563
1810                     ; 518     ch |= 0x1000;
1812  0648 7b03          	ld	a,(OFST-2,sp)
1813  064a aa10          	or	a,#16
1814  064c 6b03          	ld	(OFST-2,sp),a
1816  064e               L563:
1817                     ; 521   for (i = 0;i < 4; i++)
1819  064e 0f05          	clr	(OFST+0,sp)
1821  0650               L763:
1822                     ; 523     tmp = ch & mask[i];
1824  0650 7b05          	ld	a,(OFST+0,sp)
1825  0652 5f            	clrw	x
1826  0653 97            	ld	xl,a
1827  0654 58            	sllw	x
1828  0655 de0000        	ldw	x,(_mask,x)
1829  0658 01            	rrwa	x,a
1830  0659 1404          	and	a,(OFST-1,sp)
1831  065b 01            	rrwa	x,a
1832  065c 1403          	and	a,(OFST-2,sp)
1833  065e 01            	rrwa	x,a
1834  065f 1f01          	ldw	(OFST-4,sp),x
1836                     ; 524     digit[i] = (uint8_t)(tmp >> (uint8_t)shift[i]);
1838  0661 7b05          	ld	a,(OFST+0,sp)
1839  0663 5f            	clrw	x
1840  0664 97            	ld	xl,a
1841  0665 7b05          	ld	a,(OFST+0,sp)
1842  0667 905f          	clrw	y
1843  0669 9097          	ld	yl,a
1844  066b 90d60008      	ld	a,(_shift,y)
1845  066f 1601          	ldw	y,(OFST-4,sp)
1846  0671 4d            	tnz	a
1847  0672 2705          	jreq	L64
1848  0674               L05:
1849  0674 9054          	srlw	y
1850  0676 4a            	dec	a
1851  0677 26fb          	jrne	L05
1852  0679               L64:
1853  0679 909f          	ld	a,yl
1854  067b e700          	ld	(_digit,x),a
1855                     ; 521   for (i = 0;i < 4; i++)
1857  067d 0c05          	inc	(OFST+0,sp)
1861  067f 7b05          	ld	a,(OFST+0,sp)
1862  0681 a104          	cp	a,#4
1863  0683 25cb          	jrult	L763
1864                     ; 526 }
1867  0685 5b07          	addw	sp,#7
1868  0687 81            	ret
1911                     ; 532 static void delay(__IO uint32_t nCount)
1911                     ; 533 {
1912                     	switch	.text
1913  0688               L5_delay:
1915  0688 5204          	subw	sp,#4
1916       00000004      OFST:	set	4
1919                     ; 534   __IO uint32_t index = 0;
1921  068a ae0000        	ldw	x,#0
1922  068d 1f03          	ldw	(OFST-1,sp),x
1923  068f ae0000        	ldw	x,#0
1924  0692 1f01          	ldw	(OFST-3,sp),x
1926                     ; 535   for (index = (0x60 * nCount); index != 0; index--)
1928  0694 96            	ldw	x,sp
1929  0695 1c0007        	addw	x,#OFST+3
1930  0698 cd0000        	call	c_ltor
1932  069b a660          	ld	a,#96
1933  069d cd0000        	call	c_smul
1935  06a0 96            	ldw	x,sp
1936  06a1 1c0001        	addw	x,#OFST-3
1937  06a4 cd0000        	call	c_rtol
1941  06a7 2009          	jra	L324
1942  06a9               L714:
1945  06a9 96            	ldw	x,sp
1946  06aa 1c0001        	addw	x,#OFST-3
1947  06ad a601          	ld	a,#1
1948  06af cd0000        	call	c_lgsbc
1951  06b2               L324:
1954  06b2 96            	ldw	x,sp
1955  06b3 1c0001        	addw	x,#OFST-3
1956  06b6 cd0000        	call	c_lzmp
1958  06b9 26ee          	jrne	L714
1959                     ; 537 }
1962  06bb 5b04          	addw	sp,#4
1963  06bd 81            	ret
2038                     	xdef	_str
2039                     	xdef	_NumberMap
2040                     	xdef	_LetterMap
2041                     	switch	.ubsct
2042  0000               _digit:
2043  0000 00000000      	ds.b	4
2044                     	xdef	_digit
2045                     	xdef	_shift
2046                     	xdef	_mask
2047                     	xdef	_LCD_GLASS_ScrollString
2048                     	xdef	_LCD_GLASS_Clear
2049                     	xdef	_LCD_GLASS_ClearChar
2050                     	xdef	_LCD_GLASS_DisplayString
2051                     	xdef	_LCD_GLASS_WriteChar
2052                     	xdef	_LCD_GLASS_Init
2053                     	xref	_LCD_ContrastConfig
2054                     	xref	_LCD_DeadTimeConfig
2055                     	xref	_LCD_PulseOnDurationConfig
2056                     	xref	_LCD_Cmd
2057                     	xref	_LCD_PortMaskConfig
2058                     	xref	_LCD_Init
2059                     	xref	_CLK_PeripheralClockConfig
2060                     	xref	_CLK_RTCClockConfig
2061                     	xref.b	c_lreg
2081                     	xref	c_lzmp
2082                     	xref	c_lgsbc
2083                     	xref	c_rtol
2084                     	xref	c_smul
2085                     	xref	c_ltor
2086                     	xref	c_uitolx
2087                     	end
