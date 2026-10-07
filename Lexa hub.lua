-- ================= LEXA HUB (Kavo UI) =================
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("LEXA HUB", "BloodTheme")

-- ================= MAIN TAB =================
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("LEXA HUB Controls")

MainSection:NewLabel("Welcome to LEXA HUB")
MainSection:NewLabel("Copy any script link below")

-- ================= SCRIPT LINKS TAB =================
local LinkTab = Window:NewTab("Script Links")
local LinkSection = LinkTab:NewSection("Copy Links")

-- STC CHAT
LinkSection:NewButton("Copy STC CHAT Link", "Click to copy", function()
    setclipboard("https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Stc%20chat.lua")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Copied!";
        Text = "STC CHAT link copied to clipboard";
        Duration = 3;
    })
end)

-- STC EMOTE
LinkSection:NewButton("Copy STC EMOTE Link", "Click to copy", function()
    setclipboard("https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Stc%20emote.lua")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Copied!";
        Text = "STC EMOTE link copied";
        Duration = 3;
    })
end)

-- ANSH HUB
LinkSection:NewButton("Copy ANSH HUB Link", "Click to copy", function()
    setclipboard("https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Ansh%20hub.lua")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Copied!";
        Text = "ANSH HUB link copied";
        Duration = 3;
    })
end)

-- LEXA HUB
LinkSection:NewButton("Copy LEXA HUB Link", "Click to copy", function()
    setclipboard("https://raw.githubusercontent.com/s98337628-source/lexa/main/Lexa%20hub.lua")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Copied!";
        Text = "LEXA HUB link copied";
        Duration = 3;
    })
end)

-- BOUNTY
LinkSection:NewButton("Copy BOUNTY Link", "Click to copy", function()
    setclipboard("https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Bounty.lua")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Copied!";
        Text = "BOUNTY link copied";
        Duration = 3;
    })
end)

-- STC SPAM
LinkSection:NewButton("Copy STC SPAM Link", "Click to copy", function()
    setclipboard("https://raw.githubusercontent.com/s98337628-source/stc-spam/main/stc.lua")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Copied!";
        Text = "STC SPAM link copied";
        Duration = 3;
    })
end)

-- ================= LOAD SCRIPTS TAB =================
local LoadTab = Window:NewTab("Load Scripts")
local LoadSection = LoadTab:NewSection("Direct Load")

LoadSection:NewButton("Load STC CHAT", "Click to load", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Stc%20chat.lua"))()
end)

LoadSection:NewButton("Load STC EMOTE", "Click to load", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Stc%20emote.lua"))()
end)

LoadSection:NewButton("Load ANSH HUB", "Click to load", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Ansh%20hub.lua"))()
end)

LoadSection:NewButton("Load LEXA HUB", "Click to load", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/s98337628-source/lexa/main/Lexa%20hub.lua"))()
end)

LoadSection:NewButton("Load BOUNTY", "Click to load", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Bounty.lua"))()
end)

LoadSection:NewButton("Load STC SPAM", "Click to load", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/s98337628-source/stc-spam/main/stc.lua"))()
end)

-- ================= MISC TAB =================
local MiscTab = Window:NewTab("Misc")
local MiscSection = MiscTab:NewSection("All Links")

MiscSection:NewLabel("STC CHAT:")
MiscSection:NewLabel("raw.githubusercontent.com/s98337628-source/stc-spam/main/Stc chat.lua")

MiscSection:NewLabel("STC EMOTE:")
MiscSection:NewLabel("raw.githubusercontent.com/s98337628-source/stc-spam/main/Stc emote.lua")

MiscSection:NewLabel("ANSH HUB:")
MiscSection:NewLabel("raw.githubusercontent.com/s98337628-source/stc-spam/main/Ansh hub.lua")

MiscSection:NewLabel("LEXA HUB:")
MiscSection:NewLabel("raw.githubusercontent.com/s98337628-source/lexa/main/Lexa hub.lua")

MiscSection:NewLabel("BOUNTY:")
MiscSection:NewLabel("raw.githubusercontent.com/s98337628-source/stc-spam/main/Bounty.lua")

MiscSection:NewLabel("STC SPAM:")
MiscSection:NewLabel("raw.githubusercontent.com/s98337628-source/stc-spam/main/stc.lua")

MiscSection:NewButton("Copy ALL Links", "Copies all links", function()
    setclipboard([[
STC CHAT: https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Stc%20chat.lua
STC EMOTE: https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Stc%20emote.lua
ANSH HUB: https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Ansh%20hub.lua
LEXA HUB: https://raw.githubusercontent.com/s98337628-source/lexa/main/Lexa%20hub.lua
BOUNTY: https://raw.githubusercontent.com/s98337628-source/stc-spam/main/Bounty.lua
STC SPAM: https://raw.githubusercontent.com/s98337628-source/stc-spam/main/stc.lua
    ]])
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Copied!";
        Text = "All links copied";
        Duration = 3;
    })
end)

-- ================= KEYBIND =================
local KeybindTab = Window:NewTab("Keybinds")
local KeySection = KeybindTab:NewSection("Controls")

KeySection:NewKeybind("Toggle UI", "Hide/Show GUI", Enum.KeyCode.RightShift, function()
    Library:ToggleUI()
end)
