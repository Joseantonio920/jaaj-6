local player={}

local function booltonum(n)
	return n and 1 or 0
end

function player:load(x, y)
	self.b=lp.newBody(world, x, y, "dynamic")
	self.s=lp.newRectangleShape(18, 28)
	self.f=lp.newFixture(self.b, self.s)
	self.f:setFriction(0)
	self.b:setFixedRotation(true)
	self.b:setGravityScale(2)
	self.f:setUserData(self)
	
	self.img=lg.newImage("assets/player.png")
	self.grid=anim8.newGrid(32, 32, player.img:getWidth(), player.img:getHeight())
	
	self.idle=anim8.newAnimation(self.grid("1-4", 3), .1)
	self.run=anim8.newAnimation(self.grid("1-4", 2), .1)
	self.up=anim8.newAnimation(self.grid("1-2", 1), .1)
	self.down=anim8.newAnimation(self.grid("3-4", 1), .1)
	self.back=anim8.newAnimation(self.grid("5-6", 1), .1)

	self.xscale=1
	self.state="idle"
	self.spd=250
	self.jumpForce=300
	self.wall=nil
	self.jump=false
	self.attack=false
	self.height=500
	self.animationTime=0
	
	self.life=100
	self.lifet=4
	self.dano=0
	self.hit=0
end

function player:draw()
	if self.state=="idle" then
		self.idle:draw(self.img, self.b:getX(), self.b:getY(), self.b:getAngle(), self.xscale, 1, 16, 18)
	elseif self.state=="run" then
		self.run:draw(self.img, self.b:getX(), self.b:getY(), self.b:getAngle(), self.xscale, 1, 16, 18)
	elseif self.state=="down" then
		self.down:draw(self.img, self.b:getX(), self.b:getY(), self.b:getAngle(), self.xscale, 1, 16, 18)
	elseif self.state=="back" then
		self.back:draw(self.img, self.b:getX(), self.b:getY(), self.b:getAngle(), self.xscale, 1, 16, 18)
	elseif self.state=="up" then
		self.up:draw(self.img, self.b:getX(), self.b:getY(), self.b:getAngle(), self.xscale, 1, 16, 18)
	end
	
	lg.setColor(1, 0, 0, self.lifet)
	lg.rectangle("fill", self.b:getX()-self.life/4, self.b:getY()-24, self.life/2, 5)
	lg.setColor(1, 1, 1)
end

function player:update(dt)
	self.lifet=self.lifet-dt
	self:animation(dt)
	if self.dano>0 and self.life>0 then
		self.life=self.life-self.dano
		self.lifet=4
	end
	
	self:move(dt)
	if self.attack then
		attack:new(self.b:getX()+16*self.xscale, self.b:getY(), 8, 32, "enemy", .2)
		
		self.attack=false
	end
	cam:moveTo(self.b:getX(), self.b:getY(), dt)
end

function player:move(dt)
	local left=booltonum(lk.isDown("a", "left"))
	local right=booltonum(lk.isDown("d", "right"))
	local vx, vy=self.b:getLinearVelocity()
	if vy>1000 then love.event.quit() end
	local hspd=(right-left)*self.spd
	if self.hit>0 then hspd=vx end
	self.hit=self.hit-dt

	self:updateState(hspd, vy)

	if self.wall~=nil and self.jump then
		vy=-self.jumpForce
	end
	self.b:setLinearVelocity(hspd, vy)
end

function player:setState(new)
	if self.state~=new then
		self.animationTime=0
		self[new]:gotoFrame(1)
	end
	self.state=new
end

function player:updateState(hspd, vspd)
	if self.state~="back" then
		if hspd~=0 then
			self.xscale=math.sign(hspd)
			self:setState("run")
		else
			self:setState("idle")
		end

		if self.wall==nil then
			if vspd>0 then
				self:setState("down")
			elseif vspd<0 then
				self:setState("up")
			end
		end
	elseif self.animationTime>=.2 then
		self:setState("idle")
	end
end

function player:animation(dt)
	if self.state=="idle" then
		self.idle:update(dt)
	elseif self.state=="run" then
		self.run:update(dt)
	elseif self.state=="down" then
		self.down:update(dt)
	elseif self.state=="back" then
		self.back:update(dt)
	elseif self.state=="up" then
		self.up:update(dt)
	end

	self.animationTime=self.animationTime+dt
end


function player:beginContact(a, b, contact)
	local nx, ny=contact:getNormal()
	local vx, vy=self.b:getLinearVelocity()
	
	if a==self.f then
		if ny>0 then
			self.wall=contact
			if vy>self.height then self:setState("back") end
		end
	elseif b==self.f then
		if ny<0 then
			self.wall=contact
			if vy>self.height then self:setState("back") end
		end
	end
end

function player:endContact(a, b, contact)
	if a==self.f or b==self.f then
		if self.wall==contact then
			self.wall=nil
			self.jump=false
		end
	end
end

function player:keypressed(key)
	if key=="space" or key=="up" then
		self.jump=true
	elseif key=="z" then
		self.attack=true
	end
end

return player