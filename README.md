# pynq-pulsegen-hdl
Verilog code for pynq pulsegen https://github.com/JeroenvO/pynq-pulsegen-wrapper

IP repo for pynq pulsegen. Used in Vivado as shown in how-to-connect.pdf

# Pynq Pulsegen
Pynq pulsegen is a pulse generator for a Pynq pheripheral PCB (shield) connected to the arduino header. This PCB has 20 IO outputs connected with a transistor to a HFBR 1521Z transmitter module. This way a pulse can be send to any device over plastic optic fibre with less than 10ns precision. 

Switch 1 is the on/off switch. Switch 2 switches between programming mode and running. Led 5 indicates the state of the system, led 4 indicates the clock cycles. Led 4 switches color on each cycle, one cycle it is blue, the next one red and so on. 
 
| Sw 1 | Sw 2 | Ld 5   | Ld 4  | State | Outputs |
| -----|----- |------- | ----- | ----- | ------- | 
| off  | any  | red    | red   | Off   | All off |
| on   | off  | orange | blue  | Prog  | All off |
| on   | on   | green  | blink | On    | Running |

New timing values for the pulses can be written to registers at any time, but are only read into the pulse generator in Prog mode. This is to prevent accidental updates during running the pulse generator.

# See also
* https://github.com/JeroenvO/pynq-pulsegen-wrapper
* https://github.com/JeroenvO/kicad-hfbr-transmitter
