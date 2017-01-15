local assets =  require "src.assets"
local gamestate = require "lib.gamestate"

local Player = class("Player")

function Player:draw(dt)

end

function Player:onHit()

end

function Player:onCollision(col)
    self:onHit()
end

function Player:init(args)
    self.cameraTrack = {xoffset = 16, yoffset = -35}
    self.pos = {x = args.x, y = args.y}
    self.vel = {x = 0, y = 0}
    self.gravity = 1300
    self.platforming = {
        acceleration = 1000,
        speed = 130,
        friction = 2000,
        moving = false,
        rotating = false

    }
    self.isAlive = true
    self.isPlayer = true
    self.isSolid = true
    self.controlable = true
    self.hitbox = {w = 32, h = 32}
    self.checkCollisions = true
    self.sprite = assets.img_tankTest
    self.fg = true

    self.health = 100
    self.maxHealth = 100
    self.shotTimer = 0
    self.shotInterval = 0.45
    self.gunAngle = 2 * math.pi
    self.hasGun = true
end

return Player
