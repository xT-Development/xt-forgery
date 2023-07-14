local xT = require('modules.client')

-- View Forgery Menu --
RegisterNetEvent('xt-forgery:client:ForgeryMenu', function(LOCID)
    local ForgeryMenu = {}

    for x, t in pairs(Config.Forgery.Types) do
        ForgeryMenu[#ForgeryMenu+1] = {
            title = x,
            description = 'Forge a '..x,
            icon = '',
            onSelect = function()
                local HasFunds = lib.callback.await('xt-forgery:server:HasFunds', false, x)
                if not HasFunds then return end
                local ForgeryMenuInput = {
                    { type = 'input',   label = 'First Name',       required = true },
                    { type = 'input',   label = 'Last Name',        required = true },
                    { type = 'input',   label = 'Nationality',      required = true },
                    { type = 'date',    label = 'Date of Birth',    required = true, icon = { 'far', 'calendar' }, default = false, format = "DD/MM/YYYY" }
                }

                if t.Extras ~= nil then
                    local Selections = {}
                    for x = 1, #t.Extras do
                        Selections[#Selections+1] = { value = t.Extras[x], label = t.Extras[x] }
                    end
                    ForgeryMenuInput[#ForgeryMenuInput+1] = { type = 'select', label = 'Extras', options = Selections }
                end

                local ForgeryInput = lib.inputDialog(x..' Forgery Info', ForgeryMenuInput)
                if not ForgeryInput then TriggerEvent('xt-forgery:client:ForgeryMenu', LOCID) return end

                local ForgeTime = (t.ForgeTime * 1000)
                xT.Emote('type3')
                QBCore.Functions.Progressbar('forgery', 'Forging a '..x, ForgeTime, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    xT.EndEmote()
                    TriggerServerEvent('xt-forgery:server:Forgery', x, LOCID, ForgeryInput)
                end, function()
                    xT.EndEmote()
                    QBCore.Functions.Notify('Cancelled...', 'error')
                end)
            end
        }
    end

    lib.registerContext({
        id = 'forgery_menu',
        title = 'Forgery',
        options = ForgeryMenu
    })
    lib.showContext('forgery_menu')
end)

-- Show Forgery When Used --
RegisterNetEvent('xt-forgery:client:ShowForgery', function(TYPE, METADATA)
    local Extra = ''
    local ForgeryHeader = '**'..TYPE..'**'
    if METADATA.extra ~= nil then
        Extra = METADATA.extra
        ForgeryHeader = '**'..Extra..'**'
    end

    local ShowForgery = lib.alertDialog({
        header = ForgeryHeader,
        content =
            '**First Name:** '..METADATA.firstname..'  \n'..
            '**Last Name:** '..METADATA.lastname..'  \n'..
            '**Nationality:** '..METADATA.nationality..'  \n'..
            '**Date of Birth:** '..METADATA.dob,
        centered = true,
        size = 'xs',
        cancel = false,
        labels = { confirm = 'Close' }
    })
end)