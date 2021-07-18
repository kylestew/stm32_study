EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:USB_B_Micro J1
U 1 1 60D5FC5B
P 1550 1650
F 0 "J1" H 1550 2100 50  0000 C CNN
F 1 "USB_B_Micro" H 1550 2000 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Wuerth_629105150521" H 1700 1600 50  0001 C CNN
F 3 "~" H 1700 1600 50  0001 C CNN
	1    1550 1650
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:XC6206PxxxMR U1
U 1 1 60D60935
P 3150 1450
F 0 "U1" H 3150 1692 50  0000 C CNN
F 1 "XC6206P332MR" H 3150 1601 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3150 1675 50  0001 C CIN
F 3 "https://www.torexsemi.com/file/xc6206/XC6206.pdf" H 3150 1450 50  0001 C CNN
	1    3150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 60D63956
P 1550 2050
F 0 "#PWR0101" H 1550 1800 50  0001 C CNN
F 1 "GND" H 1550 1900 50  0000 C CNN
F 2 "" H 1550 2050 50  0001 C CNN
F 3 "" H 1550 2050 50  0001 C CNN
	1    1550 2050
	1    0    0    -1  
$EndComp
NoConn ~ 1450 2050
$Comp
L power:+5V #PWR0102
U 1 1 60D642B5
P 1950 1350
F 0 "#PWR0102" H 1950 1200 50  0001 C CNN
F 1 "+5V" H 1950 1500 50  0000 C CNN
F 2 "" H 1950 1350 50  0001 C CNN
F 3 "" H 1950 1350 50  0001 C CNN
	1    1950 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1450 1950 1450
Wire Wire Line
	1950 1450 1950 1350
NoConn ~ 1850 1850
Text GLabel 1850 1650 2    50   Input ~ 0
USB_D+
Text GLabel 1850 1750 2    50   Input ~ 0
USB_D-
$Comp
L Device:Ferrite_Bead_Small FB1
U 1 1 60D67315
P 2350 1450
F 0 "FB1" V 2113 1450 50  0000 C CNN
F 1 "100R" V 2204 1450 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" V 2280 1450 50  0001 C CNN
F 3 "~" H 2350 1450 50  0001 C CNN
	1    2350 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	1950 1450 2250 1450
Connection ~ 1950 1450
$Comp
L Device:C_Small C1
U 1 1 60D68E35
P 2600 1700
F 0 "C1" H 2692 1746 50  0000 L CNN
F 1 "1u" H 2692 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2600 1700 50  0001 C CNN
F 3 "~" H 2600 1700 50  0001 C CNN
	1    2600 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 60D694AF
P 2600 2050
F 0 "#PWR0103" H 2600 1800 50  0001 C CNN
F 1 "GND" H 2600 1900 50  0000 C CNN
F 2 "" H 2600 2050 50  0001 C CNN
F 3 "" H 2600 2050 50  0001 C CNN
	1    2600 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1800 2600 2050
Wire Wire Line
	2450 1450 2600 1450
Wire Wire Line
	2600 1450 2600 1600
$Comp
L power:VCC #PWR0104
U 1 1 60D6AA98
P 2700 1350
F 0 "#PWR0104" H 2700 1200 50  0001 C CNN
F 1 "VCC" H 2700 1500 50  0000 C CNN
F 2 "" H 2700 1350 50  0001 C CNN
F 3 "" H 2700 1350 50  0001 C CNN
	1    2700 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1450 2700 1450
Connection ~ 2600 1450
Wire Wire Line
	2700 1350 2700 1450
Connection ~ 2700 1450
Wire Wire Line
	2700 1450 2850 1450
$Comp
L power:GND #PWR0105
U 1 1 60D6C69C
P 3150 2050
F 0 "#PWR0105" H 3150 1800 50  0001 C CNN
F 1 "GND" H 3150 1900 50  0000 C CNN
F 2 "" H 3150 2050 50  0001 C CNN
F 3 "" H 3150 2050 50  0001 C CNN
	1    3150 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1750 3150 2050
