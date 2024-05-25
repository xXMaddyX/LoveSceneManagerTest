-- AnimationStore.lua
local AnimationManager = require("animationManager.animationManager")
local AnimationStore = {}
AnimationStore.Pool = {}
AnimationStore.Animations = {}

function AnimationStore:addAnimation(key, spriteSheet, width, height, duration)
    local newAnimation = AnimationManager.new()
    newAnimation:createAnim(key, spriteSheet, width, height, duration)
    self.Animations[key] = newAnimation
end

function AnimationStore:play(key)
    local animation = self.Animations[key]
    if animation then
        table.insert(self.Pool, animation)
    end
end

function AnimationStore:update(dt)
    for i = 1, #self.Pool, 1 do
        self.Pool[i]:update(dt)
    end
end

function AnimationStore:draw()
    for i = 1, #self.Pool, 1 do
        self.Pool[i]:draw()
    end
end

return AnimationStore
