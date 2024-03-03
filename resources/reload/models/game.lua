local BaseModel = require('models.base')

local Game = setmetatable({
    id = nil,
    match_type = nil,
    map = nil
}, BaseModel)
Game.__index = Game

return Game
