local World = {}
World.__index = World

function World.new()
    local instance = setmetatable({}, World)
    instance.world = love.physics.newWorld(0, 100, true)
    return instance
end

function World:createWorldBounds(x, y, width, height)
    -- Top bound
    self.top = {}
    self.top.body = love.physics.newBody(self.world, x + width / 2, y, "static")
    self.top.shape = love.physics.newRectangleShape(width, 50)
    self.top.fixture = love.physics.newFixture(self.top.body, self.top.shape)

    -- Left bound
    self.left = {}
    self.left.body = love.physics.newBody(self.world, x, y + height / 2, "static")
    self.left.shape = love.physics.newRectangleShape(50, height)
    self.left.fixture = love.physics.newFixture(self.left.body, self.left.shape)

    -- Right bound
    self.right = {}
    self.right.body = love.physics.newBody(self.world, x + width, y + height / 2, "static")
    self.right.shape = love.physics.newRectangleShape(50, height)
    self.right.fixture = love.physics.newFixture(self.right.body, self.right.shape)

    -- Bottom bound
    self.bottom = {}
    self.bottom.body = love.physics.newBody(self.world, x + width / 2, y + height, "static")
    self.bottom.shape = love.physics.newRectangleShape(width, 50)
    self.bottom.fixture = love.physics.newFixture(self.bottom.body, self.bottom.shape)
end

function World:draw()
    love.graphics.setColor(1, 1, 1)
    
    -- Drawing top bound
    love.graphics.polygon("line", self.top.body:getWorldPoints(self.top.shape:getPoints()))
    -- Drawing left bound
    love.graphics.polygon("line", self.left.body:getWorldPoints(self.left.shape:getPoints()))
    -- Drawing right bound
    love.graphics.polygon("line", self.right.body:getWorldPoints(self.right.shape:getPoints()))
    -- Drawing bottom bound
    love.graphics.polygon("line", self.bottom.body:getWorldPoints(self.bottom.shape:getPoints()))
end

function World:update(dt)
    self.world:update(dt)
end

return World
