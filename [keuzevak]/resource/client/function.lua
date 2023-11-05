function DrawText3D(x, y, z, text) -- Draw text in 3D space
    local onScreen, worldX, worldY = GetScreenCoordFromWorldCoord(x, y, z)
    local camCoords = GetFinalRenderedCamCoord()
    local scale = 200 / (GetGameplayCamFov() * #(camCoords - vector3(x, y, z)))
    if onScreen then
        SetTextScale(1.0, 0.5 * scale)
        SetTextFont(4)
        SetTextColour(255, 255, 255, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextProportional(true)
        SetTextOutline()
        SetTextCentre(true)
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(worldX, worldY)
    end
end

function Subtitles(message, duration)
    BeginTextCommandPrint('STRING')
    AddTextComponentString(message)
    EndTextCommandPrint(duration, true)
end

function SpawnNeon()
    QBCore.Functions.TriggerCallback('resource:server:betaalBorg', function(returnValue)
        if returnValue then
            QBCore.Functions.SpawnVehicle('neon', function(veh)                             -- Spawn vehicle
                exports['LegacyFuel']:SetFuel(veh, 100.0)                                   -- Set fuel to 100%
                TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh)) -- Set vehicle owner
                SetVehicleEngineOn(veh, true, true, false)                                  -- Turn engine on
            end, SpawnPoint, true, true)                                                    -- Spawn vehicle at spawn point and place player inside
        end
    end)
end

function SpawnIssi()
    local spawn = vector4(195.45, -1022.13, 29.33, 221.88)
    QBCore.Functions.SpawnVehicle('issi2', function(veh)                            -- Spawn vehicle
        exports['LegacyFuel']:SetFuel(veh, 100.0)                                   -- Set fuel to 100%
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh)) -- Set vehicle owner
        SetVehicleEngineOn(veh, true, true, false)                                  -- Turn engine on
    end, spawn, true, true)                                                         -- Spawn vehicle at spawn point and place player inside
end

function IsCarInsideZone(car, zoneMin, zoneMax)
    local carPos = GetEntityCoords(car)

    if carPos.x >= zoneMin.x and carPos.x <= zoneMax.x and carPos.y >= zoneMin.y and carPos.y <= zoneMax.y and carPos.z >= zoneMin.z and carPos.z <= zoneMax.z then
        return true
    else
        return false
    end
end

function GetSandwich()
    QBCore.Functions.TriggerCallback('resource:server:getSandwich', function(returnValue)
        if returnValue then
            Subtitles("Stap in je auto om naar volgende locatie te gaan!", 4000)
        end
    end)
end

function GiveSandwich()
    QBCore.Functions.TriggerCallback('resource:server:giveSandwich', function(returnValue)
        if returnValue then
            Subtitles("Stap in je auto om neon te inleveren", 4000)
        end
    end)
end
