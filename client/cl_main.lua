local ForgeryZones = {}

-- Setup --
local function CreateForgery()
    for x = 1, #Config.Forgery.Locations do
        local Loc = Config.Forgery.Locations[x]
        ForgeryZones[x] = exports.ox_target:addSphereZone({
            coords = Loc.coords,
            radius = Loc.radius,
            debug = Config.DebugPoly,
            options = {
                {
                    icon = 'fas fa-laptop-code',
                    label = 'Forgery',
                    items = Config.RequiredItem,
                    onSelect = function()
                        TriggerEvent('xt-forgery:client:ForgeryMenu', x)
                    end,
                }
            }
        })
    end
end

-- Cleanup --
local function CleanupForgery()
    for x = 1, #ForgeryZones do
        exports.ox_target:removeZone(ForgeryZones[x])
    end
end

AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then CreateForgery() end end)
AddEventHandler('onResourceStop', function(resource) if resource == GetCurrentResourceName() then CleanupForgery() end end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() CreateForgery() end)
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function() CleanupForgery() end)
