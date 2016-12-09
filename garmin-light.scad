$fs = 0.1; // mm per facet in cylinder
$fa = 5; // degrees per facet in cylinder
$fn = 100;
module garmin_head(){
	translate([0,0,-11.8])
	difference() {
		union() {cylinder(d1=38.83, d2=38.14, h=10);
			translate([0,0,10]) cylinder(d1=38.14, d2=30, h=1.8);
		}
		translate([0,0,-1])cylinder(d=34.14, h=10+1);
		garmin_hole_pattern();
	}

}
module garmin_hole_pattern() {
	garmin_hole();
	mirror([1,1,0]) garmin_hole();
	mirror([-1,1,0]) garmin_hole();
	mirror([0,1,0]) garmin_hole();
}
module garmin_hole() {
	translate([0,10,0]) {
		cylinder(d=3.16, h=30);
		translate([0,0,11])cylinder(d=7, h=10);
	}
}

module light_motion() {
	cylinder(d=11.41, h=2.54);
	cylinder(d=7.94, h=4.8);
	translate([-7,-17,4.8]) cube(size=[14, 34, 5], center=false);
	rotate([90,0,0]) translate([0,4.8+34/2,-56]){
		cylinder(d1=27.8, d2=31.9, h=56+35);
		translate([0,0,56+35]) cylinder(d1=31.6, d2=31.6, h=1);
		translate([0,0,56+35+1]) cylinder(d1=32.3, d2=32.3, h=6.68);
		difference() {
			translate([0,0,56+35+1+6.68]) cylinder(d1=32.3, d2=30.8, h=1.5);
			translate([0,0,56+35+1+6.68]) cylinder(d1=21.4, d2=23.8, h=1.6);
		}
	}
}

module mount() {
difference() {
	hull() {
		cylinder(d1=30, d2=30, h=10);
		translate([0,25,0]) cylinder(d1=30, d2=30, h=10);
	}
	translate([0,25,5.2]) {
		translate([-5.5,0,-10])cube(size=[11, 10+2.54, 10+2.54], center=false);
		translate([0,0,-10]) {
			cylinder(d=11.41, h=2.54+10);
			hull(){
				translate([0,5,0]) cylinder(d=11.41, h=2.54+10);
				translate([0,25,0]) cylinder(d=11.41, h=2.54+10);
			}
		}
		hull() {
			cylinder(d=7.94, h=4.8+100);
			translate([0,25,0]) cylinder(d=7.94, h=4.8+100);
		}
	}
	translate([0,0,-5])garmin_hole_pattern();
	translate([0,20+24,-12]) rotate([20,0,0]) cube(40, center=true);
}
}

// render the garmin head
//garmin_head();

// render the light & motion light
//translate([0,25,5.2]) rotate([0,0,180]) light_motion();

// render the mount
mount();
