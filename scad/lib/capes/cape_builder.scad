include <../../../dependencies/dduxx:twoPointFiveD:v0.1.1/scad/two_point_five_d.scad>

module cape_icon(cape_name, pixel_size = 3) {
    file_path = str("../../../fixtures/capes/", cape_name, ".json");
    icon_object = import(file_path);

    two_point_five_d(
        image_array = icon_object["image"],
        height_map = icon_object["height_map"],
        pixel_size = pixel_size,
        center = true
    );
}
