local allowedExecutors = {
    "Volt",
    "Potassium",
    "Wave",
    "Synapse Z",
    "Seliware",
    "Madium",
    "Velocity",
    "SirHurt",
    "MacSploit",
    "Opiumware",
    "Delta",
    "Codex",
    "YubX",
    "Real"
}

local function checkExecutor()
    if typeof(identifyexecutor) == "function" then
        local currentExecutor = identifyexecutor()
        local isAllowed = false

        for _, name in pairs(allowedExecutors) do
            if string.find(string.lower(currentExecutor), string.lower(name)) then
                isAllowed = true
                break
            end
        end

        if not isAllowed then
            game.Players.LocalPlayer:Kick("Executor not supported.")
        end
    else
        game.Players.LocalPlayer:Kick("Executor not supported.")
    end
end

checkExecutor()

local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer

if getgenv then
    if getgenv().SiliconLoaded then
        player:Kick("Silicon | Why did you execute twice?")
        return
    else
        getgenv().SiliconLoaded = true
    end
end

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Welcome!",
    Text = "Script will load shortly.", 
    Duration = 2 
})

local gameName = ""
local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId)
end)

if success and info and info.Name then
    gameName = string.lower(info.Name)
end

if string.find(gameName, "arsenal") then
    loadstring(game:HttpGet("https://luaprot.net/api/v2/loaders/get/15146390120840345204"))()
elseif string.find(gameName, "driving empire") then
    loadstring(game:HttpGet("https://luaprot.net/api/v2/loaders/get/91443275719301645739"))()
elseif string.find(gameName, "flick") then
    loadstring(game:HttpGet("https://luaprot.net/api/v2/loaders/get/32129975466059922325"))()
elseif string.find(gameName, "greenville") then
    loadstring(game:HttpGet("https://luaprot.net/api/v2/loaders/get/55536199696471763640"))()
elseif string.find(gameName, "grow a garden 2") then
    loadstring(game:HttpGet("https://luaprot.net/api/v2/loaders/get/40632374044555415634"))()
elseif string.find(gameName, "mojave valley") then
    loadstring(game:HttpGet("https://luaprot.net/api/v2/loaders/get/93727550332460870282"))()
elseif string.find(gameName, "sell lemons") then
    loadstring(game:HttpGet("https://luaprot.net/api/v2/loaders/get/22669819141779999346"))()
elseif string.find(gameName, "young street, ontario") or string.find(gameName, "young street") then
    loadstring(game:HttpGet("https://luaprot.net/api/v2/loaders/get/73742509558314565509"))()
else
    game.Players.LocalPlayer:Kick("You are in a game that we do not support!")
end
