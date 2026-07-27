# osrsIconPixelModels

3D-printable pixel-art models of Old School RuneScape skill icons, generated with OpenSCAD.

## Structure

- `fixtures/skills/` - JSON files containing per-skill pixel grids and height maps
- `scad/assemblies/skills/skill_icon.scad` - main assembly, parameterized per skill and variant
- `scad/lib/skills/skill_builder.scad` - transforms pixel data into 3D geometry via [twoPointFiveD](https://github.com/dduxx/twoPointFiveD)

## Variants

Each skill icon can be rendered in three variants:

| Variant | `HAS_PLAQUE` | `HAS_MAX_LEVEL` |
|---------|:---:|:---:|
| Icon only | `false` | `false` |
| Icon + plaque | `true` | `false` |
| Icon + plaque + 99/99 | `true` | `true` |

## Using the Generator

1. Pull dependencies with buildscad:
   ```
   buildscad pull
   ```
2. Open `scad/assemblies/skills/skill_icon.scad` in OpenSCAD.
3. Use the OpenSCAD Customizer to adjust options:
   - **SKILL** - choose which skill icon to render
   - **PIXEL_SIZE** - size of each pixel in mm
   - **HAS_PLAQUE** - toggle a small plaque beneath the icon
   - **HAS_MAX_LEVEL** - toggle the "99 / 99" max level text next to the icon

## Building

Uses [buildscad](https://github.com/dduxx/buildscad). Run from the project root:

```
buildscad build
```

Outputs STL (for 3D printing) and PNG (for preview) to the `build/` directory.

This requires [OpenSCAD](https://openscad.org/) (nightly) to be installed.

## How to Contribute

- If you would like different height mappings for skill icons, feel free to submit a pull request adjusting the `height_map` in the relevant JSON file under `fixtures/skills/`.
- If you want to add new features or make changes to the code, pull requests are welcome.