$Comp
L power:+3.3V #PWR0106
U 1 1 60D6D338
P 3700 1350
F 0 "#PWR0106" H 3700 1200 50  0001 C CNN
F 1 "+3.3V" H 3700 1500 50  0000 C CNN
F 2 "" H 3700 1350 50  0001 C CNN
F 3 "" H 3700 1350 50  0001 C CNN
	1    3700 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1450 3700 1450
Wire Wire Line
	3700 1450 3700 1350
$Comp
L Device:C_Small C2
U 1 1 60D6DEA0
P 3700 1700
F 0 "C2" H 3792 1746 50  0000 L CNN
F 1 "1u" H 3792 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3700 1700 50  0001 C CNN
F 3 "~" H 3700 1700 50  0001 C CNN
	1    3700 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1450 3700 1500
Connection ~ 3700 1450
$Comp
L power:GND #PWR0107
U 1 1 60D6E516
P 3700 2050
F 0 "#PWR0107" H 3700 1800 50  0001 C CNN
F 1 "GND" H 3700 1900 50  0000 C CNN
F 2 "" H 3700 2050 50  0001 C CNN
F 3 "" H 3700 2050 50  0001 C CNN
	1    3700 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 60D6E8A7
P 4350 2050
F 0 "#PWR0108" H 4350 1800 50  0001 C CNN
F 1 "GND" H 4350 1900 50  0000 C CNN
F 2 "" H 4350 2050 50  0001 C CNN
F 3 "" H 4350 2050 50  0001 C CNN
	1    4350 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1800 3700 2050
$Comp
L Device:LED_Small D1
U 1 1 60D6F934
P 4100 1500
F 0 "D1" H 4100 1293 50  0000 C CNN
F 1 "GREEN" H 4100 1384 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 4100 1500 50  0001 C CNN
F 3 "~" V 4100 1500 50  0001 C CNN
	1    4100 1500
	-1   0    0    1   
$EndComp
Connection ~ 3700 1500
Wire Wire Line
	3700 1500 3700 1600
Wire Wire Line
	3700 1500 4000 1500
$Comp
L Device:R_Small R1
U 1 1 60D712C9
P 4350 1700
F 0 "R1" H 4409 1746 50  0000 L CNN
F 1 "1k5" H 4409 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4350 1700 50  0001 C CNN
F 3 "~" H 4350 1700 50  0001 C CNN
	1    4350 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 1500 4350 1500
Wire Wire Line
	4350 1500 4350 1600
Wire Wire Line
	4350 1800 4350 2050
Wire Notes Line
	1250 1100 4600 1100
Wire Notes Line
	4600 1100 4600 2300
Wire Notes Line
	4600 2300 1250 2300
Wire Notes Line
	1250 2300 1250 1100
Text Notes 1250 1050 0    63   ~ 13
USB and Regulator
$Comp
L MCU_ST_STM32F1:STM32F103C8Tx U2
U 1 1 60D73076
P 8350 4100
F 0 "U2" H 8800 5550 50  0000 C CNN
F 1 "STM32F103C8T6" H 8850 2650 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 7750 2700 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00161566.pdf" H 8350 4100 50  0001 C CNN
	1    8350 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 60D78102
P 8150 5700
F 0 "#PWR0109" H 8150 5450 50  0001 C CNN
F 1 "GND" H 8150 5550 50  0000 C CNN
F 2 "" H 8150 5700 50  0001 C CNN
F 3 "" H 8150 5700 50  0001 C CNN
	1    8150 5700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0110
U 1 1 60D7890C
P 8150 2500
F 0 "#PWR0110" H 8150 2350 50  0001 C CNN
F 1 "+3.3V" H 8150 2650 50  0000 C CNN
F 2 "" H 8150 2500 50  0001 C CNN
F 3 "" H 8150 2500 50  0001 C CNN
	1    8150 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2500 8150 2550
Wire Wire Line
	8450 2600 8450 2550
Wire Wire Line
	8450 2550 8350 2550
Connection ~ 8150 2550
Wire Wire Line
	8150 2550 8150 2600
