# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\MSI\Documents\Eunsang\Code\Verilog\Test_zybo\lab4_hello_world\lab4_hello_world\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\MSI\Documents\Eunsang\Code\Verilog\Test_zybo\lab4_hello_world\lab4_hello_world\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {lab4_hello_world}\
-hw {C:\Users\MSI\Documents\Eunsang\Code\Verilog\Test_zybo\lab4_hello_world\lab4_hello_world.xsa}\
-out {C:/Users/MSI/Documents/Eunsang/Code/Verilog/Test_zybo/lab4_hello_world}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {lab4_hello_world}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
