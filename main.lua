local sceneManager = require("sceneManager.sceneManager")
local scene_LvL1 = require("scenes.scene_one")

function love.load()
    sceneManager:changeScene(scene_LvL1)
end

function love.draw()
    sceneManager:draw()
end

function love.update(dt)
    sceneManager:update(dt)
end
