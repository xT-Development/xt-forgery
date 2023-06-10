-- Create Forgery --
RegisterNetEvent('xt-forgery:server:Forgery', function(TYPE, LOCID, INFO)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local LocCoords = Config.Forgery.Locations[LOCID].coords
    local PCoords = GetEntityCoords(GetPlayerPed(src))
    local dist = #(PCoords - vector3(LocCoords.x, LocCoords.y, LocCoords.z))
    if dist > 5 then return end

    local Price = Config.Forgery.Types[TYPE].Price
    local Item = Config.Forgery.Types[TYPE].Item

    if Player.Functions.RemoveMoney('cash', Price) then
        local ForgeryInfo = {}
        ForgeryInfo.citizenid = Player.PlayerData.citizenid
        ForgeryInfo.firstname = INFO[1]
        ForgeryInfo.lastname = INFO[2]
        ForgeryInfo.nationality = INFO[3]
        ForgeryInfo.dob = INFO[4]
        if INFO[5] ~= nil then ForgeryInfo.extra = INFO[5] end

        if exports.ox_inventory:AddItem(src, Item, 1, ForgeryInfo) then
            QBCore.Functions.Notify(src, 'You received 1x '..TYPE..'!', 'success')
            return
        end
    end
end)

-- Check if Player has Enough Cash --
lib.callback.register('xt-forgery:server:HasFunds', function(source, TYPE)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local callback = false
    if not Player then return callback end

    local PlayerCash = Player.Functions.GetMoney('cash')
    local Price = Config.Forgery.Types[TYPE].Price
    if PlayerCash >= Price then
        callback = true
    else
        QBCore.Functions.Notify(src, 'You don\'t have enough cash!', 'error')
    end

    return callback
end)

-- Make Items Useable --
for x, t in pairs(Config.Forgery.Types) do
    QBCore.Functions.CreateUseableItem(t.Item, function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player.Functions.GetItemByName(t.Item) then return end

        local playerPed = GetPlayerPed(source)
        local playerCoords = GetEntityCoords(playerPed)
        local players = QBCore.Functions.GetPlayers()
        for _, v in pairs(players) do
            local targetPed = GetPlayerPed(v)
            local dist = #(playerCoords - GetEntityCoords(targetPed))
            if dist < 3.0 then
                item.metadata.dob = os.date("%x", (item.metadata.dob / 1000))
                TriggerClientEvent('xt-forgery:client:ShowForgery', v, x, item.metadata)
            end
        end
    end)
end