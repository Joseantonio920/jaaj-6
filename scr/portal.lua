local portal={}

function portal:load(x, y)
	self.img=lg.newImage("assets/portal.png")
	self.b=lp.newBody(world, x, y, "static")
	self.s=lp.newCircleShape(32)
	self.f=lp.newFixture(self.b, self.s)
	self.spd=20
end

function portal:draw()
	lg.draw(self.img, self.b:getX(), self.b:getY(), self.b:getAngle(), 1, 1, 32, 32)
end

function portal:update(dt)
	self.b:setAngle(self.b:getAngle()+self.spd*dt)
end

function portal:beginContact(a, b, contact)
	if (a==self.f or b==self.f) and (a==player.f or b==player.f) then
		love.event.quit()
	end
end

return portal