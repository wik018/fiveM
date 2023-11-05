QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('resource:server:betaalBorg', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

    if Player then
        if Player.Functions.RemoveMoney('cash', 1000, 'neon-borg') then -- Remove money from player
            TriggerClientEvent('QBCore:Notify', source, 'Je hebt de borg betaald', 'success')
            cb(true)
        else
            TriggerClientEvent('QBCore:Notify', source, 'De borg bedraagt $1000. Je hebt niet genoeg geld bij je',
                'error')
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('resource:server:borgTerug', function(source, cb)
    local player = QBCore.Functions.GetPlayer(source)
    if player then
        player.Functions.AddMoney('cash', 1000, 'Borg')
        TriggerClientEvent('QBCore:Notify', source, 'Je hebt de borg teruggekregen', 'success')
        cb(true)
    end
end)

QBCore.Functions.CreateCallback('resource:server:getSandwich', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

    Player.Functions.AddItem('sandwich', 1, nil, nil)
    TriggerClientEvent('QBCore:Notify', source, 'Je hebt een broodje gekregen!', 'success')
    cb(true)
end)

QBCore.Functions.CreateCallback('resource:server:giveSandwich', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Player.Functions.GetItemByName('sandwich')
    local rem = Player.Functions.RemoveItem('sandwich', 1, item.slot)
    if rem then
        Player.Functions.AddMoney('cash', 1000, 'prize')
        TriggerClientEvent('QBCore:Notify', source, 'Je hebt een broodje gegeven!', 'success')
        cb(rem)
    end
end)
