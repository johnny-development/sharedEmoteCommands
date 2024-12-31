print("[DEBUG] Initializing Shared Emote Commands script...")

local sharedEmotes = {
    carry = "nearby carry",    
    carry2 = "nearby carry2",  
    carry3 = "nearby carry3",   
    piggyback = "nearby piggyback"
}

local function triggerSharedEmote(emoteCommand)
    print("[DEBUG] triggerSharedEmote called with command: " .. emoteCommand)

    ExecuteCommand(emoteCommand)
end

for command, emoteCommand in pairs(sharedEmotes) do
    RegisterCommand(command, function(source, args, rawCommand)
        print("[DEBUG] Command executed: /" .. command)
        triggerSharedEmote(emoteCommand)
    end, false)
    print("[DEBUG] Command registered: /" .. command .. " -> Executes: " .. emoteCommand)
end

AddEventHandler("onResourceStart", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print("[DEBUG] Shared Emote Commands script loaded successfully.")
        print("[DEBUG] Configured commands:")
        for command, emoteCommand in pairs(sharedEmotes) do
            print(string.format("[DEBUG] /%s -> Executes: %s", command, emoteCommand))
        end
    end
end)


-- Need any support, scripts, liverys or anything join our discord! https://discord.gg/gxcZgsghzn

-- ██████╗ ██╗███╗   ██╗ ██████╗  ██████╗ 
--██╔══██╗██║████╗  ██║██╔════╝ ██╔═══██╗
--██║  ██║██║██╔██╗ ██║██║  ███╗██║   ██║
--██║  ██║██║██║╚██╗██║██║   ██║██║   ██║
--██████╔╝██║██║ ╚████║╚██████╔╝╚██████╔╝
--╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ 
-- ██████╗ ███████╗██╗   ██╗███████╗██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗
-- ██╔══██╗██╔════╝██║   ██║██╔════╝██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
-- ██║  ██║█████╗  ██║   ██║█████╗  ██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║   
-- ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   
-- ██████╔╝███████╗ ╚████╔╝ ███████╗██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   
-- ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   