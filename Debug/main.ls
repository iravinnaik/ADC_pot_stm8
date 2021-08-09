   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  64                     ; 11 void main()
  64                     ; 12 {
  66                     	switch	.text
  67  0000               _main:
  69  0000 89            	pushw	x
  70       00000002      OFST:	set	2
  73                     ; 13 	unsigned int A0 = 0x0000;
  75                     ; 15 	clock_setup();
  77  0001 ad3c          	call	_clock_setup
  79                     ; 16 	GPIO_setup();
  81  0003 cd00a1        	call	_GPIO_setup
  83                     ; 18 	ADC_Config();
  85  0006 cd00d6        	call	L3_ADC_Config
  87                     ; 20 	LCD_init();  
  89  0009 cd0000        	call	_LCD_init
  91                     ; 21 	LCD_clear_home(); 
  93  000c cd0000        	call	_LCD_clear_home
  95                     ; 23 	LCD_goto(0, 0);
  97  000f 5f            	clrw	x
  98  0010 cd0000        	call	_LCD_goto
 100                     ; 24 	LCD_putstr("STM8 ADC");
 102  0013 ae0003        	ldw	x,#L13
 103  0016 cd0000        	call	_LCD_putstr
 105                     ; 25 	LCD_goto(0, 1);
 107  0019 ae0001        	ldw	x,#1
 108  001c cd0000        	call	_LCD_goto
 110                     ; 26 	LCD_putstr("A0");
 112  001f ae0000        	ldw	x,#L33
 113  0022 cd0000        	call	_LCD_putstr
 115  0025               L53:
 116                     ; 30 		ADC2_StartConversion();
 118  0025 cd0000        	call	_ADC2_StartConversion
 120                     ; 33 		A0 = ADC2_GetConversionValue();
 122  0028 cd0000        	call	_ADC2_GetConversionValue
 124  002b 1f01          	ldw	(OFST-1,sp),x
 126                     ; 36 		lcd_print(4, 1, A0);
 128  002d 1e01          	ldw	x,(OFST-1,sp)
 129  002f 89            	pushw	x
 130  0030 ae0401        	ldw	x,#1025
 131  0033 cd00fc        	call	_lcd_print
 133  0036 85            	popw	x
 134                     ; 37 		delay_ms(90);
 136  0037 ae005a        	ldw	x,#90
 137  003a cd0000        	call	_delay_ms
 140  003d 20e6          	jra	L53
 173                     ; 42 void clock_setup(void)
 173                     ; 43 {
 174                     	switch	.text
 175  003f               _clock_setup:
 179                     ; 44 	CLK_DeInit();
 181  003f cd0000        	call	_CLK_DeInit
 183                     ; 46 	CLK_HSECmd(DISABLE);
 185  0042 4f            	clr	a
 186  0043 cd0000        	call	_CLK_HSECmd
 188                     ; 47 	CLK_LSICmd(DISABLE);
 190  0046 4f            	clr	a
 191  0047 cd0000        	call	_CLK_LSICmd
 193                     ; 48 	CLK_HSICmd(ENABLE);
 195  004a a601          	ld	a,#1
 196  004c cd0000        	call	_CLK_HSICmd
 199  004f               L35:
 200                     ; 49 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 202  004f ae0102        	ldw	x,#258
 203  0052 cd0000        	call	_CLK_GetFlagStatus
 205  0055 4d            	tnz	a
 206  0056 27f7          	jreq	L35
 207                     ; 51 	CLK_ClockSwitchCmd(ENABLE);
 209  0058 a601          	ld	a,#1
 210  005a cd0000        	call	_CLK_ClockSwitchCmd
 212                     ; 52 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
 214  005d a608          	ld	a,#8
 215  005f cd0000        	call	_CLK_HSIPrescalerConfig
 217                     ; 53 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV4);
 219  0062 a682          	ld	a,#130
 220  0064 cd0000        	call	_CLK_SYSCLKConfig
 222                     ; 55 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 222                     ; 56 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 224  0067 4b01          	push	#1
 225  0069 4b00          	push	#0
 226  006b ae01e1        	ldw	x,#481
 227  006e cd0000        	call	_CLK_ClockSwitchConfig
 229  0071 85            	popw	x
 230                     ; 58 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 232  0072 ae0100        	ldw	x,#256
 233  0075 cd0000        	call	_CLK_PeripheralClockConfig
 235                     ; 59 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 237  0078 5f            	clrw	x
 238  0079 cd0000        	call	_CLK_PeripheralClockConfig
 240                     ; 60 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
 242  007c ae1301        	ldw	x,#4865
 243  007f cd0000        	call	_CLK_PeripheralClockConfig
 245                     ; 61 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 247  0082 ae1200        	ldw	x,#4608
 248  0085 cd0000        	call	_CLK_PeripheralClockConfig
 250                     ; 62 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 252  0088 ae0300        	ldw	x,#768
 253  008b cd0000        	call	_CLK_PeripheralClockConfig
 255                     ; 63 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 257  008e ae0700        	ldw	x,#1792
 258  0091 cd0000        	call	_CLK_PeripheralClockConfig
 260                     ; 64 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 262  0094 ae0500        	ldw	x,#1280
 263  0097 cd0000        	call	_CLK_PeripheralClockConfig
 265                     ; 65 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 267  009a ae0400        	ldw	x,#1024
 268  009d cd0000        	call	_CLK_PeripheralClockConfig
 270                     ; 66 }
 273  00a0 81            	ret
 298                     ; 69 void GPIO_setup(void)
 298                     ; 70 {
 299                     	switch	.text
 300  00a1               _GPIO_setup:
 304                     ; 74 	GPIO_DeInit(GPIOC);
 306  00a1 ae500a        	ldw	x,#20490
 307  00a4 cd0000        	call	_GPIO_DeInit
 309                     ; 76 	GPIO_DeInit(GPIOD);
 311  00a7 ae500f        	ldw	x,#20495
 312  00aa cd0000        	call	_GPIO_DeInit
 314                     ; 77 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_NO_IT);
 316  00ad 4b40          	push	#64
 317  00af 4b08          	push	#8
 318  00b1 ae500f        	ldw	x,#20495
 319  00b4 cd0000        	call	_GPIO_Init
 321  00b7 85            	popw	x
 322                     ; 78 }
 325  00b8 81            	ret
 351                     ; 81 void ADC2_setup(void)
 351                     ; 82 {
 352                     	switch	.text
 353  00b9               _ADC2_setup:
 357                     ; 83 	ADC2_DeInit();	
 359  00b9 cd0000        	call	_ADC2_DeInit
 361                     ; 85 	ADC2_Init(ADC2_CONVERSIONMODE_CONTINUOUS, 
 361                     ; 86 					  ADC2_CHANNEL_8,
 361                     ; 87 					  ADC2_PRESSEL_FCPU_D18, 
 361                     ; 88 					  ADC2_EXTTRIG_GPIO, 
 361                     ; 89 					  DISABLE, 
 361                     ; 90 					  ADC2_ALIGN_RIGHT, 
 361                     ; 91 					  ADC2_SCHMITTTRIG_CHANNEL8, 
 361                     ; 92 					  DISABLE);
 363  00bc 4b00          	push	#0
 364  00be 4b08          	push	#8
 365  00c0 4b08          	push	#8
 366  00c2 4b00          	push	#0
 367  00c4 4b01          	push	#1
 368  00c6 4b70          	push	#112
 369  00c8 ae0108        	ldw	x,#264
 370  00cb cd0000        	call	_ADC2_Init
 372  00ce 5b06          	addw	sp,#6
 373                     ; 94 	ADC2_Cmd(ENABLE);
 375  00d0 a601          	ld	a,#1
 376  00d2 cd0000        	call	_ADC2_Cmd
 378                     ; 95 }
 381  00d5 81            	ret
 408                     ; 97 static void ADC_Config(void)
 408                     ; 98 {
 409                     	switch	.text
 410  00d6               L3_ADC_Config:
 414                     ; 100   GPIO_Init(GPIOE, GPIO_PIN_7, GPIO_MODE_IN_FL_NO_IT);
 416  00d6 4b00          	push	#0
 417  00d8 4b80          	push	#128
 418  00da ae5014        	ldw	x,#20500
 419  00dd cd0000        	call	_GPIO_Init
 421  00e0 85            	popw	x
 422                     ; 103   ADC2_DeInit();
 424  00e1 cd0000        	call	_ADC2_DeInit
 426                     ; 106   ADC2_Init(ADC2_CONVERSIONMODE_CONTINUOUS, ADC2_CHANNEL_8, ADC2_PRESSEL_FCPU_D2,
 426                     ; 107             ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL8,
 426                     ; 108             DISABLE);
 428  00e4 4b00          	push	#0
 429  00e6 4b08          	push	#8
 430  00e8 4b08          	push	#8
 431  00ea 4b00          	push	#0
 432  00ec 4b00          	push	#0
 433  00ee 4b00          	push	#0
 434  00f0 ae0108        	ldw	x,#264
 435  00f3 cd0000        	call	_ADC2_Init
 437  00f6 5b06          	addw	sp,#6
 438                     ; 117   ADC2_StartConversion();
 440  00f8 cd0000        	call	_ADC2_StartConversion
 442                     ; 118 }
 445  00fb 81            	ret
 508                     ; 121 void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
 508                     ; 122 {
 509                     	switch	.text
 510  00fc               _lcd_print:
 512  00fc 89            	pushw	x
 513  00fd 88            	push	a
 514       00000001      OFST:	set	1
 517                     ; 123 	char chr = 0x00;
 519                     ; 125 	chr = ((value / 1000) + 0x30);	
 521  00fe 1e06          	ldw	x,(OFST+5,sp)
 522  0100 90ae03e8      	ldw	y,#1000
 523  0104 65            	divw	x,y
 524  0105 1c0030        	addw	x,#48
 525  0108 01            	rrwa	x,a
 526  0109 6b01          	ld	(OFST+0,sp),a
 527  010b 02            	rlwa	x,a
 529                     ; 126 	LCD_goto(x_pos, y_pos);
 531  010c 7b03          	ld	a,(OFST+2,sp)
 532  010e 97            	ld	xl,a
 533  010f 7b02          	ld	a,(OFST+1,sp)
 534  0111 95            	ld	xh,a
 535  0112 cd0000        	call	_LCD_goto
 537                     ; 127 	LCD_putchar(chr); 
 539  0115 7b01          	ld	a,(OFST+0,sp)
 540  0117 cd0000        	call	_LCD_putchar
 542                     ; 129 	chr = (((value / 100) % 10) + 0x30);
 544  011a 1e06          	ldw	x,(OFST+5,sp)
 545  011c a664          	ld	a,#100
 546  011e 62            	div	x,a
 547  011f a60a          	ld	a,#10
 548  0121 62            	div	x,a
 549  0122 5f            	clrw	x
 550  0123 97            	ld	xl,a
 551  0124 1c0030        	addw	x,#48
 552  0127 01            	rrwa	x,a
 553  0128 6b01          	ld	(OFST+0,sp),a
 554  012a 02            	rlwa	x,a
 556                     ; 130 	LCD_goto((x_pos + 1), y_pos);
 558  012b 7b03          	ld	a,(OFST+2,sp)
 559  012d 97            	ld	xl,a
 560  012e 7b02          	ld	a,(OFST+1,sp)
 561  0130 4c            	inc	a
 562  0131 95            	ld	xh,a
 563  0132 cd0000        	call	_LCD_goto
 565                     ; 131 	LCD_putchar(chr); 
 567  0135 7b01          	ld	a,(OFST+0,sp)
 568  0137 cd0000        	call	_LCD_putchar
 570                     ; 133 	chr = (((value / 10) % 10) + 0x30);
 572  013a 1e06          	ldw	x,(OFST+5,sp)
 573  013c a60a          	ld	a,#10
 574  013e 62            	div	x,a
 575  013f a60a          	ld	a,#10
 576  0141 62            	div	x,a
 577  0142 5f            	clrw	x
 578  0143 97            	ld	xl,a
 579  0144 1c0030        	addw	x,#48
 580  0147 01            	rrwa	x,a
 581  0148 6b01          	ld	(OFST+0,sp),a
 582  014a 02            	rlwa	x,a
 584                     ; 134 	LCD_goto((x_pos + 2), y_pos);
 586  014b 7b03          	ld	a,(OFST+2,sp)
 587  014d 97            	ld	xl,a
 588  014e 7b02          	ld	a,(OFST+1,sp)
 589  0150 ab02          	add	a,#2
 590  0152 95            	ld	xh,a
 591  0153 cd0000        	call	_LCD_goto
 593                     ; 135 	LCD_putchar(chr); 
 595  0156 7b01          	ld	a,(OFST+0,sp)
 596  0158 cd0000        	call	_LCD_putchar
 598                     ; 137 	chr = ((value % 10) + 0x30);
 600  015b 1e06          	ldw	x,(OFST+5,sp)
 601  015d a60a          	ld	a,#10
 602  015f 62            	div	x,a
 603  0160 5f            	clrw	x
 604  0161 97            	ld	xl,a
 605  0162 1c0030        	addw	x,#48
 606  0165 01            	rrwa	x,a
 607  0166 6b01          	ld	(OFST+0,sp),a
 608  0168 02            	rlwa	x,a
 610                     ; 138 	LCD_goto((x_pos + 3), y_pos);
 612  0169 7b03          	ld	a,(OFST+2,sp)
 613  016b 97            	ld	xl,a
 614  016c 7b02          	ld	a,(OFST+1,sp)
 615  016e ab03          	add	a,#3
 616  0170 95            	ld	xh,a
 617  0171 cd0000        	call	_LCD_goto
 619                     ; 139 	LCD_putchar(chr); 
 621  0174 7b01          	ld	a,(OFST+0,sp)
 622  0176 cd0000        	call	_LCD_putchar
 624                     ; 140 }
 627  0179 5b03          	addw	sp,#3
 628  017b 81            	ret
 641                     	xdef	_ADC2_setup
 642                     	xdef	_main
 643                     	xdef	_lcd_print
 644                     	xdef	_GPIO_setup
 645                     	xdef	_clock_setup
 646                     	xref	_ADC2_GetConversionValue
 647                     	xref	_ADC2_StartConversion
 648                     	xref	_ADC2_Cmd
 649                     	xref	_ADC2_Init
 650                     	xref	_ADC2_DeInit
 651                     	xref	_LCD_goto
 652                     	xref	_LCD_clear_home
 653                     	xref	_LCD_putchar
 654                     	xref	_LCD_putstr
 655                     	xref	_LCD_init
 656                     	xref	_GPIO_Init
 657                     	xref	_GPIO_DeInit
 658                     	xref	_CLK_GetFlagStatus
 659                     	xref	_CLK_SYSCLKConfig
 660                     	xref	_CLK_HSIPrescalerConfig
 661                     	xref	_CLK_ClockSwitchConfig
 662                     	xref	_CLK_PeripheralClockConfig
 663                     	xref	_CLK_ClockSwitchCmd
 664                     	xref	_CLK_LSICmd
 665                     	xref	_CLK_HSICmd
 666                     	xref	_CLK_HSECmd
 667                     	xref	_CLK_DeInit
 668                     	xref	_delay_ms
 669                     .const:	section	.text
 670  0000               L33:
 671  0000 413000        	dc.b	"A0",0
 672  0003               L13:
 673  0003 53544d382041  	dc.b	"STM8 ADC",0
 693                     	end
