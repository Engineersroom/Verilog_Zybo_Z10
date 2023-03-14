# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\MSI\Documents\Eunsang\Code\Verilog\Test_zybo\lab4_hello_world\hello_world_system\_ide\scripts\debugger_hello_world-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\MSI\Documents\Eunsang\Code\Verilog\Test_zybo\lab4_hello_world\hello_world_system\_ide\scripts\debugger_hello_world-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B100CFA" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B100CFA-13722093-0"}
fpga -file C:/Users/MSI/Documents/Eunsang/Code/Verilog/Test_zybo/lab4_hello_world/hello_world/_ide/bitstream/lab4_hello_world.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/MSI/Documents/Eunsang/Code/Verilog/Test_zybo/lab4_hello_world/lab4_hello_world/export/lab4_hello_world/hw/lab4_hello_world.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/MSI/Documents/Eunsang/Code/Verilog/Test_zybo/lab4_hello_world/hello_world/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/MSI/Documents/Eunsang/Code/Verilog/Test_zybo/lab4_hello_world/hello_world/Debug/hello_world.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
