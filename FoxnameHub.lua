local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local Clipboard = setclipboard or toclipboard

local a = Instance.new("ScreenGui")
a.Name = "inkgameskibidi"
a.Parent = game.CoreGui

local b = Instance.new("Frame", a)
b.Size = UDim2.new(0, 300, 0, 150)
b.Position = UDim2.new(0.5, -150, 0.5, -75)
b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
b.BorderSizePixel = 0
b.Active = true
b.Draggable = true

local corner = Instance.new("UICorner", b)
corner.CornerRadius = UDim.new(0, 8)

local stroke = Instance.new("UIStroke", b)
stroke.Thickness = 1.5
stroke.Color = Color3.fromRGB(255, 80, 80)

local title = Instance.new("TextLabel", b)
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "Notification"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextStrokeTransparency = 0.6

local desc = Instance.new("TextLabel", b)
desc.Size = UDim2.new(1, -20, 0, 40)
desc.Position = UDim2.new(0, 10, 0, 40)
desc.BackgroundTransparency = 1
desc.Text = "Shutdown script for maintenance and bug fixes.\nJoin Discord to receive updates as needed "
desc.TextColor3 = Color3.fromRGB(200, 200, 200)
desc.Font = Enum.Font.Gotham
desc.TextSize = 14
desc.TextWrapped = true
desc.TextYAlignment = Enum.TextYAlignment.Top

local d = Instance.new("TextButton", b)
d.Size = UDim2.new(1, -20, 0, 35)
d.Position = UDim2.new(0, 10, 0, 100)
d.Text = "Copy Discord Link"
d.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
d.TextColor3 = Color3.new(1, 1, 1)
d.Font = Enum.Font.GothamBold
d.TextSize = 14
d.BorderSizePixel = 0

local d_corner = Instance.new("UICorner", d)
d_corner.CornerRadius = UDim.new(0, 6)

d.MouseButton1Click:Connect(function()
    if Clipboard then
        Clipboard("https://discord.gg/foxname")
        d.Text = "Copied!"
        task.wait(1.5)
        d.Text = "Copy Discord Link"
    else
        d.Text = "Executor not supported"
        task.wait(1.5)
        d.Text = "Copy Discord Link"
    end
end)
