/* Card holder constants. */
W_CH = 13;
H_CH = 3;
D_CH = 3;
W_OFFSET_CH = 2;
H_OFFSET_CH = 1;

/* Sink constants */
W_C = 10.2;
H_C = 2;
D_C = 0.4;
H_OFFSET_C = 1;

/* The base of the card holder.
*/
module base(w, h, d, wo, ho) {
    points = [
        [0, 0],
        [w, 0],
        [0, h],
        [w, h],
        [wo, ho],
        [w - wo, ho],
    ];

    path = [0, 1, 3, 5, 4, 2];

    translate([-w/2, d/2, 0])
    rotate([90, 0, 0])
    linear_extrude(d) {
        polygon(points, [path]);
    }
}

/* The square to remove from the base.
*/
module sink(w, h, d, ho) {
    translate([0, 0, 3/2 * ho])
    cube([w, d, h], center=true);
}


difference() {
    base(W_CH, H_CH, D_CH, W_OFFSET_CH, H_OFFSET_CH);
    sink(W_C, H_C, D_C, H_OFFSET_C);
}
