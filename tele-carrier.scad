RADIUS = 3;
HEIGHT = 8;
DEPTH = 2;

$fn=10;

module Base2dShape(radius=RADIUS, height=HEIGHT) {
    hull() {
        circle(radius);
        translate([height, 0, 0]) circle(radius);
    }
}

module RectangleToRemove(radius=RADIUS, height=HEIGHT, depth=DEPTH) {
    translate([0, -radius, 0])
        cube([height+radius, 2 * radius, depth * 2/3]);
}

module main(radius=RADIUS, height=HEIGHT, depth=DEPTH) {
    difference() {
        linear_extrude(depth) Base2dShape(radius, height);
        translate([radius/2, 0, depth*1/3+0.01])
            RectangleToRemove(radius, height, depth);
        translate([0, 0, depth*1/3]) linear_extrude(depth/2) circle(radius-0.01);
    }
}

main();