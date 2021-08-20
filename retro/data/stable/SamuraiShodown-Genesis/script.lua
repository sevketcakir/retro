previous_score = 0
ph = 128
eph = 128
el = 0

function calculate_reward ()
    local r = 0
    if data.health ~= 128 and data.health ~= 0 then
        local delta = data.health - ph
        r = r + delta
    end
    if data.enemy_health ~= 128 and data.enemy_health ~= 0 then
        local delta = data.enemy_health - eph 
        r = r - delta
    end
    if data.enemy_level ~=0 then
        local delta = data.enemy_level - el
        r = r + delta*100
    end
    el = data.enemy_level
    eph = data.enemy_health
    ph = data.health
    return r
end

function correct_score ()
  if data.score > previous_score then
    local delta = data.score - previous_score
    previous_score = data.score
    return delta
  else
    return 0
  end
end
