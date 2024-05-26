local class = require("Libs.middleclass")

---@class Choice
local Choice = class("Choice")

function Choice:Initialize()
    self.currentNode = nil ---@type string
    self.isOver = false ---@type boolean
end

return Choice