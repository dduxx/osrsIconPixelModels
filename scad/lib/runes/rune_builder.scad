include <../../../dependencies/dduxx:twoPointFiveD:v0.1.1/scad/two_point_five_d.scad>

module rune_icon(rune_name, pixel_size = 3) {
    file_path = str("../../../fixtures/runes/", rune_name, ".json");
    rune_object = import(file_path);


    two_point_five_d(
        image_array = rune_object["image"],
        height_map = rune_object["height_map"],
        pixel_size = pixel_size,
        center = true
    );
}
