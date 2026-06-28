local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

while not LocalPlayer do
    task.wait()
    LocalPlayer = Players.LocalPlayer
end

local SpecialUsers = {
    ["poizy1221"] = true,
    ["ren_x55"] = true,
}

if SpecialUsers[LocalPlayer.Name] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHubNewUi.lua"))();
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHubOldUi.lua"))();
end
