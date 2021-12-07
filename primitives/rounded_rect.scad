
module rounded_rect(length = 120, width = 60, thickness = 2, centre = false, corner_radius = 8) {
   assert(2 * corner_radius < width, "Radius must be less than half the width");
   assert(2 * corner_radius < length, "Radius must be less than half the length");

   t = (centre == false) ? [0, 0, 0] : [-length / 2, -width / 2, -thickness / 2];

   ymax = width - corner_radius;
   xmax = length - corner_radius;

   translate(v = t) {
      hull() {
         for (x = [corner_radius, xmax]) {
            for (y = [corner_radius, ymax]) {
               translate(v = [x, y, thickness / 2]) {
                  cylinder(h = thickness, r = corner_radius, center = true);
               }
            }
         }
      }
   }
}

// Test code
rounded_rect();
