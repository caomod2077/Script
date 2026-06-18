--[[
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local function runRemoteScript(url, chunkName)
    if type(url) ~= "string" or url == "" then
        return false
    end

    if type(request) ~= "function" then
        warn("[Foxname Loader] request is not available")
        return false
    end

    local okResponse, response = pcall(function()
        return request({
            Url = url,
            Method = "GET",
        })
    end)

    if not okResponse or type(response) ~= "table" then
        warn("[Foxname Loader] request failed:", url)
        return false
    end

    local body = response.Body
    if type(body) ~= "string" or body == "" then
        warn("[Foxname Loader] empty response:", url)
        return false
    end

    local chunk, loadError = loadstring(body, chunkName or url)
    if not chunk then
        warn("[Foxname Loader] loadstring failed:", tostring(loadError))
        return false
    end

    local okRun, runError = pcall(chunk)
    if not okRun then
        warn("[Foxname Loader] runtime error:", tostring(runError))
        return false
    end

    return true
end

local placeScripts = {
    [79546208627805] = function()
        task.spawn(runRemoteScript, "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua", "FoxnameHub")
    end,

    [126509999114328] = function()
        task.spawn(runRemoteScript, "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua", "FoxnameHub")
    end,

    [116495829188952] = function()
        task.spawn(runRemoteScript, "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname-Dr.lua", "FoxnameDeadRails")
    end,

    [70876832253163] = function()
        task.spawn(runRemoteScript, "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname-Dr.lua", "FoxnameDeadRails")
    end,

    [114204398207377] = function()
        task.spawn(runRemoteScript, "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname_SZA.lua", "FoxnameSZA")
    end,

    [98927955463992] = function()
        task.spawn(runRemoteScript, "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname_SZA.lua", "FoxnameSZA")
    end,

    [8737602449] = function()
        task.spawn(runRemoteScript, "https://raw.githubusercontent.com/xv3gasx/Pls-Donate/refs/heads/main/AutoFarm.lua", "PlsDonate")
    end,

    [142823291] = function()
        task.spawn(runRemoteScript, "https://raw.githubusercontent.com/xv3gasx/Murder-Mystery-2/refs/heads/main/Release.lua", "MurderMystery2")
    end,

    [621129760] = function()
        task.spawn(runRemoteScript, "https://raw.githubusercontent.com/xv3gasx/KAT/refs/heads/main/main.lua", "KAT")
    end,

    [12137249458] = function()
        task.spawn(runRemoteScript, "https://raw.githubusercontent.com/xv3gasx/Gun-Grounds-FFA/refs/heads/main/main.lua", "GGF")
    end,
}

local runScript = placeScripts[game.PlaceId]
if runScript then
    runScript()
end
]]

local TeleportService = game:GetService("TeleportService")
local player = game:GetService("Players").LocalPlayer
local placeScripts = {
    -- Pls Donate 
    [8737602449] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/Pls-Donate/refs/heads/main/AutoFarm.lua"))()
        end)
    end,

    -- KAT
    [621129760] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/KAT/refs/heads/main/main.lua"))()
        end)
    end,
    
    -- Build A Ring Farm
    [] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn_BARF.lua"))()
        end)
    end,    
    
    -- Murder Mystery 2
    [] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/Murder-Mystery-2/refs/heads/main/Release.lua"))()
        end)
    end,

    -- Gun Grounds FFA
    [12137249458] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/Gun-Grounds-FFA/refs/heads/main/main.lua"))()
        end)
    end,

    -- Survive Zombie Arena (lobby)
    [114204398207377] = function()
        task.spawn(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname_SZA.lua"))()
        end)
    end,

    -- Survive Zombie Arena (arena)
    [98927955463992] = function()
        task.spawn(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname_SZA.lua"))()
        end)
        task.spawn(function()
            loadstring(game:HttpGet("https://afkar.lol/script/godmode"))()
        end)
    end,

    -- 99 Nights In The Forest (Lobby)
    [79546208627805] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))();
        end)
    end,

    -- 99 Nights In The Forest (Game)
    [126509999114328] = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))();
        end)
    end,

    -- Dead Rails (Lobby)
    [116495829188952] = function()
        task.spawn(function()
            task.wait(3)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname-Dr.lua"))()
        end)
    end,

    -- Dead Rails (Game)
    [70876832253163] = function()
        task.spawn(function()
            task.wait(5)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Foxname-Dr.lua"))()
        end)
    end,

    -- Grow a Garden 2
    [97598239454123] = function()
        task.wait(5)
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
        end)
    end,

    -- Grow a Garden 2 different place id
    [97598239454123] = function()
        task.wait(5)
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
        end)
    end,
}

local runScript = placeScripts[game.PlaceId]
if runScript then
    runScript()
end
