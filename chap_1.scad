module mouse() {
    radius = 10;
    linear_extrude(2) {
        circle(radius);
        translate([radius, -2*radius/3]) circle(radius /2);
        translate([radius, 2*radius/3]) circle(radius /2);
    }
}

module yoyo() {
    height = 5;
    top_radius = 10;
    cylinder(height, r1=top_radius, r2=top_radius/2);
    translate([0, 0, 2*height]) mirror([0, 0, 1]) cylinder(height, r1=top_radius, r2=top_radius/2);
}

module spinner() {
    m = 5;
    r = 5;
    cylinder(m, r1=0, r2=r);
    translate([0, 0, m]) cylinder(m/6, r1=r, r2=r/2);
    translate([0, 0, m + m/6]) cylinder(m/20, r1=r/2, r2=r/4);
    translate([0, 0, m]) cylinder(3/4*m, d=r/2);
}

module epcot() {
    translate([0, 0, 10]) sphere(10);
    cylinder(10, r1=7, r2=0);
}

module half_pipe() {
    difference() {
        cube([10, 10, 5]);
        {
            translate([5, 15, 6])
            rotate([90, 0, 0])
            cylinder(20, d=8);
        }
    }
}

module ice_cream() {
    difference() {
        cylinder(10, r1=0, r2=3);
        translate([0, 0, 2]) cylinder(10, r1=0, r2=3);
    }
}

$fn=30;
// mouse();
// yoyo();
spinner();
// epcot();
// half_pipe();
// ice_cream();