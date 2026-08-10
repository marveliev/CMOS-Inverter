set PDK_ROOT /home/mveliev/ams/pdks/share/pdk
set setup $PDK_ROOT/sky130A/libs.tech/netgen/sky130A_setup.tcl
lvs {inverter_layout.spice inverter_layout} {inverter_schematic.spice inverter} $setup lvs_report.txt -json
quit

