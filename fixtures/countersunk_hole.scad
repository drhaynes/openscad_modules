// Create geometry for a countersunk hole
module countersunk_hole(head_diameter = 7,
                        bolt_diameter = 4,
                        hole_depth = 5,
                        countersink_depth = 3,
                        self_tapping = false) {

   // Allow for self-tapping if required
   bolt_hole_diameter = (self_tapping == true) ? 0.7 * bolt_diameter : bolt_diameter;

   // If the hole depth required is deeper than the countersink, we need an extra straight part.
   straight_part_depth = hole_depth - countersink_depth;
   assert(straight_part_depth >= 0);

   union() {
      translate([0, 0, straight_part_depth]) {
         cylinder(r1 = bolt_hole_diameter / 2, r2 = head_diameter / 2, h = countersink_depth);
      }
      cylinder(r = bolt_hole_diameter / 2, h = straight_part_depth);
   }
}

module countersunk_hole_m3(hole_depth = 5, self_tapping = false) {
   countersunk_hole(head_diameter = 6, // 5.7 - 6.0 in reality
                    bolt_diameter = 3,
                    hole_depth = hole_depth,
                    countersink_depth = 1.7,
                    self_tapping = self_tapping);
}

// Test code
$fs = 0.15;
countersunk_hole();
