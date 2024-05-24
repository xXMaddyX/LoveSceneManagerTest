local Player = {}
Player.__index = Player

function Player.new()
    local instance = setmetatable({}, Player)
    instance.image = ""
    instance.x = 100
    instance.y = 100
    return instance
end

function Player:draw()
    love.graphics.circle("fill", self.x, self.y, 100)
end

function Player:update(dt)
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

return Player