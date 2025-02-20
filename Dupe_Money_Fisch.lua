local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.4, 0)
frame.Position = UDim2.new(0.25, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 2
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.15, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "⚠️ WARNING ⚠️"
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

local warningText = Instance.new("TextLabel")
warningText.Size = UDim2.new(0.9, 0, 0.5, 0)
warningText.Position = UDim2.new(0.05, 0, 0.15, 0)
warningText.Text = "⚠️ You need to watch the video tutorial!\n\n" ..
                   "Once you use this script, it will auto sell all.\n" ..
                   "⚠️ Save your fish before activating this feature.\n\n" ..
                   "💰 Using this may result in **data loss or reset**. Use at your own risk!"
warningText.TextWrapped = true
warningText.TextSize = 20
warningText.TextColor3 = Color3.fromRGB(255, 255, 255)
warningText.BackgroundTransparency = 1
warningText.Font = Enum.Font.SourceSansBold
warningText.Parent = frame

local denyButton = Instance.new("TextButton")
denyButton.Size = UDim2.new(0.4, 0, 0.15, 0)
denyButton.Position = UDim2.new(0.05, 0, 0.75, 0)
denyButton.Text = "Decline"
denyButton.TextSize = 20
denyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
denyButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
denyButton.Font = Enum.Font.SourceSansBold
denyButton.Parent = frame

local acceptButton = Instance.new("TextButton")
acceptButton.Size = UDim2.new(0.4, 0, 0.15, 0)
acceptButton.Position = UDim2.new(0.55, 0, 0.75, 0)
acceptButton.Text = "Accept"
acceptButton.TextSize = 20
acceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
acceptButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
acceptButton.Font = Enum.Font.SourceSansBold
acceptButton.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.12, 0, 0.15, 0)
closeButton.Position = UDim2.new(0.88, 0, 0, 0)
closeButton.Text = "✖"
closeButton.TextSize = 24
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Parent = frame

denyButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

acceptButton.MouseButton1Click:Connect(function()
    gui:Destroy()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Dupe Money make by Cáo Mod",
        Text = "⚠️ It may cause you to reset your data!",
        Duration = 7
    })
    for i = 1, 150 do
        coroutine.wrap(function()
            while true do
                game:GetService("ReplicatedStorage").events.SellAll:InvokeServer()
                task.wait()
            end
        end)()
    end
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
