QBCore = exports['qb-core']:GetCoreObject()

TakePoint = vector3(337.77, -207.51, 54.09)
SpawnPoint = vector4(337.28, -210.31, 54.09, 300.49)
SpawnPoint3 = vector3(337.28, -210.31, 54.09)

loc = vector3(190.13, -1008.99, 29.31)

secondLoc = vector3(-166.35, -1123.69, 23.42)

myPos = GetEntityCoords(PlayerPedId()) -- Get player position

SecondLoc = false
ThirdLoc = false

InsideZoneNeon = false
InsideFirstZone = false
InsideSecZone = false
InsideNeonZone2 = false
Parked = false

CreateThread(function()                                  -- We don't want to block the main thread, create a new thread for this loop.
    while true do
        Wait(0)                                          -- Don't crash the game
        if LocalPlayer.state.isLoggedIn then             -- Wait for player to be logged in
            local myPos = GetEntityCoords(PlayerPedId()) -- Get player position
            local distToTake = #(myPos - TakePoint)      -- Calculate distance between player and take point
            local distToReturn = #(myPos - SpawnPoint3)

            if distToTake < 15.0 then -- Check if player is near the take point
                -- Draw marker at take pointl
                DrawMarker(2, TakePoint.x, TakePoint.y, TakePoint.z, 0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 255, false, false, 2, true, nil, nil,
                    false)

                if InsideZoneNeon then -- Only show text if player is close enough
                    DrawText3D(TakePoint.x, TakePoint.y, TakePoint.z, "~g~K~s~ - Pak Neon $1000")
                end
            end

            if distToReturn < 5.0 and IsPedInAnyVehicle(PlayerPedId(), false) then
                DrawMarker(2, SpawnPoint.x, SpawnPoint.y, SpawnPoint.z, 0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 255, false, false, false, true, false, false, false)

                local veh = GetVehiclePedIsIn(PlayerPedId(), false)

                if InsideNeonZone2 and GetPedInVehicleSeat(veh, -1) == PlayerPedId() and GetEntityModel(veh) == GetHashKey('neon') then -- Only show text if player is close enough and driver of a neon
                    DrawText3D(SpawnPoint.x, SpawnPoint.y, SpawnPoint.z, "~g~K~s~ - Neon Inleveren")
                end
            end
        else
            Wait(1000) -- Wait a second if player is not logged in
        end
    end
end)

CreateThread(function()                                  -- We don't want to block the main thread, create a new thread for this loop.
    while true do
        Wait(0)                                          -- Don't crash the game
        if LocalPlayer.state.isLoggedIn then             -- Wait for player to be logged in
            local myPos = GetEntityCoords(PlayerPedId()) -- Get player position
            local distToTake = #(myPos - loc)


            if distToTake < 30.0 then -- Check if player is near the take point
                -- Draw marker at take pointl
                DrawMarker(2, loc.x, loc.y, loc.z, 0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 255, false, false, 2, true, nil, nil,
                    false)
            end

            if InsideFirstZone then
                DrawText3D(loc.x, loc.y, loc.z, "~g~Y~s~ - Krijg quest")
            end
        else
            Wait(1000)
        end
    end
end)

CreateThread(function()                                          -- We don't want to block the main thread, create a new thread for this loop.
    while true do
        Wait(0)                                                  -- Don't crash the game
        if LocalPlayer.state.isLoggedIn then                     -- Wait for player to be logged in
            local myPos = GetEntityCoords(PlayerPedId())
            local parkingSpot = vector3(191.22, -1017.11, 29.25) -- Get player position
            local dist = #(myPos - parkingSpot)
            local car = GetVehiclePedIsIn(PlayerPedId(), false)  -- Calculate distance between player and take point

            if dist < 5.0 then                                   -- Check if player is near the take point
                -- Draw marker at take pointl
                DrawMarker(2, parkingSpot.x, parkingSpot.y, parkingSpot.z, 0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 255, false, false, 2, true, nil, nil,
                    false)
                DrawText3D(parkingSpot.x, parkingSpot.y, parkingSpot.z, "Hier parkeren")
            end

            if Parked and GetPedInVehicleSeat(car, -1) == PlayerPedId() and GetEntityModel(car) == GetHashKey('issi2') then
                DeleteVehicle(car)
                QuestDone = true
                SecondLoc = true
            end

            if QuestDone == true then
                GetSandwich()
                QuestDone = false
            end

            if GetPedInVehicleSeat(car, -1) == PlayerPedId() and GetEntityModel(car) == GetHashKey('neon') and SecondLoc == true then
                SetNewWaypoint(secondLoc.x, secondLoc.y)
            end
        end
    end
end)


CreateThread(function()                                  -- We don't want to block the main thread, create a new thread for this loop.
    while true do
        Wait(0)                                          -- Don't crash the game
        if LocalPlayer.state.isLoggedIn then             -- Wait for player to be logged in
            local myPos = GetEntityCoords(PlayerPedId()) -- Get player position
            local dist = #(myPos - secondLoc)

            if dist < 15.0 then -- Check if player is near the take point
                -- Draw marker at take pointl
                DrawMarker(2, secondLoc.x, secondLoc.y, secondLoc.z, 0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 255, false, false, 2, true, nil, nil,
                    false)
            end

            if InsideSecZone then -- Only show text if player is close enough
                DrawText3D(secondLoc.x, secondLoc.y, secondLoc.z, "~g~1~s~ - Lever broodje in")
                ThirdLoc = true
            end

            local car = GetVehiclePedIsIn(PlayerPedId(), false)
            if GetPedInVehicleSeat(car, -1) == PlayerPedId() and GetEntityModel(car) == GetHashKey('neon') and ThirdLoc == true then
                SetNewWaypoint(TakePoint.x, TakePoint.y)
            end
        else
            Wait(1000)
        end
    end
end)
