
module hex_nut_hole(nut_height = 3,
                    span = 10,         // Width of nut
                    bolt_diameter = 3,
                    hole_depth = 5,
                    self_tapping = false) {
   // Allow for self-tapping if required
   bolt_hole_diameter = (self_tapping == true) ? 0.7 * bolt_diameter : bolt_diameter;

   // If the hole depth required is deeper than the countersink, we need an extra straight part.
   straight_part_depth = hole_depth - nut_height;
   assert(straight_part_depth >= 0);

   union() {
      translate([0, 0, straight_part_depth]) {
         cylinder(h=nut_height, d=span, $fn=6);
      }
      cylinder(r = bolt_hole_diameter / 2, h = straight_part_depth);
   }
}

module hex_nut_hole_m3(hole_depth = 5) {
   hex_nut_hole(nut_height = 3,
                span = 6,
                bolt_diameter = 3,
                hole_depth = hole_depth,
                self_tapping = false);
}

// Test code
$fs = 0.15;
hex_nut_hole();
