local SceneManager = {}
SceneManager.actualScene = nil

function SceneManager:changeScene(newScene)
    if self.actualScene and self.actualScene.exit then
        self.actualScene:exit()
    end

    self.actualScene = newScene

    if self.actualScene and self.actualScene.enter then
        self.actualScene:enter()
    end
end

function SceneManager:draw()
    if self.actualScene and self.actualScene.draw then
        self.actualScene:draw()
    end
end

function SceneManager:update(dt)
    if self.actualScene and self.actualScene.update then
        self.actualScene:update(dt)
    end
end


return SceneManager