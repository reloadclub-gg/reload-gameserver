local BaseModel = {
    tableName = nil
}

function BaseModel:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    if not o.tableName then
        error("tableName is required.")
    end
    return o
end

function BaseModel:get(id)
    local query = string.format("SELECT * FROM `%s` WHERE id = %s", self.tableName, id)
    return MySQL.query.await(query)
end

function BaseModel:save(id, data)
    local updates = {}

    for key, value in pairs(data) do
        local formattedValue
        if type(value) == "string" then
            formattedValue = string.format("'%s'", value)
        elseif type(value) == "number" then
            formattedValue = tostring(value)
        elseif type(value) == "boolean" then
            formattedValue = value and "1" or "0"
        else
            formattedValue = "NULL"
        end

        table.insert(updates, "`" .. key .. "` = " .. formattedValue)
    end

    local query = string.format("UPDATE `%s` SET %s WHERE id = %s",
        self.tableName,
        table.concat(updates, ", "),
        id)

    return MySQL.query.await(query)
end


function BaseModel:create(data)
    local columns = {}
    local values = {}

    for key, value in pairs(data) do
        table.insert(columns, "`" .. key .. "`")

        if type(value) == "string" then
            table.insert(values, string.format("'%s'", value))
        elseif type(value) == "number" then
            table.insert(values, tostring(value))
        elseif type(value) == "boolean" then
            table.insert(values, value and "1" or "0")
        else
            table.insert(values, "NULL")
        end
    end

    local query = string.format("INSERT INTO `%s` (%s) VALUES (%s)",
        self.tableName,
        table.concat(columns, ", "),
        table.concat(values, ", "))

    return MySQL.insert.await(query)
end


function BaseModel:delete(id)
    local query = string.format("DELETE FROM `%s` WHERE id = %s", self.tableName, id)
    return MySQL.query.await(query)
end

return BaseModel
