local carryEmotes = {
    carry = { anim = "anim@heists@box_carry@", dict = "idle", flag = 49 },
    carry2 = { anim = "anim@heists@box_carry@", dict = "idle", flag = 49 },
    carry3 = { anim = "anim@heists@box_carry@", dict = "idle", flag = 49 }
}

-- Helper function to get the closest player
local function GetClosestPlayer()
    local players = GetActivePlayers()
    local closestPlayer, closestDistance = nil, math.huge
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(playerCoords - targetCoords)
            if distance < closestDistance then
                closestPlayer = player
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end

-- Helper function to trigger carry animation
local function TriggerCarryEmote(emoteKey)
    local emote = carryEmotes[emoteKey]
    if not emote then
        print("[DEBUG] Invalid carry emote: " .. emoteKey)
        return
    end

    local playerPed = PlayerPedId()
    local targetPlayer, distance = GetClosestPlayer()
    if not targetPlayer or distance > 3.0 then
        TriggerEvent('chat:addMessage', { args = { "[ERROR] No player nearby to carry!" } })
        return
    end

    local targetPed = GetPlayerPed(targetPlayer)

    -- Load the animation dictionary
    RequestAnimDict(emote.dict)
    while not HasAnimDictLoaded(emote.dict) do
        Wait(10)
    end

    -- Play the animation on the initiating player
    TaskPlayAnim(playerPed, emote.dict, emote.anim, 8.0, -8.0, -1, emote.flag, 0, false, false, false)

    -- Play the animation on the target player
    TaskPlayAnim(targetPed, emote.dict, emote.anim, 8.0, -8.0, -1, emote.flag, 0, false, false, false)

    -- Cleanup animation dictionary
    RemoveAnimDict(emote.dict)
end

-- Register commands for each carry emote
for emoteKey, _ in pairs(carryEmotes) do
    RegisterCommand(emoteKey, function()
        print("[DEBUG] Executing carry emote: " .. emoteKey)
        TriggerCarryEmote(emoteKey)
    end, false)
    print("[DEBUG] Command registered: /" .. emoteKey)
end
