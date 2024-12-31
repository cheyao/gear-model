RADIUS=3;

module hole() {
	cylinder(h=100, d=1, $fn=50, center=true);
}

module holes() {
	hole();

	for (i=[0:(360/6):360-(360/6)]) {
		translate([sin(i) * RADIUS, cos(i) * RADIUS, 0])
		hole();
	}
}

difference() {
	cylinder(d=15, h=25, center=true, $fn=90);

	holes();
}

