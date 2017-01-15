local gamestate = require "lib.gamestate"
local suit = require "lib.SUIT"
local gamera = require "lib.gamera"
local HC = require "lib.HC"
local Player = require("src.entities.Player")


local Battleground = class "Battleground"

local player_data = {
    id = 1,
    name = "",
    type = "Player",
    shape = "rectangle",
    x = 100,
    y = 100,
    width = 16,
    height = 32,
    rotation = 0,
    visible = true,
    properties = {}
}


function Battleground:load()
    --local bumpWorld = bump.newWorld(tileMap.tilewidth * 2)
    local camera = gamera.new(0, 0, 2000, 2000)
    self.camera = camera

    local world = tiny.world(
        require ("src.systems.UpdateSystem")(),
        require ("src.systems.PlayerControlSystem")(),
        require ("src.systems.PlatformingSystem")(),
        require ("src.systems.SpriteSystem")(camera, "fg")
    )

    local player = Player(player_data)
    world:add(player)

    -- globals
    _G.camera = camera
    _G.world = world
end

function Battleground:update(dt)

end

function Battleground:draw()
    
end

return Battleground
