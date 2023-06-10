Config = {}

-- Debug Configs --
Config.Debug = true
Config.DebugPoly = false

Config.RequiredItem = 'trojan_usb' -- Item Required to Access Locations

-- Forgery Config --
-- Set Types (Displayed in Menu)
-- Set Locations (Circle Zones | vec3 & radius)

-- Price | Price to forge
-- ForgeTime | Length to forge (In Seconds)
-- Item | Item you receive
Config.Forgery = {
    Types = {
        ['ID'] = {
            Price = 1000,
            ForgeTime = 5,
            Item = 'forged_id',
        },

        ['Drivers License'] = {
            Price = 1000,
            ForgeTime = 5,
            Item = 'forged_driverslicense',
            Extras = {
                'CLASS A DRIVER LICENSE',
                'CLASS B DRIVER LICENSE',
                'CLASS C DRIVER LICENSE',
                'CLASS E DRIVER LICENSE',
                'CLASS D DRIVER LICENSE',
            }
        },

        ['Weapons License'] = {
            Price = 1000,
            ForgeTime = 5,
            Item = 'forged_weaponslicense',
            Extras = {
                'CLASS 1 WEAPONS LICENSE',
                'CLASS 2 WEAPONS LICENSE',
                'CLASS 3 WEAPONS LICENSE',
            }
        },
    },
    Locations = {
        { coords = vec3(707.32, -967.59, 30.41), radius = 0.3 }
    }
}