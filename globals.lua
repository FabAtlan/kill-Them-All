lg = love.graphics
lv = love.event
setTitle = love.window.setTitle
setMode = love.window.setMode
Print = lg.print
newImg = lg.newImage
Draw = lg.draw
keyb = love.keyboard.isDown

Quit = function(mode)
  if mode == "" then lv.quit("")
  elseif mode == "r" then lv.quit("restart") end
end

Rect = function(mode, x, y, width, height, radius)
  love.graphics.rectangle(mode, x, y, width, height, radius)
end

Circ = function(mode, x, y, radius)
  love.graphics.circle(mode, x, y, radius)
end