-- ================= STC EMOTE (Search Bar) =================
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game.Players
local player = Players.LocalPlayer

-- ================= PROFILE LOADING SCREEN (4 SEC) =================
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "STC_Loading"
loadingGui.ResetOnSpawn = false
loadingGui.Parent = CoreGui

local loadFrame = Instance.new("Frame")
loadFrame.Size = UDim2.new(1, 0, 1, 0)
loadFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 15)
loadFrame.BorderSizePixel = 0
loadFrame.Parent = loadingGui

local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(0, 120, 0, 120)
avatar.Position = UDim2.new(0.5, -60, 0.5, -100)
avatar.BackgroundColor3 = Color3.fromRGB(30, 15, 40)
avatar.BorderSizePixel = 0
avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
avatar.Parent = loadFrame

local avCorner = Instance.new("UICorner")
avCorner.CornerRadius = UDim.new(1, 0)
avCorner.Parent = avatar

local avStroke = Instance.new("UIStroke")
avStroke.Color = Color3.fromRGB(255, 50, 150)
avStroke.Thickness = 3
avStroke.Parent = avatar

local nameLabel = Instance.new("TextLabel")
nameLabel.Size = UDim2.new(1, 0, 0, 40)
nameLabel.Position = UDim2.new(0, 0, 0.5, 40)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = player.Name
nameLabel.TextColor3 = Color3.fromRGB(255, 50, 150)
nameLabel.TextScaled = true
nameLabel.Font = Enum.Font.GothamBold
nameLabel.Parent = loadFrame

local loadLabel = Instance.new("TextLabel")
loadLabel.Size = UDim2.new(1, 0, 0, 30)
loadLabel.Position = UDim2.new(0, 0, 0.5, 80)
loadLabel.BackgroundTransparency = 1
loadLabel.Text = "Loading..."
loadLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
loadLabel.TextScaled = true
loadLabel.Font = Enum.Font.Gotham
loadLabel.Parent = loadFrame

local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0, 250, 0, 8)
barBg.Position = UDim2.new(0.5, -125, 0.5, 130)
barBg.BackgroundColor3 = Color3.fromRGB(40, 20, 45)
barBg.BorderSizePixel = 0
barBg.Parent = loadFrame

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = barBg

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
barFill.BorderSizePixel = 0
barFill.Parent = barBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = barFill

task.spawn(function()
    for i = 0, 100 do
        barFill.Size = UDim2.new(i/100, 0, 1, 0)
        task.wait(0.04)
    end
    task.wait(0.2)
    loadingGui:Destroy()
end)

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "STC_Emote"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 400, 0, 480)
main.Position = UDim2.new(0.5, -200, 0.5, -240)
main.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = false
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 50, 150)
stroke.Thickness = 2
stroke.Parent = main

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 0, 40)
title.Position = UDim2.new(0, 20, 0, 5)
title.BackgroundTransparency = 1
title.Text = "STC EMOTE"
title.TextColor3 = Color3.fromRGB(255, 50, 150)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

-- Minimize
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -70, 0, 8)
minBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
minBtn.Text = "—"
minBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
minBtn.TextScaled = true
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = main

local minC = Instance.new("UICorner")
minC.CornerRadius = UDim.new(0, 6)
minC.Parent = minBtn

-- Close
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 8)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = main

local closeC = Instance.new("UICorner")
closeC.CornerRadius = UDim.new(0, 6)
closeC.Parent = closeBtn

-- Search Bar
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -30, 0, 38)
searchBox.Position = UDim2.new(0, 15, 0, 50)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 20, 35)
searchBox.BorderSizePixel = 0
searchBox.PlaceholderText = "🔍 Search emote..."
searchBox.Text = ""
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderColor3 = Color3.fromRGB(150, 100, 150)
searchBox.Font = Enum.Font.Gotham
searchBox.TextScaled = true
searchBox.TextXAlignment = Enum.TextXAlignment.Left
searchBox.Parent = main

local sbCorner = Instance.new("UICorner")
sbCorner.CornerRadius = UDim.new(0, 10)
sbCorner.Parent = searchBox

-- Speed Slider Label
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, -30, 0, 25)
speedLabel.Position = UDim2.new(0, 15, 0, 95)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Emote Speed: 1.0x"
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.TextScaled = true
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = main

