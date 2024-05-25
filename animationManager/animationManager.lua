-- AnimationManager.lua
local AnimationManager = {}
AnimationManager.__index = AnimationManager

function AnimationManager.new()
    local instance = setmetatable({}, AnimationManager)
    instance.x = 0
    instance.y = 0
    instance.scale = 1
    instance.animationSpeed = 1
    return instance
end

function AnimationManager:createAnim(animKey, spriteSheet, width, height, duration)
    self.animation = {}
    self.animation.key = animKey
    self.animation.spriteSheet = spriteSheet
    self.animation.quads = {}
    local imageWidth = self.animation.spriteSheet:getWidth()
    local imageHeight = self.animation.spriteSheet:getHeight()

    for y = 0, imageHeight - height, height do
        for x = 0, imageWidth - width, width do
            table.insert(self.animation.quads, love.graphics.newQuad(x, y, width, height, imageWidth, imageHeight))
        end
    end

    self.animation.duration = duration
    self.animation.currentTime = 0
end

function AnimationManager:update(dt)
    self.animation.currentTime = self.animation.currentTime + dt * self.animationSpeed
    if self.animation.currentTime >= self.animation.duration then
        self.animation.currentTime = self.animation.currentTime - self.animation.duration
    end
end

function AnimationManager:draw()
    local spriteNum = math.floor(self.animation.currentTime / self.animation.duration * #self.animation.quads) + 1
    love.graphics.draw(self.animation.spriteSheet, self.animation.quads[spriteNum], self.x, self.y, 0, self.scale, self.scale)
end

return AnimationManager
