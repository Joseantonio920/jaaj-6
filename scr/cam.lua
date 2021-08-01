local cam={}

function cam:load()
    self.x=0
    self.y=0
    self.spd=20
end

function cam:moveTo(newX, newY, dt)
    self.x=math.lerp(self.x, newX, self.spd*dt)
    self.y=math.lerp(self.y, newY, self.spd*dt)
end

function cam:set()
    lg.translate(width/2-self.x, height/2-self.y)
end

return cam