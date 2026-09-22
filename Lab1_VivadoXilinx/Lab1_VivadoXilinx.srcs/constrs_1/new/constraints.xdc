## Horloge 100 MHz
set_property -dict { PACKAGE_PIN E3  IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports { clk }];

## Interrupteur LEFT
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports { LEFT_sw }];

## Interrupteur RIGHT
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports { RIGHT_sw }];

## Reset global (GReset)
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports { GReset }];

## DISPLAY -- 8 LEDs
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports { DISPLAY[0] }];
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports { DISPLAY[1] }];
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports { DISPLAY[2] }];
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports { DISPLAY[3] }];
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports { DISPLAY[4] }];
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports { DISPLAY[5] }];
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports { DISPLAY[6] }];
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports { DISPLAY[7] }];