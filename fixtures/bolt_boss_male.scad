
// Create a boss for retaining a bolt.
module bolt_boss_male(bolt_diameter = 3,
                      height = 14,
                      existing_case_thickness = 3,
                      // Wall thickness for bosses should be 0.6 to minimise sinking, but can be increased in non-visible
                      // areas for extra strength.
                      boss_wall_thickness_factor = 0.6,
                      // Is this boss intended for a self-tapping screw? (Hole will be reduced 70% if true).
                      self_tapping = false) {
   epsilon = 0.01;

   if(height >= (5 * existing_case_thickness)) {
      echo("Warning: Bolt boss height should not exceed 5 x existing case thickness.");
   }

   // Allow for self-tapping if required
   bolt_hole_diameter = (self_tapping == true) ? 0.7 * bolt_diameter : bolt_diameter;

   outer_radius = bolt_hole_diameter + (existing_case_thickness * boss_wall_thickness_factor);
   difference() {
      // Outer
      cylinder(h = height, r1 = outer_radius + 0.25, r2 = outer_radius);
      // Inner
      translate([0,0,-(epsilon/2)])
      cylinder(h = height + epsilon, r = bolt_hole_diameter);
   }
}

// Test code
$fs = 0.15;
bolt_boss_male();
