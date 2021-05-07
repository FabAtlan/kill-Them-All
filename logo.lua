local logo = {}

function createSprite(list, img)
  local sp = {}
  sp.x      = 0
  sp.y      = 0
  sp.vx     = 0
  sp.vy     = 0
  sp.speed  = 0
  sp.spdMax = 0
  sp.img    = newImg(img)
  sp.quad   = {}
  sp.width, sp.height = sp.img:getDimensions()
  sp.flipx  = 1
  local id  = 1
  for line = 1, sp.width/64 do
    for column = 1, sp.height/64 do
      local x, y = (column - 1) * 64, (line - 1) * 64
      sp.quad[id] = lg.newQuad(x, y, 64, 64, sp.width, sp.height)
      id = id + 1
    end
  end
  table.insert(list, sp)
end

listSprites = {}

createSprite(listSprites, 'sprite.png')
local hero = listSprites[1]
hero.x = 150
hero.y = 150
hero.speed = 150
hero.spdMax = hero.speed * 1.5
hero.friction = hero.spdMax * 3

logo.update = function (dt)
  if keyb('right') then
    hero.flipx = 1
    hero.vx = math.min(hero.spdMax, hero.vx + (hero.speed * dt))
  else
    if hero.vx > 0 then
      hero.vx = math.max(0, hero.vx - (hero.friction * dt))
    end
  end

  if keyb('left') then
    hero.flipx = -1
    hero.vx = math.max(- hero.spdMax, hero.vx - (hero.speed * dt))
  else
    if hero.vx < 0 then
      hero.vx = math.min(0, hero.vx + (hero.friction * dt))
    end
  end
  
  if keyb('down') then
    -- hero.flipx = 1
    hero.vy = math.min(hero.spdMax, hero.vy + (hero.speed * dt))
  else
    if hero.vy > 0 then
      hero.vy = math.max(0, hero.vy - (hero.friction * dt))
    end
  end

  if keyb('up') then
    -- hero.flipx = -1
    hero.vy = math.max(- hero.spdMax, hero.vy - (hero.speed * dt))
  else
    if hero.vy < 0 then
      hero.vy = math.min(0, hero.vy + (hero.friction * dt))
    end
  end
  hero.x = hero.x + (hero.vx * dt)
  hero.y = hero.y + (hero.vy * dt)
end

logo.draw = function ()
  Print('Logo state')
  for i = #listSprites, 1, -1 do
    local sp = listSprites[i]
    Draw(sp.img, sp.quad[1], sp.x, sp.y, 0, sp.flipx, 1, 64/2)
    Rect('line', hero.x - 64/2, hero.y, 64, 64)
    Print(hero.vx, hero.x, hero.y)
  end
end

return logo