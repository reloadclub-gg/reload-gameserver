local BaseModel = require('models.base')

local Game = setmetatable({
    table_name = 'game',
    id = nil,
    match_type = nil,
    map = nil
}, BaseModel)
Game.__index = Game

return Game
