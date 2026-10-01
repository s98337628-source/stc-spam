-- ================= ANSH HUB =================
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game.Players
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- ================= CUTSCENE + MUSIC (4 SEC) =================
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://6843558868"
sound.Volume = 3
sound.Looped = false
sound.Parent = workspace
sound:Play()

camera.CameraType = Enum.CameraType.Scriptable
local startTime = tick()
local duration = 4
local cutsceneConn

cutsceneConn = RunService.RenderStepped:Connect(function()
    local elapsed = tick() - startTime
    if elapsed >= duration then
        cutsceneConn:Disconnect()
        camera.CameraType = Enum.CameraType.Custom
        return
    end
    local angle = elapsed * 0.8
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local pos = char.HumanoidRootPart.Position
        camera.CFrame = CFrame.new(pos + Vector3.new(math.sin(angle)*10, 5, math.cos(angle)*10), pos)
    end
end)

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "AnshHub"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- Gojo Image Button
local imgBtn = Instance.new("ImageButton")
imgBtn.Size = UDim2.new(0, 60, 0, 60)
imgBtn.Position = UDim2.new(0, 15, 0.5, -30)
imgBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
imgBtn.Image = "rbxassetid://9242918232"
imgBtn.Parent = gui

local imgCorner = Instance.new("UICorner")
imgCorner.CornerRadius = UDim.new(1, 0)
imgCorner.Parent = imgBtn

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
stroke.Color = Color3.fromRGB(255, 50, 50)
stroke.Thickness = 2
stroke.Parent = main

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 0, 40)
title.Position = UDim2.new(0, 20, 0, 5)
title.BackgroundTransparency = 1
title.Text = "ANSH HUB"
title.TextColor3 = Color3.fromRGB(255, 50, 50)
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

-- Scroll
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -30, 1, -80)
scroll.Position = UDim2.new(0, 15, 0, 55)
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
layout.Padding = UDim.new(0, 8)
layout.Parent = scroll

-- Button Helper
local function addButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(30, 20, 35)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = scroll
    
    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 8)
    bCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
    return btn
end

-- ================= FEATURES =================

-- Speed
local speedOn = false
addButton("Speed (Fast)", function()
    speedOn = not speedOn
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = speedOn and 100 or 16
    end
end)

-- Jump
local jumpOn = false
addButton("Jump Power", function()
    jumpOn = not jumpOn
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.UseJumpPower = true
        char.Humanoid.JumpPower = jumpOn and 150 or 50
    end
end)

-- Noclip
local noclipOn = false
addButton("Noclip", function()
    noclipOn = not noclipOn
end)

RunService.Stepped:Connect(function()
    if noclipOn then
        local char = player.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

-- Fly
local flyOn = false
local flyBV
addButton("Fly", function()
    flyOn = not flyOn
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    if flyOn then
        flyBV = Instance.new("BodyVelocity")
        flyBV.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        flyBV.Velocity = Vector3.new(0, 0, 0)
        flyBV.Parent = hrp
    else
        if flyBV then flyBV:Destroy() end
    end
end)

RunService.RenderStepped:Connect(function()
    if flyOn then
        local char = player.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp and flyBV then
                local moveDir = workspace.CurrentCamera.CFrame.LookVector * 50
                flyBV.Velocity = moveDir
            end
        end
    end
end)

-- ESP
local espOn = false
addButton("ESP (Players)", function()
    espOn = not espOn
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local hl = plr.Character:FindFirstChild("HumanoidRootPart")
            if hl then
                if espOn then
                    local box = Instance.new("BoxHandleAdornment")
                    box.Name = "ESP"
                    box.Size = hl.Size
                    box.Adornee = hl
                    box.AlwaysOnTop = true
                    box.ZIndex = 5
                    box.Transparency = 0.5
                    box.Color3 = Color3.fromRGB(255, 0, 0)
                    box.Parent = hl
                else
                    local old = hl:FindFirstChild("ESP")
                    if old then old:Destroy() end
                end
            end
        end
    end
end)

-- Fling
addButton("Fling Player", function()
    local mouse = player:GetMouse()
    local target = mouse.Target
    if target and target.Parent then
        local targetChar = target.Parent:FindFirstChild("HumanoidRootPart")
        if targetChar then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local bv = Instance.new("BodyVelocity")
                bv.Velocity = Vector3.new(1e6, 1e6, 1e6)
                bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                bv.Parent = targetChar
                task.wait(0.1)
                bv:Destroy()
            end
        end
    end
end)

-- Copy Avatar
addButton("Copy Avatar (Nearest)", function()
    local nearest
    local dist = math.huge
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            local myHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp and myHrp then
                local d = (hrp.Position - myHrp.Position).Magnitude
                if d < dist then
                    dist = d
                    nearest = plr
                end
            end
        end
    end
    if nearest then
        local desc = nearest.Character:GetDescendants()
        for _, item in pairs(desc) do
            if item:IsA("Shirt") or item:IsA("Pants") or item:IsA("Accessory") then
                item:Clone().Parent = player.Character
            end
        end
    end
end)

-- Image Button Toggle
imgBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- Minimize
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        main.Size = UDim2.new(0, 500, 0, 45)
        scroll.Visible = false
        minBtn.Text = "+"
    else
        main.Size = UDim2.new(0, 500, 0, 420)
        scroll.Visible = true
        minBtn.Text = "—"
    end
end)

-- Close
closeBtn.MouseButton1Click:Connect(function()
    sound:Stop()
    gui:Destroy()
end)
