-- ================= STC H8RS FULL SCRIPT =================
-- Brookhaven | Delta Executor | 2026

local player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")

-- ================= CINEMATIC CUTSCENE (4 SEC) =================
local cam = workspace.CurrentCamera

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://123403615670379"
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
    local angle = elapsed * 0.5
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local pos = char.HumanoidRootPart.Position
        cam.CFrame = CFrame.new(pos + Vector3.new(math.sin(angle)*8, 4, math.cos(angle)*8), pos)
    end
end)

-- ================= SPAM MESSAGES =================
local spamMessages = {
    "_________________STC H8rs DONT CRY BBG_________________",
    "_________________STC H8rs DONT CRY_________________",
    "_________________STC H8rs LEAVE KRDE_________________"
}

local spamOn = false
local spamSpeed = 0.5

local channel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function sendMessage(msg)
    pcall(function()
        channel:SendAsync(msg)
    end)
end

-- ================= GUI =================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "STC_SpamGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 260, 0, 230)
mainFrame.Position = UDim2.new(0.5, -130, 0.5, -115)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 50, 50)
stroke.Thickness = 2
stroke.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 0, 35)
title.Position = UDim2.new(0, 10, 0, 5)
title.BackgroundTransparency = 1
title.Text = "STC H8RS SPAM"
title.TextColor3 = Color3.fromRGB(255, 50, 50)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 25, 0, 25)
minBtn.Position = UDim2.new(1, -55, 0, 10)
minBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
minBtn.Text = "—"
minBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
minBtn.TextScaled = true
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = mainFrame

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 6)
minCorner.Parent = minBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -28, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 25)
statusLabel.Position = UDim2.new(0, 10, 0, 50)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: OFF"
statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = mainFrame

local onBtn = Instance.new("TextButton")
onBtn.Size = UDim2.new(0.4, 0, 0, 40)
onBtn.Position = UDim2.new(0.05, 0, 0, 85)
onBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 80)
onBtn.Text = "ON SPAM"
onBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
onBtn.TextScaled = true
onBtn.Font = Enum.Font.GothamBold
onBtn.Parent = mainFrame

local onCorner = Instance.new("UICorner")
onCorner.CornerRadius = UDim.new(0, 8)
onCorner.Parent = onBtn

local offBtn = Instance.new("TextButton")
offBtn.Size = UDim2.new(0.4, 0, 0, 40)
offBtn.Position = UDim2.new(0.55, 0, 0, 85)
offBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
offBtn.Text = "OFF SPAM"
offBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
offBtn.TextScaled = true
offBtn.Font = Enum.Font.GothamBold
offBtn.Parent = mainFrame

local offCorner = Instance.new("UICorner")
offCorner.CornerRadius = UDim.new(0, 8)
offCorner.Parent = offBtn

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, -20, 0, 20)
speedLabel.Position = UDim2.new(0, 10, 0, 135)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: 0.50s"
speedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
speedLabel.TextScaled = true
speedLabel.Font = Enum.Font.Gotham
speedLabel.Parent = mainFrame

local sliderBg = Instance.new("Frame")
sliderBg.Size = UDim2.new(1, -30, 0, 10)
sliderBg.Position = UDim2.new(0, 15, 0, 165)
sliderBg.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
sliderBg.BorderSizePixel = 0
sliderBg.Parent = mainFrame

local sliderCorner = Instance.new("UICorner")
sliderCorner.CornerRadius = UDim.new(0, 5)
sliderCorner.Parent = sliderBg

local sliderFill = Instance.new("Frame")
sliderFill.Size = UDim2.new(0.5, 0, 1, 0)
sliderFill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
sliderFill.BorderSizePixel = 0
sliderFill.Parent = sliderBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 5)
fillCorner.Parent = sliderFill

local sliderBtn = Instance.new("TextButton")
sliderBtn.Size = UDim2.new(0, 20, 0, 20)
sliderBtn.Position = UDim2.new(0.5, -10, 0.5, -10)
sliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderBtn.Text = ""
sliderBtn.Parent = sliderBg

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(1, 0)
btnCorner.Parent = sliderBtn

local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, -20, 0, 20)
infoLabel.Position = UDim2.new(0, 10, 0, 195)
infoLabel.BackgroundTransparency = 1
infoLabel.Text = "Drag title to move • Speed slider"
infoLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
infoLabel.TextScaled = true
infoLabel.Font = Enum.Font.Gotham
infoLabel.Parent = mainFrame

-- ================= SPAM FUNCTIONS =================
local spamThread

local function startSpam()
    if spamOn then return end
    spamOn = true
    statusLabel.Text = "Status: ON 🔥"
    statusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)

    spamThread = task.spawn(function()
        while spamOn do
            for _, msg in ipairs(spamMessages) do
                if not spamOn then break end
                sendMessage(msg)
                task.wait(spamSpeed)
            end
        end
    end)
end

local function stopSpam()
    spamOn = false
    statusLabel.Text = "Status: OFF"
    statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
end

-- ================= BUTTON EVENTS =================
onBtn.MouseButton1Click:Connect(startSpam)
offBtn.MouseButton1Click:Connect(stopSpam)

closeBtn.MouseButton1Click:Connect(function()
    stopSpam()
    sound:Stop()
    screenGui:Destroy()
end)

local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        mainFrame.Size = UDim2.new(0, 260, 0, 40)
        statusLabel.Visible = false
        onBtn.Visible = false
        offBtn.Visible = false
        speedLabel.Visible = false
        sliderBg.Visible = false
        infoLabel.Visible = false
        minBtn.Text = "+"
    else
        mainFrame.Size = UDim2.new(0, 260, 0, 230)
        statusLabel.Visible = true
        onBtn.Visible = true
        offBtn.Visible = true
        speedLabel.Visible = true
        sliderBg.Visible = true
        infoLabel.Visible = true
        minBtn.Text = "—"
    end
end)

-- ================= SPEED SLIDER =================
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
        local percent = math.clamp((mouseX - sliderStart) / sliderWidth, 0.05, 1)
        sliderFill.Size = UDim2.new(percent, 0, 1, 0)
        sliderBtn.Position = UDim2.new(percent, -10, 0.5, -10)
        spamSpeed = 1.0 - (percent * 0.95)
        speedLabel.Text = string.format("Speed: %.2fs", spamSpeed)
    end
end)

-- ================= NOTIFICATION =================
StarterGui:SetCore("SendNotification", {
    Title = "🎵 STC H8RS LOADED";
    Text = "Cutscene + Gaana + Spam ready!";
    Duration = 5;
})

print("[STC H8RS] Script loaded successfully!")
