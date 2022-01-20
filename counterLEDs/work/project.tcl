set projDir "C:/Users/Nano/Documents/FPGA\ projects/counterLEDs/work/vivado"
set projName "counterLEDs"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Nano/Documents/FPGA\ projects/counterLEDs/work/verilog/au_top_0.v" "C:/Users/Nano/Documents/FPGA\ projects/counterLEDs/work/verilog/reset_conditioner_1.v" "C:/Users/Nano/Documents/FPGA\ projects/counterLEDs/work/verilog/blink_2.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Nano/Documents/FPGA\ projects/counterLEDs/work/constraint/alchitry.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
