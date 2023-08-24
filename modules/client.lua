local Utils = require('modules.shared')
local scully = GetResourceState('scully_emotemenu')
local rpemotes = GetResourceState('rpemotes')
local xTc = {}

-- Play Emote --
function xTc.Emote(emote)
    if scully == 'started' or scully == 'starting' then
        exports.scully_emotemenu:playEmoteByCommand(emote)
    end
    if rpemotes == 'started' or rpemotes == 'starting' then
        TriggerEvent('animations:client:EmoteCommandStart', {emote})
    end
end

-- End Emote --
function xTc.EndEmote()
    if scully == 'started' or scully == 'starting' then
        exports.scully_emotemenu:cancelEmote()
    end
    if rpemotes == 'started' or rpemotes == 'starting' then
        TriggerEvent('animations:client:EmoteCommandStart', {'c'})
    end
end

return xTc