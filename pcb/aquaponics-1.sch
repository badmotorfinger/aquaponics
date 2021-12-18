EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Aquaponics flood and drain"
Date "2021-12-01"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Transistor_BJT:TIP120 Q1
U 1 1 61A9DC66
P 2250 2450
F 0 "Q1" V 2594 2450 50  0000 C CNN
F 1 "TIP120" V 2503 2450 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2450 2375 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/TIP120-D.PDF" H 2250 2450 50  0001 L CNN
	1    2250 2450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 61AA3849
P 2650 2350
F 0 "#PWR01" H 2650 2100 50  0001 C CNN
F 1 "GND" H 2655 2177 50  0000 C CNN
F 2 "" H 2650 2350 50  0001 C CNN
F 3 "" H 2650 2350 50  0001 C CNN
	1    2650 2350
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:TIP120 Q2
U 1 1 61AC2D47
P 2250 3200
F 0 "Q2" V 2594 3200 50  0000 C CNN
F 1 "TIP120" V 2503 3200 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2450 3125 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/TIP120-D.PDF" H 2250 3200 50  0001 L CNN
	1    2250 3200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61AC8893
P 2650 3100
F 0 "#PWR02" H 2650 2850 50  0001 C CNN
F 1 "GND" H 2655 2927 50  0000 C CNN
F 2 "" H 2650 3100 50  0001 C CNN
F 3 "" H 2650 3100 50  0001 C CNN
	1    2650 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 2350 2450 2350
Wire Wire Line
	2450 3100 2650 3100
$Comp
L Transistor_BJT:TIP120 Q3
U 1 1 61AD3747
P 2250 3850
F 0 "Q3" V 2594 3850 50  0000 C CNN
F 1 "TIP120" V 2503 3850 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2450 3775 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/TIP120-D.PDF" H 2250 3850 50  0001 L CNN
	1    2250 3850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 61AD716B
P 2800 3750
F 0 "#PWR03" H 2800 3500 50  0001 C CNN
F 1 "GND" V 2805 3622 50  0000 R CNN
F 2 "" H 2800 3750 50  0001 C CNN
F 3 "" H 2800 3750 50  0001 C CNN
	1    2800 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2450 3750 2800 3750
Wire Wire Line
	3250 4050 3250 3150
Wire Wire Line
	2950 3250 2950 3400
Wire Wire Line
	3000 3050 3000 2650
$Comp
L Motor:Motor_DC M1
U 1 1 61AC0451
P 1300 1300
F 0 "M1" H 1458 1296 50  0000 L CNN
F 1 "Growbed Pump " H 1458 1205 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1300 1210 50  0001 C CNN
F 3 "~" H 1300 1210 50  0001 C CNN
	1    1300 1300
	1    0    0    -1  
$EndComp
$Comp
L Motor:Motor_DC M2
U 1 1 61AC2846
P 1300 1950
F 0 "M2" H 1458 1946 50  0000 L CNN
F 1 "Overflow Pump" H 1458 1855 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1300 1860 50  0001 C CNN
F 3 "~" H 1300 1860 50  0001 C CNN
	1    1300 1950
	1    0    0    -1  
$EndComp
$Comp
L Motor:Motor_DC M3
U 1 1 61AC8142
P 1300 2650
F 0 "M3" H 1458 2646 50  0000 L CNN
F 1 "Fish Feeder" H 1458 2555 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1300 2560 50  0001 C CNN
F 3 "~" H 1300 2560 50  0001 C CNN
	1    1300 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2350 2050 1600
Wire Wire Line
	2050 1600 1300 1600
Wire Wire Line
	2050 3100 2050 2600
Wire Wire Line
	2050 2600 1850 2600
Wire Wire Line
	1850 2600 1850 2250
Wire Wire Line
	1850 2250 1300 2250
Wire Wire Line
	2050 3750 1350 3750
Wire Wire Line
	1350 3750 1350 2950
