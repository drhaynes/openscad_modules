module rounded_cube(size = 10, center = false, radius = 0.5, apply_to = "all") {
   // If size is passed as a number, treat it as an [x, y, z] vector
   size = (size[0] == undef) ? [size, size, size] : size;

   translate_min = radius;
   translate_xmax = size[0] - radius;
   translate_ymax = size[1] - radius;
   translate_zmax = size[2] - radius;

   t = (center == false) ? [0, 0, 0] : [- (size[0] / 2), - (size[1] / 2), - (size[2] / 2)];

   translate(v = t) {
      hull() {
         for (translate_x = [translate_min, translate_xmax]) {
            x_at = (translate_x == translate_min) ? "min" : "max";
            for (translate_y = [translate_min, translate_ymax]) {
               y_at = (translate_y == translate_min) ? "min" : "max";
               for (translate_z = [translate_min, translate_zmax]) {
                  z_at = (translate_z == translate_min) ? "min" : "max";

                  translate(v = [translate_x, translate_y, translate_z])
                     if (
                     (apply_to == "all") ||
                     (apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
                     (apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
                     (apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
                     ) {
                        sphere(r = radius);
                     } else {
                        rotate =
                           (apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
                           (apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
                                   [0, 0, 0]
                        );
                        rotate(a = rotate)
                           cylinder(h = radius * 2, r = radius, center = true);
                     }
               }
            }
         }
      }
   }
}

// Test code
//$fs = 0.15;
//rounded_cube();