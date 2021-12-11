module speaker_grill_round(radius = 20,
                           aperture_radius = 1.5,
                           aperture_spacing = 4,
                           depth = 2) {
   holes_per_row = (2 * radius) / 3;
   half_aperture_spacing = aperture_spacing / 2;
   intersection() {
      for (x = [0:1:holes_per_row + 1]) {
         for (y = [0:1:(holes_per_row * 1.25) + 1]) {
            spacing_offset = (y % 2 == 0) ? half_aperture_spacing : 0;
            translate([(x * aperture_spacing) - radius - spacing_offset,
                       (y * aperture_spacing * 0.8) - radius,
                        0]) {
               cylinder(h = depth, r = aperture_radius);
            }
         }
      }
      cylinder(h = depth, r = radius);
   }
}

// Test code
$fs = 0.15;
speaker_grill_round();
