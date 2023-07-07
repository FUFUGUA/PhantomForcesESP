local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local window = Library.CreateLib("ESP by FUFUGUA (AKA softcare)         Toggle UI = F", "BloodTheme")

local EspTab = window:NewTab("ESP")
local EspSection = EspTab:NewSection("Esp")
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/FUFUGUA/PhantomForcesESP/main/ESPPHANTOMFORCES.lua"))()
local settingsTab = window:NewTab("Settings")
local settingsSection = settingsTab:NewSection("Settings")


settingsSection:NewKeybind("Toggle UI", "Toggle UI on and off, visible/not visible", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

ESP.Boxes = false
ESP.Names = false

local Ghosts = game.Workspace.Players['Bright orange']
local Phantoms = game.Workspace.Players['Bright blue']

ESP:AddObjectListener(Ghosts, {
  Recursive = true,
  Type = "Model",
  CustomName = " ",
  Color = Color3.fromRGB(255,165,0),
      Validator = function(obj)
      return obj:FindFirstChild("Torso")
  end,
  IsEnabled = "GhostsESP"
})
ESP:AddObjectListener(Phantoms, {
  Recursive = true,
  Type = "Model",
  CustomName = " ",
  Color = Color3.fromRGB(0,0,233),
      Validator = function(obj)
      return obj:FindFirstChild("Torso")
  end,
  IsEnabled = "PhantomsESP"
})
ESP.GhostsESP = false
ESP.PhantomsESP = false 

EspSection:NewToggle("Enable ESP", "Blud what info do you need for this :skull:", function(v)
    if v then
        ESP:Toggle(true)
    else
        ESP:Toggle(false)
    end
end)
EspSection:NewToggle("Ghosts", "Blud what info do you need for this :skull:", function(v)
        ESP.GhostsESP = v
end)
EspSection:NewToggle("Phantoms", "Blud what info do you need for this :skull:", function(v)
        ESP.PhantomsESP = v
end)
EspSection:NewToggle("Boxes", "Blud what info do you need for this :skull:", function(v)
    if v then
        ESP.Boxes = true
    else
        ESP.Boxes = false
    end
end)
EspSection:NewToggle("Tracers", "Blud what info do you need for this :skull:", function(v)
    if v then
        ESP.Tracers = true
    else
        ESP.Tracers = false
    end
end)
EspSection:NewToggle("Distance", "Blud what info do you need for this :skull:", function(v)
    if v then
        ESP.Names = true
    else
        ESP.names = false
    end
end)

settingsSection:NewButton("Rejoin", "Rejoins server", function()
	local ts = game:GetService("TeleportService")
	local p = game:GetService("Players").LocalPlayer
	ts:Teleport(game.PlaceId, p)
end)
settingsSection:NewSlider("FPS capacity", "FPS", 300, 10, function(v)
	setfpscap(v)
end)

