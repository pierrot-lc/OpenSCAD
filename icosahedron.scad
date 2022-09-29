PHI = (1 + sqrt(5)) / 2;
ALPHA = 72;

function isocele_longueur(L) = L / (2 * tan(ALPHA / 2));
function hauteur(L) = L * sqrt(3) / 2;
function ordonnee(L) = sqrt(hauteur(L)^2 - isocele_longueur(L)^2);

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

module icosahedron_hat(L) {
    for (i = [0:4]) {
        rotate([0, 0, i * ALPHA]) icosahedron_atom(L);
    }
}

module icosahedron(L) {
    hauteur_totale = L * sqrt(PHI^2 + 1);
    delta_z = (hauteur_totale - 2 * ordonnee(L)) / 2;

    translate([0, 0, delta_z])
        icosahedron_hat(L);

    translate([0, 0, -delta_z])
        rotate([0, 0, ALPHA/2])
        mirror([0, 0, 1])
        icosahedron_hat(L);
}

icosahedron(1);
// ico_from_square();