Wire Wire Line
	8250 2600 8250 2550
Connection ~ 8250 2550
Wire Wire Line
	8250 2550 8150 2550
Wire Wire Line
	8350 2600 8350 2550
Connection ~ 8350 2550
Wire Wire Line
	8350 2550 8250 2550
$Comp
L power:+3.3V #PWR0111
U 1 1 60D7A24B
P 6750 1350
F 0 "#PWR0111" H 6750 1200 50  0001 C CNN
F 1 "+3.3V" H 6750 1500 50  0000 C CNN
F 2 "" H 6750 1350 50  0001 C CNN
F 3 "" H 6750 1350 50  0001 C CNN
	1    6750 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 60D7AE48
P 6750 1750
F 0 "#PWR0112" H 6750 1500 50  0001 C CNN
F 1 "GND" H 6755 1577 50  0000 C CNN
F 2 "" H 6750 1750 50  0001 C CNN
F 3 "" H 6750 1750 50  0001 C CNN
	1    6750 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 60D7B710
P 6750 1550
F 0 "C3" H 6842 1596 50  0000 L CNN
F 1 "4u7" H 6842 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6750 1550 50  0001 C CNN
F 3 "~" H 6750 1550 50  0001 C CNN
	1    6750 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 60D7BA18
P 7150 1550
F 0 "C4" H 7242 1596 50  0000 L CNN
F 1 "100n" H 7242 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7150 1550 50  0001 C CNN
F 3 "~" H 7150 1550 50  0001 C CNN
	1    7150 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1350 6750 1400
Wire Wire Line
	6750 1750 6750 1700
$Comp
L Device:C_Small C5
U 1 1 60D7F3A5
P 7550 1550
F 0 "C5" H 7642 1596 50  0000 L CNN
F 1 "100n" H 7642 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7550 1550 50  0001 C CNN
F 3 "~" H 7550 1550 50  0001 C CNN
	1    7550 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 60D7F9CD
P 7950 1550
F 0 "C6" H 8042 1596 50  0000 L CNN
F 1 "100n" H 8042 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7950 1550 50  0001 C CNN
F 3 "~" H 7950 1550 50  0001 C CNN
	1    7950 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 60D7FE25
P 8350 1550
F 0 "C7" H 8442 1596 50  0000 L CNN
F 1 "100n" H 8442 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8350 1550 50  0001 C CNN
F 3 "~" H 8350 1550 50  0001 C CNN
	1    8350 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 1650 8350 1700
Wire Wire Line
	8350 1700 7950 1700
Connection ~ 6750 1700
Wire Wire Line
	6750 1700 6750 1650
Wire Wire Line
	6750 1400 7150 1400
Wire Wire Line
	8350 1400 8350 1450
Connection ~ 6750 1400
Wire Wire Line
	6750 1400 6750 1450
Wire Wire Line
	7950 1450 7950 1400
Connection ~ 7950 1400
Wire Wire Line
	7950 1400 8350 1400
Wire Wire Line
	7950 1650 7950 1700
Connection ~ 7950 1700
Wire Wire Line
	7950 1700 7550 1700
Wire Wire Line
	7550 1650 7550 1700
Connection ~ 7550 1700
Wire Wire Line
	7550 1700 7150 1700
Wire Wire Line
	7550 1450 7550 1400
Connection ~ 7550 1400
Wire Wire Line
	7550 1400 7950 1400
Wire Wire Line
	7150 1450 7150 1400
Connection ~ 7150 1400
Wire Wire Line
	7150 1400 7550 1400
Wire Wire Line
	7150 1650 7150 1700
Connection ~ 7150 1700
Wire Wire Line
	7150 1700 6750 1700
