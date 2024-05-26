local AnimationManager = require("animationManager.animationManager")

local Player = {}
Player.__index = Player
local KEY_ELF_SHEET_IDLE = "assets/idle_1-Sheet.png"
local KEY_ELF_SHEET_RUN = "assets/run_1-Sheet.png"

function Player.new()
    local instance = setmetatable({}, Player)
    instance.image = ""
    instance.x = 100
    instance.y = 100
    instance:initAnimation()
    return instance
end

function Player:initAnimation()
    self.IdleAnim = AnimationManager.new(self.x, self.y)
    self.IdleAnim:createAnim("Elf-Idle", KEY_ELF_SHEET_IDLE, 288, 128, 1, 20, 2, 2)

    self.RunAnimRight = AnimationManager.new(self.x, self.y)
    self.RunAnimRight:createAnim("Elf-Run-right", KEY_ELF_SHEET_RUN, 288, 128, 1, 20, 2, 2)

    self.RunAnimLeft = AnimationManager.new(self.x, self.y)
    self.RunAnimLeft:createAnim("Elf-Run-left", KEY_ELF_SHEET_RUN, 288, 128, 1, 20, -2, 2)
end

function Player:update(dt)
    self.isMovingLeft = false;
    self.isMovingRight = false

    if love.keyboard.isDown("right") then
        self.x = self.x + 3
        self.RunAnimRight:SetXY(self.x, self.y)
        self.RunAnimRight:update(dt)
        self.isMovingRight = true
    end
    if love.keyboard.isDown("left") then
        self.x = self.x - 3
        self.RunAnimLeft:SetXY(self.x + 566, self.y)
        self.RunAnimLeft:update(dt)
        self.isMovingLeft = true
    end
    if love.keyboard.isDown("up") then
        self.y = self.y - 3
        self.isMoving = true
    end
    if love.keyboard.isDown("down") then
        self.y = self.y + 3
        self.isMoving = true
    end

    if not self.isMovingRight and not self.isMovingLeft then
        self.IdleAnim:SetXY(self.x, self.y)
        self.IdleAnim:update(dt)
    end

end

function Player:draw()
    if self.isMovingRight then
        self.RunAnimRight:draw()
    end
    if self.isMovingLeft then
        self.RunAnimLeft:draw()
    end
    if not self.isMovingRight and not self.isMovingLeft then
        self.IdleAnim:draw()
    end
end

return Player