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
    self.IdleAnim:createAnim("Elf-Idle", KEY_ELF_SHEET_IDLE, 288, 128, 1, 20, 2)

    self.RunAnim = AnimationManager.new(self.x, self.y)
    self.RunAnim:createAnim("Elf-Run", KEY_ELF_SHEET_RUN, 288, 128, 1, 20, 2)
end

function Player:update(dt)
    self.isMoving = false;

    if love.keyboard.isDown("right") then
        self.x = self.x + 3
        self.RunAnim:SetXY(self.x, self.y)
        self.RunAnim:update(dt)
        self.isMoving = true
    end
    if love.keyboard.isDown("left") then
        self.x = self.x - 3
        self.RunAnim:SetXY(self.x, self.y)
        self.RunAnim:update(dt)
        self.isMoving = true
    end
    if love.keyboard.isDown("up") then
        self.y = self.y - 3
        self.isMoving = true
    end
    if love.keyboard.isDown("down") then
        self.y = self.y + 3
        self.isMoving = true
    end

    if not self.isMoving then
        self.IdleAnim:SetXY(self.x, self.y)
        self.IdleAnim:update(dt)
    end

end

function Player:draw()
    if self.isMoving then
        self.RunAnim:draw()
    end
    if not self.isMoving then
        self.IdleAnim:draw()
    end
end

return Player