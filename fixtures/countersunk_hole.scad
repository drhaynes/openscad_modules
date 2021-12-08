// Create geometry for a countersunk hole
module countersunk_hole(large_diameter = 7, small_diameter = 4, depth = 3) {
   cylinder(r1 = small_diameter / 2, r2 = large_diameter / 2, h = depth);
}

// Test code
$fs = 0.15;
countersunk_hole();