Wire Wire Line
	1350 2950 1300 2950
$Comp
L Arduino:Arduino_Nano U1
U 1 1 61A9C2CE
P 4400 3350
F 0 "U1" H 4400 4317 50  0000 C CNN
F 1 "Arduino_Nano" H 4400 4226 50  0000 C CNN
F 2 "Arduino:Arduino_Nano" H 4400 2500 50  0001 C CNN
F 3 "https://store.arduino.cc/usa/arduino-nano" H 4400 3250 50  0001 C CNN
	1    4400 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3050 3800 3050
Wire Wire Line
	3250 3150 3800 3150
Wire Wire Line
	2950 3250 3800 3250
$Comp
L Device:R R4
U 1 1 61AC688B
P 2600 2650
F 0 "R4" V 2393 2650 50  0000 C CNN
F 1 "2.2k" V 2484 2650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 2530 2650 50  0001 C CNN
F 3 "~" H 2600 2650 50  0001 C CNN
	1    2600 2650
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 61ACD463
P 2600 3400
F 0 "R2" V 2393 3400 50  0000 C CNN
F 1 "2.2k" V 2484 3400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 2530 3400 50  0001 C CNN
F 3 "~" H 2600 3400 50  0001 C CNN
	1    2600 3400
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 61ACE6D7
P 2650 4050
F 0 "R5" V 2443 4050 50  0000 C CNN
F 1 "2.2k" V 2534 4050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 2580 4050 50  0001 C CNN
F 3 "~" H 2650 4050 50  0001 C CNN
	1    2650 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 2650 2750 2650
Wire Wire Line
	2450 2650 2250 2650
Wire Wire Line
	2950 3400 2750 3400
Wire Wire Line
	2450 3400 2250 3400
Wire Wire Line
	3250 4050 2800 4050
Wire Wire Line
	2500 4050 2250 4050
$Comp
L power:GND #PWR05
U 1 1 61AE2866
P 5900 1900
F 0 "#PWR05" H 5900 1650 50  0001 C CNN
F 1 "GND" H 5905 1727 50  0000 C CNN
F 2 "" H 5900 1900 50  0001 C CNN
F 3 "" H 5900 1900 50  0001 C CNN
	1    5900 1900
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 61AE3EB3
P 5900 2200
F 0 "R3" H 5970 2246 50  0000 L CNN
F 1 "330" H 5970 2155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 5830 2200 50  0001 C CNN
F 3 "~" H 5900 2200 50  0001 C CNN
	1    5900 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2400 5900 2400
Wire Wire Line
	5900 1900 5900 2050
Wire Wire Line
	5900 2400 5550 2400
Connection ~ 5900 2400
Wire Wire Line
	5900 2400 5900 2350
Wire Wire Line
	950  1100 1300 1100
Wire Wire Line
	950  1750 1300 1750
Wire Wire Line
	950  1100 950  850 
Wire Wire Line
	950  850  4550 850 
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 61AC2ACC
P 4400 1800
F 0 "J1" H 4428 1776 50  0000 L CNN
F 1 "5V Power Source" H 4300 1600 50  0000 L CNN
F 2 "Connector_TE-Connectivity:TE_826576-2_1x02_P3.96mm_Vertical" H 4400 1800 50  0001 C CNN
F 3 "~" H 4400 1800 50  0001 C CNN
	1    4400 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J3
U 1 1 61B07810
P 6500 3350
F 0 "J3" H 6528 3376 50  0000 L CNN
F 1 "Water Level Sensor" H 6528 3285 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6500 3350 50  0001 C CNN
F 3 "~" H 6500 3350 50  0001 C CNN
	1    6500 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J4
U 1 1 61B0AB30
P 6500 3850
F 0 "J4" H 6528 3876 50  0000 L CNN
F 1 "Rain Sensor" H 6528 3785 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6500 3850 50  0001 C CNN
F 3 "~" H 6500 3850 50  0001 C CNN
	1    6500 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 61B2268C
