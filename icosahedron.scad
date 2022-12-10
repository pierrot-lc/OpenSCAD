PHI = (1 + sqrt(5)) / 2;
ALPHA = 72;

function isocele_longueur(L) = L / (2 * tan(ALPHA / 2));
function hauteur(L) = L * sqrt(3) / 2;
function ordonnee(L) = sqrt(hauteur(L)^2 - isocele_longueur(L)^2);
function hauteur_totale(L) = L * sqrt(PHI^2 + 1);

module ico_from_square() {
    L = 10;
    R = L * PHI;
    square([L, R], center = true);
    rotate([90, 90, 0]) square([L, R], center = true);
    rotate([90, 0, 90]) square([L, R], center = true);
}

module icosahedron_atom(L) {
    polyhedron(points = [
        [isocele_longueur(L), -L/2, 0],
        [isocele_longueur(L), L/2, 0],
        [0, 0, ordonnee(L)],
        [0, 0, 0],
    ], faces = [
        [0, 1, 2],
        [1, 2, 3],
        [0, 2, 3],
        [0, 1, 3],
    ], convexity=true);
}

module icosahedron_atom_rotate(L, i) {
    rotate([0, 0, i * ALPHA])
    icosahedron_atom(L);
}

module icosahedron_link_hull(L, i, sign_rot) {
    delta_z = (hauteur_totale(L) - 2 * ordonnee(L)) / 2;
    hull() {
        translate([0, 0, delta_z])
            icosahedron_atom_rotate(L, i);

        translate([0, 0, -delta_z])
            rotate([0, 0, sign_rot * ALPHA/2])
            mirror([0, 0, 1])
            icosahedron_atom_rotate(L, i);
    }
}

module icosahedron_hull(L) {
    delta_z = (hauteur_totale(L) - 2 * ordonnee(L)) / 2;
    for (i = [0:4]) {
        icosahedron_link_hull(L, i, 1);
        icosahedron_link_hull(L, i, -1);
    }
}

icosahedron_hull(10);