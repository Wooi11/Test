function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    if resultId ~= false then
        repeat 
            local guildName = result.getString("name")
            print(guildName)
        until not result.next(resultId)
        result.free() 
    else
        -- no results and exception handling
        print('There are no guilds that meet the criteria.')
    end
end