Text Notes 6600 2100 0    55   ~ 0
1x bulk decoupling cap + 100nF per VDD pin
$Comp
L Device:L_Small L1
U 1 1 60D8528D
P 9600 1400
F 0 "L1" V 9785 1400 50  0000 C CNN
F 1 "27n" V 9694 1400 50  0000 C CNN
F 2 "Inductor_SMD:L_0402_1005Metric" H 9600 1400 50  0001 C CNN
F 3 "~" H 9600 1400 50  0001 C CNN
	1    9600 1400
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3VA #PWR0113
U 1 1 60D869E0
P 8550 2500
F 0 "#PWR0113" H 8550 2350 50  0001 C CNN
F 1 "+3.3VA" H 8550 2650 50  0000 C CNN
F 2 "" H 8550 2500 50  0001 C CNN
F 3 "" H 8550 2500 50  0001 C CNN
	1    8550 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2500 8550 2600
$Comp
L power:+3.3VA #PWR0114
U 1 1 60D87C66
P 10250 1350
F 0 "#PWR0114" H 10250 1200 50  0001 C CNN
F 1 "+3.3VA" H 10250 1500 50  0000 C CNN
F 2 "" H 10250 1350 50  0001 C CNN
F 3 "" H 10250 1350 50  0001 C CNN
	1    10250 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0115
U 1 1 60D880F0
P 9300 1350
F 0 "#PWR0115" H 9300 1200 50  0001 C CNN
F 1 "+3.3V" H 9300 1500 50  0000 C CNN
F 2 "" H 9300 1350 50  0001 C CNN
F 3 "" H 9300 1350 50  0001 C CNN
	1    9300 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 60D88531
P 9850 1750
F 0 "#PWR0116" H 9850 1500 50  0001 C CNN
F 1 "GND" H 9855 1577 50  0000 C CNN
F 2 "" H 9850 1750 50  0001 C CNN
F 3 "" H 9850 1750 50  0001 C CNN
	1    9850 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 60D887D8
P 9850 1550
F 0 "C8" H 9942 1596 50  0000 L CNN
F 1 "1u" H 9942 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9850 1550 50  0001 C CNN
F 3 "~" H 9850 1550 50  0001 C CNN
	1    9850 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 60D890F3
P 10250 1550
F 0 "C9" H 10342 1596 50  0000 L CNN
F 1 "100n" H 10342 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10250 1550 50  0001 C CNN
F 3 "~" H 10250 1550 50  0001 C CNN
	1    10250 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 1650 9850 1700
Wire Wire Line
	9850 1700 10250 1700
Wire Wire Line
	10250 1700 10250 1650
Connection ~ 9850 1700
Wire Wire Line
	9850 1700 9850 1750
Wire Wire Line
	10250 1350 10250 1400
Wire Wire Line
	10250 1400 9850 1400
Wire Wire Line
	9850 1400 9850 1450
Connection ~ 10250 1400
Wire Wire Line
	10250 1400 10250 1450
Wire Wire Line
	9700 1400 9850 1400
Connection ~ 9850 1400
Wire Wire Line
	9300 1350 9300 1400
Wire Wire Line
	9300 1400 9500 1400
Text Notes 9150 2100 0    55   ~ 0
‘Light’ low-pass filter for analog VDD
NoConn ~ 7650 2800
$Comp
L power:+3.3V #PWR0117
U 1 1 60D951B9
P 6150 2500
F 0 "#PWR0117" H 6150 2350 50  0001 C CNN
F 1 "+3.3V" H 6150 2650 50  0000 C CNN
F 2 "" H 6150 2500 50  0001 C CNN
F 3 "" H 6150 2500 50  0001 C CNN
	1    6150 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 60D95D39
P 6150 3550
F 0 "R2" H 6209 3596 50  0000 L CNN
F 1 "10k" H 6209 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 6150 3550 50  0001 C CNN
F 3 "~" H 6150 3550 50  0001 C CNN
	1    6150 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 60D96646
P 6150 3850
F 0 "#PWR0118" H 6150 3600 50  0001 C CNN
F 1 "GND" H 6155 3677 50  0000 C CNN
F 2 "" H 6150 3850 50  0001 C CNN
F 3 "" H 6150 3850 50  0001 C CNN
	1    6150 3850
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 60D986B1
P 6150 2750
F 0 "JP1" V 6104 2818 50  0000 L CNN
F 1 "SolderJumper_2_Open" V 6195 2818 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 6150 2750 50  0001 C CNN
F 3 "~" H 6150 2750 50  0001 C CNN
	1    6150 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 2500 6150 2600
