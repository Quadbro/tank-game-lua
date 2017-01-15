local assets = require "src.assets"
local PlayerControlSystem = tiny.processingSystem(class "PlayerControlSystem")

PlayerControlSystem.filter = tiny.requireAll("controlable")

function PlayerControlSystem:process(e, dt)
	local vel =	e.vel
	local p = e.platforming
	-- Moving
	local f, b = love.keyboard.isDown('w'), love.keyboard.isDown('s')
	--Rotation
	local l, r = love.keyboard.isDown('a'), love.keyboard.isDown('d')

	if f and not b then
		p.moving = true
		p.direction = 'f'
	elseif b and not f then
		p.moving = true
		p.direction = 'b'
	else
		p.moving = false
	end

	if l and not r then
		p.rotating = true
		p.rotDirection = 'l'
	elseif b and not f then
		p.ritating = true
		p.rotDirection = 'r'
	else
		p.rotating = false
	end

end

return PlayerControlSystem
