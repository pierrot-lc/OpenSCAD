// Measures of the telecommand in centimeters.
R1 = 3.4/2;         // Small top radius.
R2 = 3.7/2;         // Big bottom radius.
L  = 8;             // Total length (includes radius).
H  = 1.1;           // Total height.
W = L - R1 - R2;    // Width without the top and bottom circles.

// Measures of the carrier in centimeters.
H_CARRIER = 2 * H;                // Total height.
L_CARRIER = 1.1 * L ;               // Total length (includes radius).
R1_CARRIER = 1.3 * R1;            // Top radius.
R2_CARRIER = 1.2 * R2;             // Bottom radius.
W_CARRIER = L_CARRIER - R1 - R2;    // Width without the top and bottom circles.
L_OFFSET = 0.05 * L_CARRIER;          // Offset for the hole (x-axis).
H_OFFSET = 0.20 * H_CARRIER;        // Offset for the hole (z-axis).
L_LEGS = 0.45 * L_CARRIER;          // Size of the front side.
R_SCREWS = 0.2;                     // Size of the hole for the screws.
SCREW_Y_OFFSET = 0.7;               // Offset for the screws hole (y_axis).

$fn = 50;

module Base2dShape(top_radius, bottom_radius, length) {
    hull() {
        circle(bottom_radius);
        translate([length, 0, 0]) circle(top_radius);
    }
}

module telecommand(top_radius=R1, bottom_radius=R2, width=W, height=H) {
    linear_extrude(height) Base2dShape(top_radius, bottom_radius, width);
}

module carrier() {
    max_radius = max(R1_CARRIER, R2_CARRIER);
    legs_offset = L_LEGS - R2_CARRIER;
    difference() {
        linear_extrude(H_CARRIER) Base2dShape(R1_CARRIER, R2_CARRIER, W_CARRIER);
        translate([L_OFFSET, 0, H_OFFSET]) telecommand(1.2 * R1, 1.1 * R2, W, 1.4*H);  // Remove slightly bigger telecommand.
        translate([legs_offset, -max_radius, H_OFFSET]) cube([L_CARRIER, 2 * max_radius, H_CARRIER]);  // Make legs.
        translate([0.7 * W_CARRIER, SCREW_Y_OFFSET, -0.1 * H_CARRIER]) cylinder(2 * H_OFFSET, r=R_SCREWS);  // Left screw.
        translate([0.7 * W_CARRIER, -SCREW_Y_OFFSET, -0.1 * H_CARRIER]) cylinder(2 * H_OFFSET, r=R_SCREWS);  // Right screw.
    }
}

// main();
// # translate([L_OFFSET, 0, H_OFFSET]) telecommand();
carrier();