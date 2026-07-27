include <../../../dependencies/dduxx:twoPointFiveD:v0.1.1/scad/two_point_five_d.scad>

SKILL_ICON_SECTION_SIZE = 32;

module skill_icon(skill_name, pixel_size = 3, has_plaque = false, has_max_level = false) {
    x_trans = has_max_level ? pixel_size * SKILL_ICON_SECTION_SIZE / 2: 0;
    z_trans = has_plaque ? pixel_size * 2 : 0;

    translate([-x_trans, 0, z_trans]) {
        _skill_icon(skill_name, pixel_size);
    }

    if (has_max_level) {
        translate([x_trans, 0,z_trans]) {
            _max_level(pixel_size);
        }
    }

    if (has_plaque) {
        plaque_x = has_max_level ? SKILL_ICON_SECTION_SIZE * 2 : SKILL_ICON_SECTION_SIZE;
        plaque_y = SKILL_ICON_SECTION_SIZE;

        _skill_plaque(size = [plaque_x, plaque_y], pixel_size = pixel_size, step = 1);
    }

}

module _skill_icon(skill_name, pixel_size) {
    file_path = str("../../../fixtures/skills/", skill_name, ".json");
    icon_object = import(file_path);

    two_point_five_d(
        image_array = icon_object["image"],
        height_map = icon_object["height_map"],
        pixel_size = pixel_size,
        center = true,
    );
}

module _skill_plaque(size, pixel_size, step = 1) {
    x_trans = size[0] * pixel_size / 2;
    y_trans = size[1] * pixel_size / 2;

    color("grey") {
        translate([-x_trans, -y_trans, 0]) {
            _plaque_part(size, pixel_size);
            translate([pixel_size, pixel_size, pixel_size]) {
                sub_x = size[0] - (2 * step);
                sub_y = size[1] - (2 * step);
                _plaque_part([sub_x, sub_y], pixel_size);
            }
        }
    }
}

module _plaque_part(size, pixel_size) {
    x = size[0] * pixel_size;
    y = size[1] * pixel_size;

    difference() {
        cube([x, y, pixel_size]);

        for (i = [0 : 1]) {
            x_trans = i % 2 == 0 ? 0 : x - pixel_size;
            for (j = [0 : 1]) {
                y_trans = j % 2 == 0 ? 0 : y - pixel_size;
                translate([x_trans, y_trans, 0]) {
                    cube(pixel_size);
                }
            }
        }
    }
}

module _nine(pixel_size) {
    translate([- 5 / 2 * pixel_size, - 9 / 2 * pixel_size, 0]) {
        color("yellow") {
            translate([4 * pixel_size, 0, 0]) {
                cube([pixel_size, pixel_size * 8, pixel_size]);
            }
            translate([pixel_size * 1, pixel_size * 8, 0]) {
                cube([pixel_size * 3, pixel_size, pixel_size]);
            }
            translate([0, pixel_size * 6, 0]) {
                cube([pixel_size, pixel_size * 2, pixel_size]);
            }
            translate([pixel_size, pixel_size * 5, 0]) {
                cube([pixel_size, pixel_size, pixel_size]);
            }
            translate([pixel_size * 2, pixel_size * 4, 0]) {
                cube([pixel_size * 2, pixel_size, pixel_size]);
            }
        }
    }
}

module _slash(pixel_size) {
    color("black") {
        translate([-19 / 2 * pixel_size, -19 / 2 * pixel_size, 0]) {
            cube(pixel_size);
            translate([pixel_size, 0, 0]) {
                for (i = [0 : 17]) {
                    translate([i * pixel_size, i * pixel_size, 0]) {
                        cube([pixel_size, 2 * pixel_size, pixel_size]);
                    }
                }
            }
        }
    }
}

module _max_level(pixel_size) {
    translate([-5 * pixel_size, 5 * pixel_size, 0]) {
        _nine(pixel_size);
    }
    translate([-11 * pixel_size, 5 * pixel_size, 0]) {
        _nine(pixel_size);
    }
    _slash(pixel_size);
    translate([5 * pixel_size, -5 * pixel_size, 0]) {
        _nine(pixel_size);
    }
    translate([11 * pixel_size, -5 * pixel_size, 0]) {
        _nine(pixel_size);
    }
}
