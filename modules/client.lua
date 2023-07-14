-- Client Modules --

-- Play Emote --
function XTEmote(emote)
    if emote == nil then XTDebug('Play Emote Error', 'Emote is nil!') return end
    if not exports.scully_emotemenu:playEmoteByCommand(emote) then
        TriggerEvent('animations:client:EmoteCommandStart', {emote})
    end
    XTDebug('Play Emote', emote)
end

-- End Emote --
function XTEndEmote()
    if not exports.scully_emotemenu:cancelEmote() then
        TriggerEvent('animations:client:EmoteCommandStart', {'c'})
    end
    XTDebug('End Emote')
end