P 6100 3250
F 0 "#PWR0101" H 6100 3000 50  0001 C CNN
F 1 "GND" V 6105 3122 50  0000 R CNN
F 2 "" H 6100 3250 50  0001 C CNN
F 3 "" H 6100 3250 50  0001 C CNN
	1    6100 3250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 61B23027
P 6100 3750
F 0 "#PWR0102" H 6100 3500 50  0001 C CNN
F 1 "GND" V 6105 3622 50  0000 R CNN
F 2 "" H 6100 3750 50  0001 C CNN
F 3 "" H 6100 3750 50  0001 C CNN
	1    6100 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 3250 6300 3250
Wire Wire Line
	6100 3750 6300 3750
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 61B3F470
P 4750 1450
F 0 "J2" H 4830 1442 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 4830 1351 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-5.0-H_1x02_P5.00mm_Horizontal" H 4750 1450 50  0001 C CNN
F 3 "~" H 4750 1450 50  0001 C CNN
	1    4750 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 61B405B6
P 4900 1800
F 0 "J5" H 4928 1776 50  0000 L CNN
F 1 "Conn_01x02_Female" H 4928 1685 50  0000 L CNN
F 2 "Connector_TE-Connectivity:TE_826576-2_1x02_P3.96mm_Vertical" H 4900 1800 50  0001 C CNN
F 3 "~" H 4900 1800 50  0001 C CNN
	1    4900 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 850  4550 1300
Wire Wire Line
	4550 1300 4500 1300
Wire Wire Line
	4500 1300 4500 1700
Wire Wire Line
	4500 1700 4700 1700
Wire Wire Line
	4700 1700 4700 1800
Connection ~ 4550 1300
Wire Wire Line
	4550 1300 4550 1450
$Comp
L Device:R_PHOTO R1
U 1 1 61ADB901
P 6450 2550
F 0 "R1" H 6520 2596 50  0000 L CNN
F 1 "Light Sensor" H 6520 2505 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 6500 2300 50  0001 L CNN
F 3 "~" H 6450 2500 50  0001 C CNN
	1    6450 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  1100 950  1750
Connection ~ 950  1100
Wire Wire Line
	1300 2450 950  2450
Wire Wire Line
	950  2450 950  1750
Connection ~ 950  1750
$Comp
L Sensor:DHT11 U2
U 1 1 61B35334
P 4400 5150
F 0 "U2" H 4156 5196 50  0000 R CNN
F 1 "DHT11" H 4156 5105 50  0000 R CNN
F 2 "Sensor:Aosong_DHT11_5.5x12.0_P2.54mm" H 4400 4750 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/aosong/DHT11.pdf" H 4550 5400 50  0001 C CNN
	1    4400 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 61B37516
P 4400 5550
F 0 "#PWR06" H 4400 5300 50  0001 C CNN
F 1 "GND" H 4405 5377 50  0000 C CNN
F 2 "" H 4400 5550 50  0001 C CNN
F 3 "" H 4400 5550 50  0001 C CNN
	1    4400 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5450 4400 5550
$Comp
L Device:R R6
U 1 1 61B3D7D4
P 4950 4650
F 0 "R6" H 5020 4696 50  0000 L CNN
F 1 "10k" H 5020 4605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 4880 4650 50  0001 C CNN
F 3 "~" H 4950 4650 50  0001 C CNN
	1    4950 4650
	1    0    0    1   
$EndComp
Wire Wire Line
	5000 3450 5550 3450
Wire Wire Line
	5550 3450 5550 2400
Wire Wire Line
	6300 3550 6300 3450
Wire Wire Line
	5000 3550 6300 3550
Wire Wire Line
	6300 3950 5700 3950
Wire Wire Line
	5700 3950 5700 3650
Wire Wire Line
	5700 3650 5000 3650
