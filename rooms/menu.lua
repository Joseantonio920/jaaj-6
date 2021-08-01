local menu={}
menu.name="menu super mega pika"

function menu:load()
	self.bt={}
	self.bt.b=lp.newBody(world, width/2, height/2, "dynamic")
	self.bt.s=lp.newRectangleShape(font:getWidth(self.name), font:getHeight(self.name))
	self.bt.f=lp.newFixture(self.bt.b, self.bt.s)
	self.bt.b:setGravityScale(0)

	self.m={}
	self.m.b=lp.newBody(world, lm:getX(), lm:getY(), "static")
	self.m.s=lp.newRectangleShape(10, 10)
	self.m.f=lp.newFixture(self.m.b, self.m.s)
	self.m.wall=nil
end

function menu:draw()
	--lg.polygon("fill", self.bt.b:getWorldPoints(self.bt.s:getPoints()))
	--lg.polygon("fill", self.m.b:getWorldPoints(self.m.s:getPoints()))
	lg.print("aperte spaço ou clique no testo com a melhor fictuer", 0, 0)
	lg.print(self.name, self.bt.b:getX(), self.bt.b:getY(), self.bt.b:getAngle(), 1, 1, font:getWidth(self.name)/2, font:getHeight(self.name)/2)
end

function menu:update(dt)
	self.bt.b:setAngle(self.bt.b:getAngle()+dt)
	self.m.b:setPosition(lm:getX()/sx-tx, lm:getY()/sy-ty)
	if self.m.wall~=nil and lm.isDown(1) then
		self.bt.f:destroy()
		self.m.f:destroy()
		
		room=require "rooms/game"
		room:load()
	end
end

function menu:beginContact(a, b, contact)
	if (a==self.bt.f and b==self.m.f) or (a==self.m.f and b==self.bt.f) then
		self.m.wall=contact
	end
end

function menu:endContact(a, b, contact)
	if (a==self.bt.f and b==self.m.f) or (a==self.m.f and b==self.bt.f) then
		self.m.wall=nil
	end
end

function menu:keypressed(key)
	if key=="space" then
		room=require "rooms/game"
		room:load()
	end
end

return menu