-- Speed Slider
local sliderBg = Instance.new("Frame")
sliderBg.Size = UDim2.new(1, -30, 0, 10)
sliderBg.Position = UDim2.new(0, 15, 0, 125)
sliderBg.BackgroundColor3 = Color3.fromRGB(50, 30, 55)
sliderBg.BorderSizePixel = 0
sliderBg.Parent = main

local sliderCorner = Instance.new("UICorner")
sliderCorner.CornerRadius = UDim.new(1, 0)
sliderCorner.Parent = sliderBg

local sliderFill = Instance.new("Frame")
sliderFill.Size = UDim2.new(0.5, 0, 1, 0)
sliderFill.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
sliderFill.BorderSizePixel = 0
sliderFill.Parent = sliderBg

local sfCorner = Instance.new("UICorner")
sfCorner.CornerRadius = UDim.new(1, 0)
sfCorner.Parent = sliderFill

local sliderBtn = Instance.new("TextButton")
sliderBtn.Size = UDim2.new(0, 20, 0, 20)
sliderBtn.Position = UDim2.new(0.5, -10, 0.5, -10)
sliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderBtn.Text = ""
sliderBtn.Parent = sliderBg

local slCorner = Instance.new("UICorner")
slCorner.CornerRadius = UDim.new(1, 0)
slCorner.Parent = sliderBtn

-- Emote Scroll
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -30, 1, -180)
scroll.Position = UDim2.new(0, 15, 0, 145)
scroll.BackgroundColor3 = Color3.fromRGB(10, 5, 15)
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 5
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.Parent = main

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 10)
scrollCorner.Parent = scroll

local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 6)
layout.Parent = scroll

-- Emote List (Saare Brookhaven Emotes)
local allEmotes = {
    "Dance", "Dance2", "Dance3",
    "Wave", "Point", "Cheer",
    "Laugh", "Cry", "Bow",
    "Sit", "Lay", "Salute",
    "Kick", "Punch", "Flex",
    "Clap", "ThumbsUp", "Facepalm",
    "Shrug", "Beckon", "Agree",
    "Disagree", "Dance4", "Dance5"
}

local emoteSpeed = 1.0

-- Emote Button Function
local function addEmoteButton(name, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(30, 20, 35)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = parent
    
    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 8)
    bCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        local char = player.Character
        if not char then return end
        local humanoid = char:FindFirstChild("Humanoid")
        if not humanoid then return end
        local animator = humanoid:FindFirstChild("Animator")
        if not animator then return end
        
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://507771019"
        
        local track = animator:LoadAnimation(anim)
        track:Play()
        track:AdjustSpeed(emoteSpeed)
    end)
end

-- Load Emotes
for _, e in ipairs(allEmotes) do
    addEmoteButton(e, scroll)
end

scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)

-- Search Function
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local query = searchBox.Text:lower()
    
    -- Clear scroll
    for _, child in pairs(scroll:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    -- Add filtered
    for _, e in ipairs(allEmotes) do
        if query == "" or e:lower():find(query) then
            addEmoteButton(e, scroll)
        end
    end
    
    scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end)

-- Speed Slider Logic
local dragging = false
sliderBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local mouseX = input.Position.X
        local sliderStart = sliderBg.AbsolutePosition.X
        local sliderWidth = sliderBg.AbsoluteSize.X
        local percent = math.clamp((mouseX - sliderStart) / sliderWidth, 0.1, 2.0)
        sliderFill.Size = UDim2.new(percent/2, 0, 1, 0)
        sliderBtn.Position = UDim2.new(percent/2, -10, 0.5, -10)
        emoteSpeed = percent
        speedLabel.Text = string.format("Emote Speed: %.1fx", emoteSpeed)
    end
end)

-- Minimize
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        main.Size = UDim2.new(0, 400, 0, 45)
        searchBox.Visible = false
        speedLabel.Visible = false
        sliderBg.Visible = false
        scroll.Visible = false
        minBtn.Text = "+"
    else
        main.Size = UDim2.new(0, 400, 0, 480)
        searchBox.Visible = true
        speedLabel.Visible = true
        sliderBg.Visible = true
        scroll.Visible = true
        minBtn.Text = "—"
    end
end)

-- Close
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Show GUI after loading
task.wait(4.2)
main.Visible = true
