io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
-- Fonctions love2D
require('globals')
local set = require('settings')
local state = set.state

stateGame = state.logo

function love.load()
  set.load()
  stateGame = state.logo
end

function love.update(dt)
  if stateGame.update ~= nil then
    stateGame.update(dt)
  end
end

function love.draw()
  love.graphics.setBackgroundColor(.5, .6, .2)
  if stateGame.draw ~= nil then
     stateGame.draw()
  else
    Print('NIL')
  end
end

function love.keypressed(k)
  if k == "f12" then Quit("")
  elseif k == "escape" then Quit("r") end
end