
module triangular_prism(size = [7, 5, 5]) {
    epsilon = 0.01;
    length = size[0];
    width = size[1];
    height = size[2];
    angle = atan(height / width);

    difference() {
        cube(size);
        translate([0, 0, height]) {
            rotate(a = - angle, v = [1, 0, 0]) {
                translate([-(epsilon / 2), 0, 0])
                cube([size[0] + epsilon, sqrt(pow(width, 2) + pow(height, 2)), size[2]]);
            }
        }
    }
}
