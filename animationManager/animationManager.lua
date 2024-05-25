local AnimationManager = {}
AnimationManager.__index = AnimationManager

function AnimationManager.new()
    local instance = setmetatable({}, AnimationManager)
    instance.animPool = {}
    return instance
end

function AnimationManager:createAnim(spriteSheet, width, height, duration)
    local animation = {}
    animation.spriteSheet = spriteSheet
    animation.quads = {}
    local imageWidth = animation.spriteSheet:getWidth()
    local imageHeight = animation.spriteSheet:getHeight()

    for y = 0, imageHeight - height, height do
        for x = 0, imageWidth - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, imageWidth, imageHeight))
        end
    end

    animation.duration = duration
    animation.currentTime = 0

    table.insert(self.animPool, animation )
end
