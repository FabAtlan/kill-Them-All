local settings = {
  -- Game title
  title = 'kTA | kill Them All',
  -- Window size
  screen = { width ='1200', height = '768'},
  state = {
    logo = require('logo'),
    menu = "",
    game = ""
  }
}

local set = settings

set.load = function() 
  setTitle(set.title)
  setMode(set.screen.width, set.screen.height)
end

return settings