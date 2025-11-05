
local p = game:GetService("Players").LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local CurrentCamera = workspace.CurrentCamera

local a = Instance.new("ScreenGui")
a.Parent = pg
a.DisplayOrder = 111
a.ResetOnSpawn = false

local b = Instance.new("Frame")
b.Size = UDim2.new(0,300,0,180)
b.Position = UDim2.new(0.5,0,0.5,0)
b.AnchorPoint = Vector2.new(0.5,0.5)
b.BackgroundColor3 = Color3.fromRGB(255,255,255)
b.BorderSizePixel = 0
b.Active = true
b.Draggable = true
b.Parent = a

local c = Instance.new("UICorner")
c.CornerRadius = UDim.new(0,16)
c.Parent = b

local d = Instance.new("UIGradient")
d.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0,Color3.fromRGB(0,128,255)),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(255,140,0))
}
d.Rotation = 45
d.Parent = b

local e = Instance.new("Frame")
e.Size = UDim2.new(1,-10,1,-10)
e.Position = UDim2.new(0,5,0,5)
e.BackgroundColor3 = Color3.fromRGB(30,30,30)
e.BorderSizePixel = 0
e.Parent = b

local f = Instance.new("UICorner")
f.CornerRadius = UDim.new(0,14)
f.Parent = e

local g = Instance.new("TextLabel")
g.Size = UDim2.new(1,-20,0,30)
g.Position = UDim2.new(0,10,0,10)
g.BackgroundTransparency = 1
g.Text = "Foxname | Dupe Candy"
g.Font = Enum.Font.GothamBold
g.TextSize = 20
g.TextColor3 = Color3.fromRGB(255,255,255)
g.TextXAlignment = Enum.TextXAlignment.Left
g.Parent = e

local h = Instance.new("TextLabel")
h.Size = UDim2.new(1,-20,0,25)
h.Position = UDim2.new(0,10,0,45)
h.BackgroundTransparency = 1
h.Text = "Candy: Đang tải..."
h.Font = Enum.Font.GothamBold
h.TextSize = 18
h.TextColor3 = Color3.fromRGB(255,215,0)
h.TextXAlignment = Enum.TextXAlignment.Left
h.Parent = e

local i = Instance.new("TextLabel")
i.Size = UDim2.new(1,-20,0,25)
i.Position = UDim2.new(0,10,0,75)
i.BackgroundTransparency = 1
i.Text = "Status: dupe candy...."
i.Font = Enum.Font.Gotham
i.TextSize = 16
i.TextColor3 = Color3.fromRGB(100,255,100)
i.TextXAlignment = Enum.TextXAlignment.Left
i.Parent = e

function ngui(txt) i.Text = "Status: "..txt end

local l = Instance.new("TextLabel")
l.Size = UDim2.new(1,-20,0,20)
l.Position = UDim2.new(0,10,0,105)
l.BackgroundTransparency = 1
l.Text = "Report bugs on discord and join discord for update"
l.Font = Enum.Font.Gotham
l.TextSize = 13
l.TextColor3 = Color3.fromRGB(180,180,180)
l.TextXAlignment = (CurrentCamera and CurrentCamera.ViewportSize.X>600) and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center
l.Parent = e

local function showGain(gain)
    if gain<=0 then return end
    local gainLabel = Instance.new("TextLabel")
    gainLabel.Size = UDim2.new(0,100,0,30)
    gainLabel.Position = UDim2.new(0,math.random(150,200),0,math.random(40,60))
    gainLabel.BackgroundTransparency = 1
    gainLabel.Text = "+"..gain
    gainLabel.Font = Enum.Font.GothamBold
    gainLabel.TextSize = 22
    gainLabel.TextColor3 = Color3.fromRGB(0,255,0)
    gainLabel.TextStrokeTransparency = 0.7
    gainLabel.TextStrokeColor3 = Color3.fromRGB(0,100,0)
    gainLabel.Parent = e
    local tween = game:GetService("TweenService"):Create(gainLabel,TweenInfo.new(1.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=gainLabel.Position+UDim2.new(0,0,0,-50),TextTransparency=1})
    tween:Play()
    tween.Completed:Connect(function() gainLabel:Destroy() end)
end

task.spawn(function()
    local candyLabel = nil
    repeat
        pcall(function()
            candyLabel = game:GetService("Players").LocalPlayer
                :WaitForChild("PlayerGui")
                :WaitForChild("Interface")
                :WaitForChild("CandyCount")
                :WaitForChild("Count")
        end)
        task.wait(0.5)
    until candyLabel

    task.wait(0.1)
    local initial = tonumber((candyLabel.Text or "0"):match("%d+")) or 0
    local lastCandy = initial
    h.Text = "Candy: "..initial

    while task.wait(0.3) do
        if not candyLabel:IsDescendantOf(game) then
            h.Text = "Candy: Mất kết nối"
            break
        end
        local num = tonumber((candyLabel.Text or "0"):match("%d+")) or 0
        if num > lastCandy then
            local gain = num - lastCandy
            h.Text = "Candy: "..num.." (+"..gain..")"
            showGain(gain)
            task.wait(1)
            h.Text = "Candy: "..num
            lastCandy = num
        elseif num < lastCandy then
            lastCandy = num
            h.Text = "Candy: "..num
        end
    end
end)

local j = Instance.new("TextButton")
j.Size = UDim2.new(0.48,-5,0,28)
j.Position = UDim2.new(0,10,1,-38)
j.BackgroundColor3 = Color3.fromRGB(0,128,255)
j.Text = "Copy Discord"
j.Font = Enum.Font.GothamBold
j.TextSize = 14
j.TextColor3 = Color3.fromRGB(255,255,255)
j.Parent = e
local jc = Instance.new("UICorner")
jc.CornerRadius = UDim.new(0,8)
jc.Parent = j
j.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/mSrMzVuc3h") end)

local k = Instance.new("TextButton")
k.Size = UDim2.new(0.48,-5,0,28)
k.Position = UDim2.new(0.52,0,1,-38)
k.BackgroundColor3 = Color3.fromRGB(255,140,0)
k.Text = "Donate"
k.Font = Enum.Font.GothamBold
k.TextSize = 14
k.TextColor3 = Color3.fromRGB(255,255,255)
k.Parent = e
local kc = Instance.new("UICorner")
kc.CornerRadius = UDim.new(0,8)
kc.Parent = k
k.MouseButton1Click:Connect(function()
    setclipboard("https://direct-link.net/1344347/iaXZcb4V6GjT")
    setclipboard("https://link-hub.net/1344347/sNxKdBZn4wxj")
    setclipboard("https://link-hub.net/1344347/P6MNdBTa7Seh")
    setclipboard("https://link-hub.net/1344347/RJRf4xTOGe3o")
end)

local Remote = game:GetService("ReplicatedStorage").RemoteEvents.CarnivalCompleteShootingGallery

local allObjects = {}
local function updateObjects()
    allObjects = {}
    for _, service in game:GetChildren() do
        for _, obj in service:GetDescendants() do
            table.insert(allObjects, obj)
        end
    end
end
updateObjects()

local function fire(obj)
    task.spawn(function()
        pcall(function()
            Remote:FireServer(obj)
        end)
    end)
end

local delayTime = tonumber(getgenv().speed)
local isInfiniteSpam = not delayTime  

if isInfiniteSpam then
    while task.wait() do
        for _, obj in allObjects do
            fire(obj)
        end
    end
else
    while true do
        for _, obj in allObjects do
            fire(obj)
            task.wait(delayTime)
        end
        task.wait()
    end
end
