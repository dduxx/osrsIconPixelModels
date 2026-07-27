include <../../lib/skills/skill_builder.scad>

// Number of mm per pixel
PIXEL_SIZE = 3;

// Name of the skill
SKILL = "agility"; // ["agility", "attack", "construction", "cooking", "crafting", "defence", "farming", "firemaking", "fishing", "fletching", "herblore", "hitpoints", "hunter", "magic", "mining", "prayer", "ranged", "runecraft", "sailing", "slayer", "smithing", "strength", "thieving", "woodcutting"]

// Generates a small plaque underneath the skill icon
HAS_PLAQUE = false;

// Generates the "max leve" 99 / 99 text beside the icon
HAS_MAX_LEVEL = false;

skill_icon(SKILL, PIXEL_SIZE, HAS_PLAQUE, HAS_MAX_LEVEL);
