local WeaponDamage = {
    head_far = nil,
    head_medium = nil,
    head_close = nil,
    body_far = nil,
    body_medium = nil,
    body_close = nil,
    other_far = nil,
    other_medium = nil,
    other_close = nil,
}

function WeaponDamage:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

local Weapon = {
    sys_name = nil,
    label = nil,
    price = nil,
    damage = nil -- WeaponDamage
}

function Weapon:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

return {
    Weapon = Weapon,
    WeaponDamage = WeaponDamage,
}
