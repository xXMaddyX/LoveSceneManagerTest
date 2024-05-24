local Player = require("player.player")
local World = require("worlds.world_one")

local Scene_LvL1 = {}

function Scene_LvL1:enter()
    self.world = World.new()
    self.world:createWorldBounds(0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    self.player = Player.new()
end

function Scene_LvL1:draw()
    self.player:draw()
    self.world:draw()
end

function Scene_LvL1:update(dt)
    self.world:update(dt)
    self.player:update(dt)
end

function Scene_LvL1:exit()

end

return Scene_LvL1
