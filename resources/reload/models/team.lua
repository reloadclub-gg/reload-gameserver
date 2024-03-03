local Team = setmetatable({
    table_name = 'team',
    id = nil,
    match_id = nil,
    name = nil,
}, BaseModel)
Team.__index = Team

return Team
