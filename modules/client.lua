local Utils = requir('modules.shared')
local xTc = {}

-- Play Emote --
function xTc.Emote(emote)
    if emote == nil then Utils.Debug('Play Emote Error', 'Emote is nil!') return end
    if not exports.scully_emotemenu:playEmoteByCommand(emote) then
        TriggerEvent('animations:client:EmoteCommandStart', {emote})
    end
    Utils.Debug('Play Emote', emote)
end

-- End Emote --
function xTc.EndEmote()
    if not exports.scully_emotemenu:cancelEmote() then
        TriggerEvent('animations:client:EmoteCommandStart', {'c'})
    end
    Utils.Debug('End Emote')
end

return xTc