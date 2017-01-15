local suit = require "lib.SUIT"
local gamestate = require "lib.gamestate"
local Battleground = require "src.states.Battleground"


local MainMenu = class "MainMenu"

local config = {
  posStart = {x = 15, y = 100},
  sizeBtn = {w = 150, h = 40},
  hSpace = 10
}

-- Menu containers
local curMenu = {}
local menu = {}

function MainMenu:load()
  -- Menu initialization
  menu = {
    {
      text = "Campaign",
      submenu = {
        {
          text = "Continue",
          submenu = {},
          handler = function()
          end},
        {
          text = "New",
          submenu = {},
          handler = function()
          end},
        {
          text = "Back",
          submenu = {},
          handler = function()
            switchTo(menu)
          end},
      },
      handler = function()
        switchTo(menu[1].submenu)
      end
    },
    {
      text = "Battleground",
      submenu = {
        {
          text = "Start warfare",
          submenu = {},
          handler = function()
            gamestate.switch(Battleground)
          end},
        {
          text = "Back",
          submenu = {},
          handler = function()
            switchTo(menu)
          end},
      },
      handler = function()
        switchTo(menu[2].submenu)
      end},
    {
      text = "Multiplayer",
      handler = function()
      end},
    {
      text = "My vehicles",
      handler = function()
      end},
    {
      text = "Options",
      handler = function()
      end},
    {
      text = "Mods",
      handler = function()
      end},
    {
      text = "Credits",
      handler = function()
      end},
    {
      text = "Quit",
      handler = function()
        love.event.quit()
      end},
  }

  campaignMenu = {
    {text = "Continue", handler = function()
    end},
    {text = "New", handler = function()
    end},
    {text = "Back", handler = function()
      switchTo(menu)
    end},
  }

  switchTo(menu)
end

function MainMenu:update(dt)
  buildMenu(curMenu)
end

function MainMenu:draw()
	suit.draw()
end


-- Helper functions
function switchTo(_menu)
  curMenu = _menu
end


-- Main
function buildMenu(_menu)
  -- cache vars
  local pos = {
    x = config.posStart.x,
    y = config.posStart.y
  }

  -- Iterate through input table
  for k,v in ipairs(_menu) do
    if suit.Button(v.text, pos.x, pos.y, config.sizeBtn.w, config.sizeBtn.h).hit then
      -- Apply handler
      v.handler()
    end

    -- Offset for next element
    pos.y = pos.y + config.sizeBtn.h + config.hSpace
  end
end

return MainMenu
