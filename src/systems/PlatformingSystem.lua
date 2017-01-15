local assets = require "src.assets"

local PlatformingSystem = tiny.processingSystem(class "PlatformingSystem")

PlatformingSystem.filter = tiny.requireAll("pos", "vel", "platforming")

function PlatformingSystem:process(e, dt)
    local pos = e.pos
    local vel = e.vel
    local platforming = e.platforming
    local acceleration = platforming.acceleration
    local friction = platforming.friction
    local speed = platforming.speed
    local direction = platforming.direction

    if platforming.moving then
        if direction == 'f' then
            vel.y = math.max(-speed, vel.y - acceleration * dt)
            print(vel.y)
        elseif direction == 'b' then
            vel.y = math.min(speed, vel.y + acceleration * dt)
        end
    else
        if vel.y > 0 then
            vel.y = math.max(0, vel.y - friction * dt)
        elseif vel.y < 0 then
            vel.y = math.min(0, vel.y + friction * dt)
        end
    end

    pos.y = pos.y + vel.y * dt

end

return PlatformingSystem
