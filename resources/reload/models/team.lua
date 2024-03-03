local Team = setmetatable({
    id = nil,
    match_id = nil,
    name = nil,
}, BaseModel)
Team.__index = Team

return Team
