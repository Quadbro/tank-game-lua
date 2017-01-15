local multisource = require "lib.multisource"

local assets = {}

love.graphics.setDefaultFilter("nearest", "nearest")

assets.img_tankTest = love.graphics.newImage("assets/img/tank_test.png")
assets.img_testBG = love.graphics.newImage("assets/img/testBG.png")

return assets
