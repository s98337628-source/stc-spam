-- ================= STC CHAT (Riser Style) =================
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

-- ================= CINEMATIC CUTSCENE (4 SEC) =================
local cam = workspace.CurrentCamera

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://6843558868"
sound.Volume = 3
sound.Looped = false
sound.Parent = workspace
sound:Play()

cam.CameraType = Enum.CameraType.Scriptable
local startTime = tick()
local duration = 4

local cutsceneConn
cutsceneConn = RunService.RenderStepped:Connect(function()
    local elapsed = tick() - startTime
    if elapsed >= duration then
        cutsceneConn:Disconnect()
        cam.CameraType = Enum.CameraType.Custom
        return
    end
    local angle = elapsed * 0.8
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local pos = char.HumanoidRootPart.Position
        cam.CFrame = CFrame.new(pos + Vector3.new(math.sin(angle)*10, 5, math.cos(angle)*10), pos)
    end
end)

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "STC_Chat"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- Floating Chat Icon
local chatIcon = Instance.new("TextButton")
chatIcon.Size = UDim2.new(0, 55, 0, 55)
chatIcon.Position = UDim2.new(0, 15, 0.5, -27)
chatIcon.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
chatIcon.Text = "💬"
chatIcon.TextScaled = true
chatIcon.Font = Enum.Font.GothamBold
chatIcon.Parent = gui

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = chatIcon

local iconStroke = Instance.new("UIStroke")
iconStroke.Color = Color3.fromRGB(255, 255, 255)
iconStroke.Thickness = 2
iconStroke.Parent = chatIcon

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 500, 0, 420)
main.Position = UDim2.new(0.5, -250, 0.5, -210)
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

-- Title Bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 0, 40)
title.Position = UDim2.new(0, 20, 0, 5)
title.BackgroundTransparency = 1
title.Text = "STC CHAT"
title.TextColor3 = Color3.fromRGB(255, 50, 150)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

-- Minimize Button
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

-- Close Button
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

-- System Message (Riser Style)
local sysLabel = Instance.new("TextLabel")
sysLabel.Size = UDim2.new(1, -30, 0, 30)
sysLabel.Position = UDim2.new(0, 15, 0, 50)
sysLabel.BackgroundColor3 = Color3.fromRGB(40, 20, 35)
sysLabel.BorderSizePixel = 0
sysLabel.Text = "⚡ [SYSTEM] : STC Chat Connected Successfully! 💬"
sysLabel.TextColor3 = Color3.fromRGB(255, 50, 150)
sysLabel.TextScaled = true
sysLabel.Font = Enum.Font.GothamBold
sysLabel.TextXAlignment = Enum.TextXAlignment.Left
sysLabel.Parent = main

local sysCorner = Instance.new("UICorner")
sysCorner.CornerRadius = UDim.new(0, 8)
sysCorner.Parent = sysLabel

-- Message Scroll
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -30, 1, -150)
scroll.Position = UDim2.new(0, 15, 0, 90)
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
layout.Padding = UDim.new(0, 5)
layout.Parent = scroll

-- Input Box
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(1, -120, 0, 40)
inputBox.Position = UDim2.new(0, 15, 1, -55)
inputBox.BackgroundColor3 = Color3.fromRGB(30, 20, 35)
inputBox.BorderSizePixel = 0
inputBox.PlaceholderText = "iMessage STC-Chat... (/help for support)"
inputBox.Text = ""
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.PlaceholderColor3 = Color3.fromRGB(150, 100, 150)
inputBox.Font = Enum.Font.Gotham
inputBox.TextScaled = true
inputBox.TextXAlignment = Enum.TextXAlignment.Left
inputBox.Parent = main

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 20)
inputCorner.Parent = inputBox

local inputStroke = Instance.new("UIStroke")
inputStroke.Color = Color3.fromRGB(255, 50, 150)
inputStroke.Thickness = 2
inputStroke.Parent = inputBox

-- Send Button (Pink Circle with Arrow)
local sendBtn = Instance.new("TextButton")
sendBtn.Size = UDim2.new(0, 40, 0, 40)
sendBtn.Position = UDim2.new(1, -60, 1, -55)
sendBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
sendBtn.Text = "⬆"
sendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
sendBtn.TextScaled = true
sendBtn.Font = Enum.Font.GothamBold
sendBtn.Parent = main

local sendCorner = Instance.new("UICorner")
sendCorner.CornerRadius = UDim.new(1, 0)
sendCorner.Parent = sendBtn

-- Add Message Function
local function addMessage(sender, msg, color, bgColor)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -10, 0, 30)
    frame.BackgroundColor3 = bgColor or Color3.fromRGB(25, 15, 30)
    frame.BorderSizePixel = 0
    frame.Parent = scroll
    
    local fCorner = Instance.new("UICorner")
    fCorner.CornerRadius = UDim.new(0, 8)
    fCorner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "[" .. sender .. "]: " .. msg
    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.Parent = frame
    
    scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end

-- Send Message (Sirf GUI me)
local function sendMessage()
    local text = inputBox.Text
    if text == "" then return end
    
    addMessage(player.Name, text, Color3.fromRGB(100, 255, 100), Color3.fromRGB(20, 40, 25))
    
    inputBox.Text = ""
end

sendBtn.MouseButton1Click:Connect(sendMessage)
inputBox.FocusLost:Connect(function(enter)
    if enter then sendMessage() end
end)

-- Chat Icon Open/Close
chatIcon.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- Minimize
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        main.Size = UDim2.new(0, 500, 0, 45)
        sysLabel.Visible = false
        scroll.Visible = false
        inputBox.Visible = false
        sendBtn.Visible = false
        minBtn.Text = "+"
    else
        main.Size = UDim2.new(0, 500, 0, 420)
        sysLabel.Visible = true
        scroll.Visible = true
        inputBox.Visible = true
        sendBtn.Visible = true
        minBtn.Text = "—"
    end
end)

-- Close
closeBtn.MouseButton1Click:Connect(function()
    sound:Stop()
    gui:Destroy()
end)

-- Player Join Bot Message
game.Players.PlayerAdded:Connect(function(plr)
    addMessage("BOT", plr.Name .. " joined the game! 👋", Color3.fromRGB(0, 200, 255), Color3.fromRGB(15, 25, 40))
end)
