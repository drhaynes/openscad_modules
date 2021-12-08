module speaker_grill_round(radius = 20,
                           aperture_radius = 1.0,
                           aperture_spacing = 3,
                           depth = 2) {
   holes_per_row = (2 * radius) / 3;
   intersection() {
      count = 0;
      for (x = [0:1:holes_per_row + 1]) {
         for (y = [0:1:holes_per_row + 1]) {
            spacing_offset = (y % 2 == 0) ? aperture_spacing / 2 : 0;
            translate([(x * aperture_spacing) - radius - spacing_offset, (y * aperture_spacing)- radius, 0]) {
               cylinder(h = depth, r = aperture_radius);
               count = count + 1;
            }
         }
      }
      cylinder(h = depth, r = radius);
   }
}

// Test code
$fs = 0.15;
speaker_grill_round();
