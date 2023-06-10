# xt-forgery
![xTAd](https://user-images.githubusercontent.com/101474430/233859688-2b3b9ecc-41c8-41a6-b2e3-a9f1aad473ee.gif)

# Features:
- Create forged licenses
- Add any license to the config
- Add extra input options for eac license
- Useable forged license items (shows info to players nearby)

# Preview:
https://www.youtube.com/watch?v=tlg6rMOwYqs

# Dependencies:
- qb-core
- ox_lib
- ox_inventory
- ox_target

# Installation:
- Add items to ox_inventory > data > items.lua
```lua
	["forged_id"] = {
		label = "ID Card",
		weight = 0,
		stack = false,
		close = true,
		description = "A card containing citizen info",
		client = {
			image = "id_card.png",
		}
	},

	["forged_driverslicense"] = {
		label = "ID Card",
		weight = 0,
		stack = false,
		close = true,
		description = "A license allowing a citizen to operate a vehicle.",
		client = {
			image = "driver_license.png",
		}
	},

	["forged_weaponslicense"] = {
		label = "weapons License",
		weight = 0,
		stack = false,
		close = true,
		description = "A license allowing a citizen to carry firearms",
		client = {
			image = "weapon_license.png",
		}
	},
```
- Add any extra licenses you want to the config
- Enjoy!
