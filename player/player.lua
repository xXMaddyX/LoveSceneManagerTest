local Player = {}
Player.__index = Player
local KEY_ELF_SHEET_IDLE = "assets/idle_1-Sheet.png"

function Player.new()
    local instance = setmetatable({}, Player)
    instance.image = ""
    instance.x = 100
    instance.y = 100
    instance.scale = 2
    instance.animationSpeed = 10
    instance:newAnimation(love.graphics.newImage(KEY_ELF_SHEET_IDLE),288, 128, 12)
    return instance
end

function Player:newAnimation(image, width, height, duration)
    self.animation = {}
    self.animation.spriteSheet = image
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

function Player:update(dt)
    self.animation.currentTime = self.animation.currentTime + dt * self.animationSpeed
    if self.animation.currentTime >= self.animation.duration then
        self.animation.currentTime = self.animation.currentTime - self.animation.duration
    end

    if love.keyboard.isDown("right") then
        self.x = self.x + 3
    end
    if love.keyboard.isDown("left") then
        self.x = self.x - 3
    end
    if love.keyboard.isDown("up") then
        self.y = self.y - 3
    end
    if love.keyboard.isDown("down") then
        self.y = self.y + 3
    end
end

function Player:draw()
    local spriteNum = math.floor(self.animation.currentTime / self.animation.duration * #self.animation.quads) + 1
    love.graphics.draw(self.animation.spriteSheet, self.animation.quads[spriteNum], self.x, self.y, 0, self.scale, self.scale)
end

return Player
