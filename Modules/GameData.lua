local class = require("Libs.middleclass")

---@class GameData
local GameData = class("GameData")

function GameData:Initialize()
    self.currentNode = nil ---@type string
    self.isOver = false ---@type boolean
end

return GameData