function removePartyMember(playerId, membername)
    player = Player(playerId) -- Under the assumption that player is a global variable, I did not change it to a local variable.
    local party = player:getParty()

    for k,v in pairs(party:getMembers()) do
        if v:getName() == membername then
            party:removeMember(v)
            break
        end
    end
end