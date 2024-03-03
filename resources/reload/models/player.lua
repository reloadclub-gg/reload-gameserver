local BaseModel = require("base")

local Player = setmetatable({
    id = nil,
    steamid_hex = nil,
    level = nil,
    avatar = nil,
    username = nil,
    spec = false,
    team_id = nil
}, BaseModel)
Player.__index = Player

local PlayerSkin = setmetatable({
    player_id = nil,
    name = nil,
    weapon = nil
}, BaseModel)
PlayerSkin.__index = PlayerSkin

local PlayerSpray = setmetatable({
    player_id = nil,
    type = nil,
    name = nil
}, BaseModel)
PlayerSpray.__index = PlayerSpray

local PlayerWear = setmetatable({
    player_id = nil,
    side = nil,
    name = nil
}, BaseModel)
PlayerWear.__index = PlayerWear

return {
    Player = Player,
    PlayerSkin = PlayerSkin,
    PlayerSpray = PlayerSpray,
    PlayerWear = PlayerWear,
}