Wire Wire Line
	6150 2900 6150 3000
Wire Wire Line
	6150 3000 7650 3000
Text Notes 6350 2550 0    55   ~ 0
BOOT0: 1 = Bootloader, 0 = ‘Run’
Wire Wire Line
	6150 3000 6150 3450
Connection ~ 6150 3000
Wire Wire Line
	6150 3650 6150 3850
$Comp
L Device:Crystal_Small Y1
U 1 1 60D6E442
P 6900 3550
F 0 "Y1" H 6900 3775 50  0000 C CNN
F 1 "8MHz" H 6900 3684 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_5032-2Pin_5.0x3.2mm" H 6900 3550 50  0001 C CNN
F 3 "~" H 6900 3550 50  0001 C CNN
	1    6900 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3550 7100 3550
Wire Wire Line
	7100 3550 7100 3300
Wire Wire Line
	7100 3300 7650 3300
Wire Wire Line
	7650 3200 6700 3200
Wire Wire Line
	6700 3200 6700 3550
Wire Wire Line
	6700 3550 6800 3550
$Comp
L Device:C_Small C11
U 1 1 60D767B7
P 7100 3750
F 0 "C11" H 7192 3796 50  0000 L CNN
F 1 "30p" H 7192 3705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7100 3750 50  0001 C CNN
F 3 "~" H 7100 3750 50  0001 C CNN
	1    7100 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 60D76CA3
P 6700 3750
F 0 "C10" H 6792 3796 50  0000 L CNN
F 1 "30p" H 6792 3705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6700 3750 50  0001 C CNN
F 3 "~" H 6700 3750 50  0001 C CNN
	1    6700 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3550 6700 3650
Connection ~ 6700 3550
Wire Wire Line
	7100 3550 7100 3650
Connection ~ 7100 3550
Text Label 7250 3200 0    50   ~ 0
HSE_OUT
Text Label 7250 3300 0    50   ~ 0
HSE_IN
Text Label 7250 3000 0    50   ~ 0
BOOT0
$Comp
L power:GND #PWR0119
U 1 1 60D7B078
P 6700 3850
F 0 "#PWR0119" H 6700 3600 50  0001 C CNN
F 1 "GND" H 6705 3677 50  0000 C CNN
F 2 "" H 6700 3850 50  0001 C CNN
F 3 "" H 6700 3850 50  0001 C CNN
	1    6700 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 60D7B586
P 7100 3850
F 0 "#PWR0120" H 7100 3600 50  0001 C CNN
F 1 "GND" H 7105 3677 50  0000 C CNN
F 2 "" H 7100 3850 50  0001 C CNN
F 3 "" H 7100 3850 50  0001 C CNN
	1    7100 3850
	1    0    0    -1  
$EndComp
Text GLabel 9650 5100 2    50   Input ~ 0
USB_D+
Text GLabel 9650 5000 2    50   Input ~ 0
USB_D-
Wire Wire Line
	8950 5100 9450 5100
Wire Wire Line
	9650 5000 8950 5000
$Comp
L Device:R_Small R4
U 1 1 60D829FA
P 9450 4800
F 0 "R4" H 9509 4846 50  0000 L CNN
F 1 "1k5" H 9509 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 9450 4800 50  0001 C CNN
F 3 "~" H 9450 4800 50  0001 C CNN
	1    9450 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4900 9450 5100
Connection ~ 9450 5100
Wire Wire Line
	9450 5100 9650 5100
$Comp
L power:+3.3V #PWR0121
U 1 1 60D84DD9
P 9450 4700
F 0 "#PWR0121" H 9450 4550 50  0001 C CNN
F 1 "+3.3V" H 9450 4850 50  0000 C CNN
F 2 "" H 9450 4700 50  0001 C CNN
F 3 "" H 9450 4700 50  0001 C CNN
	1    9450 4700
	1    0    0    -1  
