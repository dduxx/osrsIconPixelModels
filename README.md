# osrsIconPixelModels

3D-printable pixel-art models of Old School RuneScape skill icons, rune icons, and capes, generated with OpenSCAD.

## Structure

- `fixtures/skills/` - JSON files containing per-skill pixel grids and height maps
- `fixtures/runes/` - JSON files containing per-rune pixel grids and height maps
- `fixtures/capes/` - JSON files containing per-cape pixel grids and height maps
- `scad/assemblies/skills/skill_icon.scad` - assembly for skill icons
- `scad/assemblies/runes/rune_icon.scad` - assembly for rune icons
- `scad/assemblies/capes/cape_icon.scad` - assembly for cape icons
- `scad/lib/skills/skill_builder.scad` - transforms skill pixel data into 3D geometry
- `scad/lib/runes/rune_builder.scad` - transforms rune pixel data into 3D geometry
- `scad/lib/capes/cape_builder.scad` - transforms cape pixel data into 3D geometry
- Uses [twoPointFiveD](https://github.com/dduxx/twoPointFiveD) for 2D-to-3D extrusion

## Icon Variants

Each skill icon can be rendered in three variants:

| Variant | `HAS_PLAQUE` | `HAS_MAX_LEVEL` |
|---------|:---:|:---:|
| Icon only | `false` | `false` |
| Icon + plaque | `true` | `false` |
| Icon + plaque + 99/99 | `true` | `true` |

Rune and cape icons have a single variant - the rune or cape symbol itself.

## How the Icons Were Generated

**Skill icons** - The original image was dumped to JSON as a 2D array where each value is the hex color of the corresponding pixel. Pixels with a transparent alpha value were skipped (set to `null`).

**Rune and cape icons** - The same process was used, with an additional quantization step to reduce the number of distinct colors. This keeps the `height_map` compact without losing much of the actual color detail. All icons cap at 12 distinct colors.

## Using the Generator

1. Pull dependencies with buildscad:
   ```
   buildscad pull
   ```
2. Open the relevant assembly in OpenSCAD:
   - `scad/assemblies/skills/skill_icon.scad`
   - `scad/assemblies/runes/rune_icon.scad`
   - `scad/assemblies/capes/cape_icon.scad`
3. Use the OpenSCAD Customizer to adjust options:
   - **Skill icons** - `SKILL`, `PIXEL_SIZE`, `HAS_PLAQUE`, `HAS_MAX_LEVEL`
   - **Rune icons** - `RUNE`, `PIXEL_SIZE`
   - **Cape icons** - `CAPE`, `PIXEL_SIZE`

## Building

Uses [buildscad](https://github.com/dduxx/buildscad). Run from the project root:

```
buildscad build
```

Outputs STL (for 3D printing) and PNG (for preview) to the `build/` directory.

This requires [OpenSCAD](https://openscad.org/) (nightly) to be installed.

## How to Contribute

- If you would like different height mappings, submit a pull request adjusting the `height_map` in the relevant JSON file under `fixtures/skills/`, `fixtures/runes/`, or `fixtures/capes/`.
- If you want to add new features or make changes to the code, pull requests are welcome.

## Planned Features

- Magnetic Stand for Capes
