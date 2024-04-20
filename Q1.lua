local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end

function onLogout(player)
    -- I've made the change to perform the action only when the storage value is not -1.
    if player:getStorageValue(1000) ~= -1 then
        addEvent(releaseStorage, 1000, player)
    end

    return true    
end
