-- ================= CINEMATIC CUTSCENE (4 SEC) =================
local cam = workspace.CurrentCamera

-- Drift Phonk Music
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://6843558868" -- Drift Phonk [citation:7]
sound.Volume = 3
sound.Looped = false

-- Best part pe start karo (0 = shuru se, 10 = 10 sec baad)
sound.TimePosition = 0
sound.Parent = workspace
sound:Play()

-- Camera Cutscene
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
