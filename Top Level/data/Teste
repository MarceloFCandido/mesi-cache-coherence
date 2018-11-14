onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Variáveis do Bloco Compartilhado}
add wave -noupdate /Bloco/CLK
add wave -noupdate /Bloco/CLR
add wave -noupdate /Bloco/CPU_event
add wave -noupdate /Bloco/Controle
add wave -noupdate /Bloco/BUS_out
add wave -noupdate /Bloco/state_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {154 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 220
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2010 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 2000ps sim:/Bloco/CLK 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 2000ps sim:/Bloco/CLR 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 30ps Edit:/Bloco/CLR 
wave create -driver freeze -pattern constant -value 00000 -range 4 0 -starttime 0ps -endtime 2000ps sim:/Bloco/CPU_event 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00001 -range 4 0 -starttime 0ps -endtime 100ps Edit:/Bloco/CPU_event 
wave modify -driver freeze -pattern constant -value 00010 -range 4 0 -starttime 100ps -endtime 200ps Edit:/Bloco/CPU_event 
wave modify -driver freeze -pattern constant -value 10001 -range 4 0 -starttime 200ps -endtime 300ps Edit:/Bloco/CPU_event 
wave modify -driver freeze -pattern constant -value 01000 -range 4 0 -starttime 300ps -endtime 400ps Edit:/Bloco/CPU_event 
wave modify -driver freeze -pattern constant -value 00100 -range 4 0 -starttime 400ps -endtime 500ps Edit:/Bloco/CPU_event 
wave modify -driver freeze -pattern constant -value 00001 -range 4 0 -starttime 500ps -endtime 600ps Edit:/Bloco/CPU_event 
wave modify -driver freeze -pattern constant -value 00010 -range 4 0 -starttime 600ps -endtime 700ps Edit:/Bloco/CPU_event 
wave modify -driver freeze -pattern constant -value 10001 -range 4 0 -starttime 700ps -endtime 800ps Edit:/Bloco/CPU_event 
wave modify -driver freeze -pattern constant -value 01000 -range 4 0 -starttime 800ps -endtime 900ps Edit:/Bloco/CPU_event 
wave modify -driver freeze -pattern constant -value 00100 -range 4 0 -starttime 900ps -endtime 1000ps Edit:/Bloco/CPU_event 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 2000ps sim:/Bloco/Controle 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 500ps Edit:/Bloco/CLR 
wave modify -driver freeze -pattern constant -value 0 -starttime 30ps -endtime 500ps Edit:/Bloco/CLR 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 500ps Edit:/Bloco/Controle 
WaveCollapseAll -1
wave clipboard restore
