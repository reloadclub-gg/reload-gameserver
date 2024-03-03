local BaseModel = require("base")

local WeaponDamage = setmetatable({
    head_far = nil,
    head_medium = nil,
    head_close = nil,
    body_far = nil,
    body_medium = nil,
    body_close = nil,
    other_far = nil,
    other_medium = nil,
    other_close = nil,
}, BaseModel)
WeaponDamage.__index = WeaponDamage

local Weapon = setmetatable({
    id = nil,
    label = nil,
    price = nil,
    damage = nil
}, BaseModel)
Weapon.__index = Weapon

return {
    Weapon = Weapon,
    WeaponDamage = WeaponDamage,
}
