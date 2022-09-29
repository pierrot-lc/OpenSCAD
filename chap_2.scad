module heart() {
    union() {
        cube([10, 10, 1]);
        translate([0, 5, 0]) cylinder(h=1, r=5);
        translate([5, 0, 0]) cylinder(h=1, r=5);
    }
}

module openscad_logo() {
    difference() {
        sphere(5);
        cylinder(h=10, r=2.5, center=true);
        rotate([0, 90, 0]) cylinder(h=10, r=2.5, center=true);
        # rotate([90, 0, 0]) cylinder(h=13, r=2.5, center=true);
    }
}

module guitar_pick() {
    minkowski() {
        union() {
            cube([5, 5, 1]);
            cylinder(h=1, r=5);
        }
        cylinder(h=0.1, r=1);
    }
}

module snowman() {
    sphere(5); // Bottom body
    translate([0, 0, 5]) sphere(4); // Mid body
    translate([0, 0, 9]) sphere(3); // Top body
    translate([0, 0, 10]) cylinder(h=2.5, r=2); // Bottom hat
    translate([0, 0, 12.5]) cylinder(h=2.2, r=1.5); // Top hat
    translate([0, 3, 9]) rotate([90, 0, 0]) cylinder(h=3, r1=0, r2=1.5, center=true); // Nose
    translate([1, 2.35, 10]) sphere(0.5);  // Left eye
    translate([-1, 2.35, 10]) sphere(0.5);  // Right eye
}

module modern_table() {
    resize() cylinder(h=1, r=6);
}

$fn = 45;
// heart();
// openscad_logo();
// guitar_pick();
// snowman();
modern_table();