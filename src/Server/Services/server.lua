--[[
    Author: Rask/AfraiEda
    Creation Date: 28/10/2023

    Description:
    No description provided.
    
    Documentation:
    No documentation provided.
    --]]
    
--= Roblox Services =--
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

--= Modules & Config =--

--= Framework =--
local Knit = require(ReplicatedStorage.Packages.Knit)
local Enum = require(ReplicatedStorage.Packages.enum)
local test = Knit.CreateService {
    Name = "test",
    Client = {},
}
--= Constants =--

--= Variables =--

--= Job API =--

function test:KnitInit()
    warn('• Initiated •')
end

function test:KnitStart()
    local goal : ObjectValue = {
        Position = Vector3.new(50, 2, 50),
        Color = Color3.fromRGB(0, 255, 0)
    }
    local goal2 : ObjectValue = {
        ClockTime = 24
    }
    local tweenCycle : TweenInfo = TweenInfo.new(24, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1)
    local tweenInfo : TweenInfo = TweenInfo.new(50)
    local part : Part = createPart(
        'Part',
        Vector3.new(12, 2, 2),
        Color3.fromRGB(255, 0, 0)
    )
    local cd : Instance = Instance.new("ClickDetector", part)
    part.Touched:Connect(onTouch)

    Players.PlayerAdded:Connect(PlayerConnection)
    cd.MouseClick:Connect(function()
        onToggle(part)
    end)
    TweenService:Create(part, tweenInfo, goal):Play()
    TweenService:Create(Lighting, tweenCycle, goal2):Play()
    spin(part)
end

--= Methods =--

function onTouch(element)
    local part : Part = element.Parent
    if (part:FindFirstChildWhichIsA("Humanoid")) then
        print("je touche la")
    end
end

function PlayerConnection(player: Player)
    local PlayerConnection : Instance = game.ReplicatedStorage:WaitForChild("PlayerConnection")
    PlayerConnection:FireAllClients(player.Name .. " s'est connecté !")
end

function spin(part : Part)
    while task.wait() do
        part.CFrame = part.CFrame * CFrame.Angles(0, math.pi / 10, 0)
    end
end

function createPart(name : string, point : Vector3, color : Color3)
    local part : Part = Instance.new(name, game.Workspace)
    part.Anchored = true
    part.CFrame = CFrame.new(point)
    part.Color = color
    return part
end

function updateVisuals(part : Part)
	if part.Anchored then
		part.Material = Enum.Material.DiamondPlate
        part.CanCollide = true
	else
		part.Material = Enum.Material.Wood
        part.CanCollide = false
	end
end

function onToggle(part: Part)
	part.Anchored = not part.Anchored
	updateVisuals(part)
end

return test