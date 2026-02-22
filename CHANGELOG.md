# KOF Training Mode Changelog

## Features & Enhancements

- **Dynamic Paginated Character Layout (`guipages.lua`)**
  - Completely erased 1,800 lines of hardcoded button coordinates.
  - `guipages.lua` now mathematically generates the character layout directly from the `characters` table loaded out of `config.lua`.
  - Characters are automatically paginated: 2 columns (max 28 characters) per screen.
  - Automatically injects **<< Prev Page** and **Next Page >>** buttons when rosters exceed 28 slots.
  - The third column is permanently dedicated strictly to **EX Flags**, **Mode Toggles**, and the **Apply Changes** button, eliminating overlapping menus forever.
- **Pending Changes Indicator (`guipages.lua`, `init.lua`, `config.lua`)**
  - The "Apply Changes" button now actively references an `APPLIED` object stored in `config.lua`.
  - Upon a successful ROM load, `init.lua` synchronizes exactly what mode/character is active.
  - If a user changes a menu toggle (like picking a new opponent) without loading it, the "Apply Changes" button now warns them by turning Light Orange.
- **EX Character Restrictions (`config.lua`, `guipages.lua`, `init.lua`)**
  - Added a `has_ex` boolean flag to all characters across the KOF engines.
  - If a character lacks an EX version (e.g., Goro Daimon), the EX button changes to `---` and does nothing.
  - `init.lua` now double-checks on startup and forces the EX flags to `false` if an invalid EX character is somehow requested.

## Bug Fixes

- **Player 2 Character Defaulting to Iori (`init.lua`)**
  - Fixed a memory address offset miscalculation where `p2_stored_index_location` was pointing to the wrong variable.
  - P2 correctly respects the user's manual selection now instead of overwriting it with Iori (index 28).

## Technical Metrics
- Refactored `guipages.lua` file size from **2,813 lines** down to **1,195 lines**.
- Net change across this update: **+472 insertions, -1,965 deletions**.
