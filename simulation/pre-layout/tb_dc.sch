v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
C {vsource.sym} 90 -160 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} 0 -160 0 0 {name=VIN value=0 savecurrent=false}
C {gnd.sym} 30 0 0 0 {name=l1 lab=0}
C {gnd.sym} 0 -130 0 0 {name=l2 lab=0}
C {gnd.sym} 90 -130 0 0 {name=l3 lab=0}
C {lab_pin.sym} 90 -190 2 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 0 -190 2 0 {name=p2 sig_type=std_logic lab=VIN}
C {lab_pin.sym} -10 -40 0 0 {name=p3 sig_type=std_logic lab=VIN}
C {lab_pin.sym} 30 -80 2 0 {name=p4 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 100 -40 2 0 {name=p5 sig_type=std_logic lab=VOUT}
C {code.sym} -170 -220 0 0 {name=s1 only_toplevel=false value=
"
.lib /home/mveliev/ams/pdks/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.save all

.dc VIN 0 1.8 0.01
	
.control
run
	let static_power = v(vdd)*(-i(vdd))

	meas dc static_power_MAX max static_power
	meas dc static_power_HIGH find static_power at=1.8 
	meas dc static_power_LOW find static_power at=0


	let static_MAX_mW = static_power_MAX*1e3
	let static_HIGH_uW = static_power_HIGH*1e6
	let static_LOW_uW = static_power_LOW*1e6

	print static_MAX_uW static_HIGH_uW static_LOW_uW 
	plot static_MAX_uW static_HIGH_uW static_LOW_uW 
.endc
"

}
C {/home/mveliev/ams/projects/02_cmos_inverter/xschem/simulation/inverter.sym} 90 160 0 0 {name=x2}
