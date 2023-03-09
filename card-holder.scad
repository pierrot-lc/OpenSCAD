// C = Card
// CH = Card Holder
// W, H, D = Width, Height, Depth
W_CH = 10;
H_CH = 2;
D_CH = 3;
W_OFFSET_CH = 0.7;
H_OFFSET_CH = 1;


module base(w, h, d, wo, ho) {
    points = [
        [0, 0],
        [w, 0],
        [0, h],
        [w, h],
        [wo, ho],
        [w - wo, h - ho],
    ];

    path = [0, 1, 3, 5, 4, 2];

    translate([-w/2, d/2, 0])
    rotate([90, 0, 0])
    linear_extrude(d) {
        polygon(points, [path]);
    }
}

base(W_CH, H_CH, D_CH, W_OFFSET_CH, H_OFFSET_CH);