$Comp
L power:+3.3V #PWR0103
U 1 1 61B97206
P 5100 3950
F 0 "#PWR0103" H 5100 3800 50  0001 C CNN
F 1 "+3.3V" V 5115 4078 50  0000 L CNN
F 2 "" H 5100 3950 50  0001 C CNN
F 3 "" H 5100 3950 50  0001 C CNN
	1    5100 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 3950 5000 3950
Wire Wire Line
	5000 3750 5550 3750
Wire Wire Line
	5550 3750 5550 5150
Wire Wire Line
	5550 5150 4950 5150
$Comp
L power:+3.3V #PWR0104
U 1 1 61B9BD8B
P 4400 4550
F 0 "#PWR0104" H 4400 4400 50  0001 C CNN
F 1 "+3.3V" H 4415 4723 50  0000 C CNN
F 2 "" H 4400 4550 50  0001 C CNN
F 3 "" H 4400 4550 50  0001 C CNN
	1    4400 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4550 4400 4600
Wire Wire Line
	4400 4600 4700 4600
Wire Wire Line
	4700 4600 4700 4500
Wire Wire Line
	4700 4500 4950 4500
Connection ~ 4400 4600
Wire Wire Line
	4400 4600 4400 4850
Wire Wire Line
	4950 4800 4950 5150
Connection ~ 4950 5150
Wire Wire Line
	4950 5150 4700 5150
$Comp
L power:+5V #PWR0105
U 1 1 61BB705B
P 5200 2950
F 0 "#PWR0105" H 5200 2800 50  0001 C CNN
F 1 "+5V" V 5215 3078 50  0000 L CNN
F 2 "" H 5200 2950 50  0001 C CNN
F 3 "" H 5200 2950 50  0001 C CNN
	1    5200 2950
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 61BBB483
P 3900 1800
F 0 "#PWR0106" H 3900 1650 50  0001 C CNN
F 1 "+5V" V 3915 1928 50  0000 L CNN
F 2 "" H 3900 1800 50  0001 C CNN
F 3 "" H 3900 1800 50  0001 C CNN
	1    3900 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3900 1800 4200 1800
$Comp
L power:+5V #PWR0107
U 1 1 61BC0B4D
P 6100 3400
F 0 "#PWR0107" H 6100 3250 50  0001 C CNN
F 1 "+5V" V 6115 3528 50  0000 L CNN
F 2 "" H 6100 3400 50  0001 C CNN
F 3 "" H 6100 3400 50  0001 C CNN
	1    6100 3400
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 61BCA5A2
P 6100 3850
F 0 "#PWR0108" H 6100 3700 50  0001 C CNN
F 1 "+5V" V 6115 3978 50  0000 L CNN
F 2 "" H 6100 3850 50  0001 C CNN
F 3 "" H 6100 3850 50  0001 C CNN
	1    6100 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 3400 6300 3400
Wire Wire Line
	6300 3400 6300 3350
Wire Wire Line
	6100 3850 6300 3850
$Comp
L power:+5V #PWR0110
U 1 1 61C0E91D
P 6450 2750
F 0 "#PWR0110" H 6450 2600 50  0001 C CNN
F 1 "+5V" H 6465 2923 50  0000 C CNN
F 2 "" H 6450 2750 50  0001 C CNN
F 3 "" H 6450 2750 50  0001 C CNN
	1    6450 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	6450 2750 6450 2700
Wire Wire Line
	3800 2950 3650 2950
Wire Wire Line
	4550 1550 3650 1550
Wire Wire Line
	3650 1550 3650 2950
$Comp
L power:GND #PWR0111
U 1 1 61C4FE01
P 3650 1350
F 0 "#PWR0111" H 3650 1100 50  0001 C CNN
F 1 "GND" H 3655 1177 50  0000 C CNN
F 2 "" H 3650 1350 50  0001 C CNN
F 3 "" H 3650 1350 50  0001 C CNN
	1    3650 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 1350 3650 1550
Connection ~ 3650 1550
Wire Wire Line
	5000 2950 5200 2950
$EndSCHEMATC
