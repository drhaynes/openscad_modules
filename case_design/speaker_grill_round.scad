module speaker_grill_round(radius = 20,
                           aperture_radius = 1.0,
                           aperture_spacing = 3,
                           depth = 2) {
   intersection() {
      for (x = [-radius:aperture_spacing:radius]) {
         for (y = [-radius:aperture_spacing:radius]) {
            translate([x, y, 0]) {
               cylinder(h = depth, r = aperture_radius);
            }
         }
      }
      cylinder(h = depth, r = radius);
   }
}