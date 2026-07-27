include <../../lib/runes/rune_builder.scad>

// Number of mm per pixel
PIXEL_SIZE = 3;

// Name of the rune
RUNE = "aether"; // ["aether", "air", "astral", "blood", "body", "chaos", "cosmic", "death", "dust", "earth", "fire", "lava", "law", "mind", "mist", "mud", "nature", "smoke", "soul", "steam", "sunfire", "water", "wrath"]

rune_icon(RUNE, PIXEL_SIZE);
