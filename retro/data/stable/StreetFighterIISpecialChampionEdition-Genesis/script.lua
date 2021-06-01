ph = 176
eph = 176
el = 1

function calculate_reward ()
    local r = 0
    if data.health ~= 176 and data.health ~= 0 then
        local delta = data.health - ph
        r = r + delta
    end
    if data.enemy_health ~= 176 and data.enemy_health ~= 0 then
        local delta = data.enemy_health - eph 
        r = r - delta
    end
    if data.enemy_level ~=1 then
        local delta = data.enemy_level - el
        r = r + delta*100
    end
    el = data.enemy_level
    eph = data.enemy_health
    ph = data.health
    return r
end