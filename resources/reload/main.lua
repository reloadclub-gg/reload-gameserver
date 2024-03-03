local Game = require('models.game')

function SaveMatch(matchData)
    local game = Game.create({
        id = matchData.match_id,
        match_type = matchData.match_type,
        map = matchData.map
    })
    print(game.map)
end

RegisterNetEvent("createMatch", function(data)
    local matchData = json.decode(data)
    SaveMatch(matchData)
end)
