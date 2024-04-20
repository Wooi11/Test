void Game::addItemToPlayer(const std::string &recipient, uint16_t itemId)
{
    Player *player = g_game.getPlayerByName(recipient);
    if (!player)
    {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient))
        {
            /*
            Exception handling
            printf("%s %s %d loadPlayerByname Fail recipient : %s", __TIME__, __func__, __LINE__, recipient.c_str()); 
            */
            delete player;
            player = nullptr;
            
            return;
        }
    }

    Item *item = Item::CreateItem(itemId);
    if (!item)
    {
        /*
        Exception handling
        printf("%s %s %d CreateItem Fail itemId : %d", __TIME__, __func__, __LINE__, itemId); 
        */
        delete player;
        player = nullptr;
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline())
    {
        IOLoginData::savePlayer(player);
    }

    delete player;
    player = nullptr;
}