$EndComp
Text GLabel 8950 4900 2    50   Input ~ 0
PA10
Text GLabel 8950 5200 2    50   Input ~ 0
SWDIO
Text GLabel 8950 5300 2    50   Input ~ 0
SWCLK
Text GLabel 8950 5400 2    50   Input ~ 0
PA15
$Comp
L Device:LED_Small D2
U 1 1 60D868EE
P 9550 4000
F 0 "D2" H 9550 3793 50  0000 C CNN
F 1 "BLUE" H 9550 3884 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 9550 4000 50  0001 C CNN
F 3 "~" V 9550 4000 50  0001 C CNN
	1    9550 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	9450 4000 8950 4000
$Comp
L Device:R_Small R3
U 1 1 60D8979E
P 9800 4200
F 0 "R3" H 9859 4246 50  0000 L CNN
F 1 "1k5" H 9859 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 9800 4200 50  0001 C CNN
F 3 "~" H 9800 4200 50  0001 C CNN
	1    9800 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 4000 9800 4000
Wire Wire Line
	9800 4000 9800 4100
Wire Wire Line
	8150 5600 8150 5650
Wire Wire Line
	8150 5650 8250 5650
Wire Wire Line
	8450 5650 8450 5600
Wire Wire Line
	8350 5600 8350 5650
Connection ~ 8350 5650
Wire Wire Line
	8350 5650 8450 5650
Wire Wire Line
	8250 5600 8250 5650
Connection ~ 8250 5650
Wire Wire Line
	8250 5650 8350 5650
Wire Wire Line
	8150 5700 8150 5650
Connection ~ 8150 5650
$Comp
L power:GND #PWR0122
U 1 1 60D935DF
P 9800 4300
F 0 "#PWR0122" H 9800 4050 50  0001 C CNN
F 1 "GND" H 9800 4150 50  0000 C CNN
F 2 "" H 9800 4300 50  0001 C CNN
F 3 "" H 9800 4300 50  0001 C CNN
	1    9800 4300
	1    0    0    -1  
$EndComp
Text Label 9000 4000 0    50   ~ 0
LED_STAT
NoConn ~ 8950 3900
NoConn ~ 8950 4100
$Comp
L Connector_Generic:Conn_01x15 J2
U 1 1 60D9A969
P 2100 5600
F 0 "J2" H 2180 5642 50  0000 L CNN
F 1 "Conn_01x15" H 2180 5551 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x15_P2.54mm_Vertical" H 2100 5600 50  0001 C CNN
F 3 "~" H 2100 5600 50  0001 C CNN
	1    2100 5600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x15 J3
U 1 1 60D9C1D6
P 3450 5600
F 0 "J3" H 3530 5642 50  0000 L CNN
F 1 "Conn_01x15" H 3530 5551 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x15_P2.54mm_Vertical" H 3450 5600 50  0001 C CNN
F 3 "~" H 3450 5600 50  0001 C CNN
	1    3450 5600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0123
U 1 1 60D9DC62
P 1900 4900
F 0 "#PWR0123" H 1900 4750 50  0001 C CNN
F 1 "+3.3V" V 1915 5028 50  0000 L CNN
F 2 "" H 1900 4900 50  0001 C CNN
F 3 "" H 1900 4900 50  0001 C CNN
	1    1900 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 60D9E461
P 1900 5000
F 0 "#PWR0124" H 1900 4750 50  0001 C CNN
F 1 "GND" V 1905 4872 50  0000 R CNN
F 2 "" H 1900 5000 50  0001 C CNN
F 3 "" H 1900 5000 50  0001 C CNN
	1    1900 5000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 60D9E585
P 3250 5000
F 0 "#PWR0125" H 3250 4750 50  0001 C CNN
F 1 "GND" V 3255 4872 50  0000 R CNN
F 2 "" H 3250 5000 50  0001 C CNN
F 3 "" H 3250 5000 50  0001 C CNN
	1    3250 5000
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0126
U 1 1 60D9EA25
P 3250 4900
F 0 "#PWR0126" H 3250 4750 50  0001 C CNN
F 1 "+3.3V" V 3265 5028 50  0000 L CNN
F 2 "" H 3250 4900 50  0001 C CNN
F 3 "" H 3250 4900 50  0001 C CNN
	1    3250 4900
	0    -1   -1   0   
