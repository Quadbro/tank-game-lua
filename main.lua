class = require "lib.30log"
tiny = require "lib.tiny"
gamestate = require "lib.gamestate" -- slightly modified to play nice;y with 30log

local MainMenu = require "src.states.MainMenu"
local Battleground = require "src.states.Battleground"
local Test = require "src.states.Test"

local assets = nil

local beholder = require "lib.beholder"


function love.load()
	assets = require "src.assets" -- load assets
	gamestate.registerEvents()
	gamestate.switch(MainMenu())
end

function love.draw()
		local dt = love.timer.getDelta()
		if world then
			world:update(dt)
		end
end

function love.update(dt)
	local s = gamestate.current()
end
