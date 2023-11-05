RegisterCommand('+spawnNeon', function(source, args, rawCommand)
    local myPos = GetEntityCoords(PlayerPedId()) -- Get player position
    local distToTake = #(myPos - TakePoint)      -- Calculate distance between player and take point
    local distToReturn = #(myPos - SpawnPoint3)  -- Calculate distance between player and return point

    if distToTake < 1.0 then                     -- Check if player is close enough
        SpawnNeon()
        SetNewWaypoint(loc.x, loc.y)             -- Trigger server event
    end

    if distToReturn < 1.0 and IsPedInAnyVehicle(PlayerPedId(), false) then                                  -- Check if player is close enough and in a vehicle
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)                                                 -- Get vehicle player is in

        if GetPedInVehicleSeat(veh, -1) == PlayerPedId() and GetEntityModel(veh) == GetHashKey('neon') then -- Check if player is driver of a neon
            QBCore.Functions.TriggerCallback('resource:server:borgTerug', function(returnValue)
                if returnValue then
                    DeleteVehicle(veh)
                end
            end)
        end
    end
end, false)

RegisterCommand('+getQuest', function()
    Subtitles("Je moet deze auto parkeren om een item te krijgen!", 4000)
    Wait(2000)
    SpawnIssi()
end, false)

RegisterCommand('+giveSandwich', function()
    GiveSandwich()
end, false)