$EndComp
Text GLabel 1900 5100 0    50   Input ~ 0
SWDIO
Text GLabel 1900 5200 0    50   Input ~ 0
SWCLK
Text GLabel 1900 5300 0    50   Input ~ 0
PA15
Text GLabel 1900 5400 0    50   Input ~ 0
SWO
Text GLabel 1900 5500 0    50   Input ~ 0
PB4
Text GLabel 1900 5600 0    50   Input ~ 0
PB5
Text GLabel 1900 5700 0    50   Input ~ 0
PB6
Text GLabel 1900 5800 0    50   Input ~ 0
PB7
Text GLabel 1900 5900 0    50   Input ~ 0
PB8
Text GLabel 1900 6000 0    50   Input ~ 0
PB9
Text GLabel 1900 6100 0    50   Input ~ 0
PC13
Text GLabel 1900 6200 0    50   Input ~ 0
PC14
Text GLabel 1900 6300 0    50   Input ~ 0
PC15
Text GLabel 3250 5100 0    50   Input ~ 0
PA10
Text GLabel 3250 5200 0    50   Input ~ 0
PA9
Text GLabel 3250 5300 0    50   Input ~ 0
PA8
Text GLabel 3250 5700 0    50   Input ~ 0
PB1
Text GLabel 3250 5400 0    50   Input ~ 0
PB11
Text GLabel 3250 5500 0    50   Input ~ 0
PB10
Text GLabel 3250 5800 0    50   Input ~ 0
PB0
Text GLabel 3250 5900 0    50   Input ~ 0
PA7
Text GLabel 3250 6100 0    50   Input ~ 0
PA5
Text GLabel 3250 6200 0    50   Input ~ 0
PA4
Text GLabel 3250 6300 0    50   Input ~ 0
PA3
Text GLabel 3250 6000 0    50   Input ~ 0
PA6
Text GLabel 3250 5600 0    50   Input ~ 0
PB2
Text GLabel 7650 3500 0    50   Input ~ 0
PC13
Text GLabel 7650 3600 0    50   Input ~ 0
PC14
Text GLabel 7650 3700 0    50   Input ~ 0
PC15
Text GLabel 7650 3900 0    50   Input ~ 0
PB0
Text GLabel 7650 4000 0    50   Input ~ 0
PB1
Text GLabel 7650 4100 0    50   Input ~ 0
PB2
Text GLabel 7650 4200 0    50   Input ~ 0
SWO
Text GLabel 7650 4300 0    50   Input ~ 0
PB4
Text GLabel 7650 4400 0    50   Input ~ 0
PB5
Text GLabel 7650 4500 0    50   Input ~ 0
PB6
Text GLabel 7650 4600 0    50   Input ~ 0
PB7
Text GLabel 7650 4700 0    50   Input ~ 0
PB8
Text GLabel 7650 4800 0    50   Input ~ 0
PB9
Text GLabel 7650 4900 0    50   Input ~ 0
PB10
Text GLabel 7650 5000 0    50   Input ~ 0
PB11
NoConn ~ 7650 5400
NoConn ~ 7650 5300
NoConn ~ 7650 5200
NoConn ~ 7650 5100
Text GLabel 8950 4200 2    50   Input ~ 0
PA3
Text GLabel 8950 4300 2    50   Input ~ 0
PA4
Text GLabel 8950 4400 2    50   Input ~ 0
PA5
Text GLabel 8950 4500 2    50   Input ~ 0
PA6
Text GLabel 8950 4600 2    50   Input ~ 0
PA7
Text GLabel 8950 4700 2    50   Input ~ 0
PA8
Text GLabel 8950 4800 2    50   Input ~ 0
PA9
$EndSCHEMATC
