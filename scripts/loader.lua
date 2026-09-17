getgenv().VHSZFU0L2LNV78UT = true

local allowedexecs = {
    "volt", "potassium", "wave", "synapse z", "seliware", 
    "madium", "velocity", "sirhurt", "macsploit", "opiumware", 
    "delta", "codex", "yubx", "real", "cosmic", "5xycutor", "nexomia"
}

local execName = string.lower(typeof(identifyexecutor) == "function" and identifyexecutor() or "")

if not table.find(allowedexecs, execName) then
    game:GetService("Players").LocalPlayer:Kick("[Silicon] Executor not supported.")
end

if getgenv then
    if getgenv().SiliconLoaded then
        game:GetService("Players").LocalPlayer:Kick("[Silicon] Double-execution prevented to stop bugs.")
        return
    else
        getgenv().SiliconLoaded = true
    end
end

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Welcome!",
    Text = "Thanks for choosing Silicon.", 
    Duration = 2 
})

local gameName = ""
local success, info = pcall(function()
    return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
end)

if success and info and info.Name then
    gameName = string.lower(info.Name)
end

if string.find(gameName, "bloxburg") then
    loadstring(game:HttpGet("https://luaprot.net/api/v3/loaders/get/04748181223933471872"))()
elseif string.find(gameName, "greenville") then
    loadstring(game:HttpGet("https://luaprot.net/api/v3/loaders/get/63062373954936644932"))()
elseif string.find(gameName, "rivals") then
    loadstring(game:HttpGet("https://luaprot.net/api/v3/loaders/get/17662111368534554294"))()
elseif string.find(gameName, "matchmaking") then -- rivals matchmaking
    loadstring(game:HttpGet("https://luaprot.net/api/v3/loaders/get/17662111368534554294"))()
elseif string.find(gameName, "rusty plane") then
    loadstring(game:HttpGet("https://luaprot.net/api/v3/loaders/get/30104574395276790080"))()
elseif string.find(gameName, "war tycoon") then
    loadstring(game:HttpGet("https://luaprot.net/api/v3/loaders/get/27716032376549627004"))()
else
    game.Players.LocalPlayer:Kick("[Silicon] You are in a game that we do not support.")
end
