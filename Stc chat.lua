-- ================= STC CHAT =================
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local player = game.Players.LocalPlayer

local channel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "STC_Chat"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 500, 0, 400)
main.Position = UDim2.new(0.5, -250, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 50, 150)
stroke.Thickness = 2
stroke.Parent = main

-- Title Bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 0, 40)
title.Position = UDim2.new(0, 15, 0, 0)
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
minBtn.Position = UDim2.new(1, -70, 0, 5)
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
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = main

local closeC = Instance.new("UICorner")
closeC.CornerRadius = UDim.new(0, 6)
closeC.Parent = closeBtn

-- Message Scroll Frame
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 1, -100)
scroll.Position = UDim2.new(0, 10, 0, 45)
scroll.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 5
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.Parent = main

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 8)
scrollCorner.Parent = scroll

local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 5)
layout.Parent = scroll

-- Input Box
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(1, -80, 0, 35)
inputBox.Position = UDim2.new(0, 10, 1, -45)
inputBox.BackgroundColor3 = Color3.fromRGB(35, 30, 45)
inputBox.BorderSizePixel = 0
inputBox.PlaceholderText = "Message likho..."
inputBox.Text = ""
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
inputBox.Font = Enum.Font.Gotham
inputBox.TextScaled = true
inputBox.Parent = main

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = inputBox

-- Send Button
local sendBtn = Instance.new("TextButton")
sendBtn.Size = UDim2.new(0, 60, 0, 35)
sendBtn.Position = UDim2.new(1, -70, 1, -45)
sendBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
sendBtn.Text = "Send"
sendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
sendBtn.TextScaled = true
sendBtn.Font = Enum.Font.GothamBold
sendBtn.Parent = main

local sendCorner = Instance.new("UICorner")
sendCorner.CornerRadius = UDim.new(0, 8)
sendCorner.Parent = sendBtn

-- Message Add Function
local function addMessage(sender, msg, color)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = "[" .. sender .. "]: " .. msg
    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.Parent = scroll
    scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end

-- Welcome Bot Message
addMessage("SYSTEM", "STC Chat Connected Successfully! 💬", Color3.fromRGB(255, 50, 150))

-- Send Message Function (Clean - no tags)
local function sendMessage()
    local text = inputBox.Text
    if text == "" then return end

    -- Tags escape karo
    local clean = text:gsub("([_*#~`])", "\\%1")

    -- Apne chat me dikhao
    addMessage(player.Name, text, Color3.fromRGB(100, 255, 100))

    -- Roblox chat me bhejo
    pcall(function()
        channel:SendAsync(clean)
    end)

    inputBox.Text = ""
end

sendBtn.MouseButton1Click:Connect(sendMessage)
inputBox.FocusLost:Connect(function(enter)
    if enter then
        sendMessage()
    end
end)

-- Minimize
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        main.Size = UDim2.new(0, 500, 0, 45)
        scroll.Visible = false
        inputBox.Visible = false
        sendBtn.Visible = false
        minBtn.Text = "+"
    else
        main.Size = UDim2.new(0, 500, 0, 400)
        scroll.Visible = true
        inputBox.Visible = true
        sendBtn.Visible = true
        minBtn.Text = "—"
    end
end)

-- Close
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Player Join Detection (Bot message)
game.Players.PlayerAdded:Connect(function(plr)
    addMessage("BOT", plr.Name .. " joined the game! 👋", Color3.fromRGB(0, 200, 255))
end)
