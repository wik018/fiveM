neonZone = CircleZone:Create(vector3(337.77, -207.51, 54.09), 1.91, {
    name = "circle",
    useZ = false,
    debugPoly = true
})

secondZone = CircleZone:Create(vector3(190.13, -1008.99, 29.31), 1.91, {
    name = "circle",
    useZ = false,
    debugPoly = true
})

thirdZone = CircleZone:Create(vector3(-166.35, -1123.69, 23.42), 1.91, {
    name = "circle",
    useZ = false,
    debugPoly = true
})


secNeonZone = CircleZone:Create(vector3(337.28, -210.31, 54.09), 1.91, {
    name = "circle",
    useZ = false,
    debugPoly = true
})

parking = CircleZone:Create(vector3(191.22, -1017.11, 29.25), 1.91, {
    name = "circle",
    useZ = false,
    debugPoly = true
})


---@param isPointInside boolean
---@param point vector3
parking:onPlayerInOut(function(isPointInside, point)
    Parked = isPointInside
end)


---@param isPointInside boolean
---@param point vector3
neonZone:onPlayerInOut(function(isPointInside, point)
    InsideZoneNeon = isPointInside
end)

---@param isPointInside boolean
---@param point vector3
secondZone:onPlayerInOut(function(isPointInside, point)
    InsideFirstZone = isPointInside
end)

---@param isPointInside boolean
---@param point vector3
thirdZone:onPlayerInOut(function(isPointInside, point)
    InsideSecZone = isPointInside
end)

---@param isPointInside boolean
---@param point vector3
secNeonZone:onPlayerInOut(function(isPointInside, point)
    InsideNeonZone2 = isPointInside
end)
