--[[
    Author: Rask/AfraiEda
    Creation Date: 10/11/2023

    Description:
        No description provided.

    Documentation:
        No documentation provided.
--]]

--= Roblox Services =--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--= Framework =--
local Knit = require(ReplicatedStorage.Packages.Knit)
local Enum = require(ReplicatedStorage.Packages.enum)
local controller = Knit.CreateController {
    Name = "controller",
}
--= Modules & Config =--

--= Constants =--

--= Variables =--

--= Job API =--

function controller:KnitStart()
    warn('• controller Started •')
    task.wait(2)
    local MessageEvent = game.ReplicatedStorage:WaitForChild("PlayerConnection")
    MessageEvent.OnClientEvent:Connect(function(message)
        game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(message)
    end)
end

function controller:KnitInit()
    warn('• controller Initiated •')
end

--= Methods =--

return controller