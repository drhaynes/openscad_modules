
// Creates a grid of cylinders for cutting out a matrix of holes (e.g. for pushbuttons)
module hole_grid(holes = 10,             // how many holes?
                 rows = 2,               // number of rows the buttons should be arranged in.
                 hole_radius = 5.5,      // Set this to the exact radius (e.g. of pressable part of buttons).
                 hole_spacing = 17.5,    // centre-to-centre distance of buttons (17.5 is std for pcb buttons).
                 height = 3) {        // how tall should the cylinders for the hole be?
   nudge = 0.75; // to ensure buttons fit in holes
   adjusted_hole_radius = hole_radius + nudge;
   epsilon = 0.001; // to ensure CSG subtraction works ok

   hole_diameter = 2 * adjusted_hole_radius;
   hole_count_per_row = holes / rows;
   column_space_count = hole_count_per_row - 1;

   row_space_count = rows - 1;
   row_width = hole_spacing;

   difference() {
      // Move to first hole position
      translate([adjusted_hole_radius, adjusted_hole_radius, - epsilon]) {
         for (row = [0:1:rows - 1]) {
            // Calculate row position
            translate([0, (row * row_width), 0]) {
               for (hole = [0:1:hole_count_per_row - 1]) {
                  // Calculate hole position
                  translate([(hole_spacing * hole), 0, 0]) {
                     cylinder(h = height, r = adjusted_hole_radius, center = true);
                  }
               }
            }
         }
      }
   }
}
