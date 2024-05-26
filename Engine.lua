local Choice = require("Modules.Choice")
local NodeContainer = require("Modules.NodeContainer")
local GameData = require("Modules.GameData")

os.execute("chcp 65001 > NUL")

local Game = GameData:new()
_G.Game = Game

Game:Initialize()

local IsOver = false

local CurrentNode = NodeContainer:ChooseNode("Initial")

while not IsOver do
    CurrentNode:PrintOnScreen()
    if CurrentNode:HasChoices() then
        local Destination = CurrentNode:GetUserChoice()
        CurrentNode = NodeContainer:ChooseNode(Destination)
    elseif CurrentNode.IsGameOver then IsOver = true break end
end