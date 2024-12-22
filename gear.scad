include <BOSL/constants.scad>
use <BOSL/involute_gears.scad>

module top() {
	TRADIUS = 12.9 / 2;
	TGEAR_COUNT = 11;

	translate([0, 0, 10 - 0.001 + 11.75 / 2])
	gear(number_of_teeth=TGEAR_COUNT, mm_per_tooth=(2*3.1415*(TRADIUS + 2))/TGEAR_COUNT, hole_diameter=0, thickness=11.75, clearance=1);

	cylinder(r=10, h=10);
}

module bot() {
	BRADIUS = 38.5 / 2;
	BGEAR_COUNT = 40;

	gear(number_of_teeth=BGEAR_COUNT, mm_per_tooth=(2*3.1415*BRADIUS)/BGEAR_COUNT, hole_diameter=0, thickness=6, twist=5, clearance=0.8);
}

module body() {
	translate([0, 0, 10 - 0.001])
	top();
	bot();

	resize([32, 32, 13])
	difference() {
		sphere(d=32);

		translate([0, 0, -16])
		cube([32, 32, 32], true);
	}

}

difference() {
	body();

	translate([0, 0, -5])
	resize([30, 30, 12])
	difference() {
		sphere(d=32);

		translate([0, 0, -16])
		cube([32, 32, 32], true);
	}

	cylinder(h=30.5, d=6);

	cylinder(h=8.3, d=18.4);
}

