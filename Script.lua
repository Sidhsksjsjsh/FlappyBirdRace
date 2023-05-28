local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Flappy Bird Race")

local Tab1 = Window_1:NewSection("Main")
local Tab2 = Window_1:NewSection("World")

local WorldRaycast = "1"

local EnergyTable = {}

for _,GetEnergy in pairs(game:GetService("Workspace").World[WorldRaycast].Energy.Normal:GetChildren()) do
      table.insert(EnergyTable, GetEnergy.Name)
  end

Tab1:CreateToggle("Auto Race", function(_)
    _G.Race = _
    while wait() do
      if _G.Race == false then break end
         game:GetService("ReplicatedStorage").Remote.Event.C_S.LaunchStart:FireServer()
         game:GetService("ReplicatedStorage").Remote.Event.C_S.LandDown:FireServer()
    end
end)

Tab1:CreateToggle("Auto Get Energy", function(_)
    _G.Energy = _
    while wait() do
      if _G.Energy == false then break end
         game:GetService("ReplicatedStorage").Remote.Event.C_S.TouchSpawn:FireServer(EnergyTable[math.random(1, #EnergyTable)])
    end
end)

Tab2:CreateButton("World 1", function()
    WorldRaycast = "1"
end)

Tab2:CreateButton("World 2", function()
    WorldRaycast = "2"
end)

Tab2:CreateButton("World 3", function()
    WorldRaycast = "3"
end)

Tab2:CreateButton("World 4", function()
    WorldRaycast = "4"
end)
