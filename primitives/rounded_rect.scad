
module rounded_rect(length = 120, width = 60, thickness = 2, centre = false, radius = 8) {
   assert(2 * radius < width, "Radius must be less than half the width");
   assert(2 * radius < length, "Radius must be less than half the length");

   t = (centre == false) ? [0, 0, 0] : [-length / 2, -width / 2, -thickness / 2];

   ymax = width - radius;
   xmax = length - radius;

   translate(v = t) {
      hull() {
         for (x = [radius, xmax]) {
            for (y = [radius, ymax]) {
               translate(v = [x, y, thickness / 2]) {
                  cylinder(h = thickness, r = radius, center = true);
               }
            }
         }
      }
   }
}

// Test code
//rounded_rect();
