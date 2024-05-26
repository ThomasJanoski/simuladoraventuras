local class = require("Libs.middleclass")

local Choice = require("Modules.Choice")

---@class Node
local Node = class("Node")

function Node:Initialize(Description, Choices, IsGameOver)
    self.Description = Description
    self.Choices = Choices
    self.IsGameOver = IsGameOver
end

function Node:PrintOnScreen()
    os.execute("cls")
    print("=================================================")
    print(self.Description)
    print("=================================================")
    if self.Choices then 
        for Index, ChoiceInfo in pairs(self.Choices) do
            print(string.format("[%d] %s", Index, ChoiceInfo.Description))
        end

        print("=================================================")
        print("Digite sua escolha:")
    end
end

function Node:HasChoices()
    return self.Choices ~= nil
end

function Node:GetUserChoice()
    local UserChoice = io.read("*n")
    return self.Choices[UserChoice].Destination
end

return Node