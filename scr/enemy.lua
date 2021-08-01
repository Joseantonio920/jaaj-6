local enemy={}
enemy.type="enemy"
enemy.img=lg.newImage("assets/enemy.png")
enemy.grid=anim8.newGrid(24, 32, enemy.img:getWidth(), enemy.img:getHeight())
enemy.force=20
enemy.spd=100
local all={}

function enemy:new(x, y)
	local e=setmetatable({}, {__index=self})

	e.b=lp.newBody(world, x, y, "dynamic")
	e.s=lp.newRectangleShape(24, 32)
	e.f=lp.newFixture(e.b, e.s)
	e.f:setFriction(0)
	e.b:setFixedRotation(true)
	e.b:setGravityScale(2)
	e.rad=160
	e.life=35
	e.hangry=false
	e.hited=false
	e.dano=0

	e.f:setUserData(e)
	
	e.idle=anim8.newAnimation(self.grid("1-3", 1), .25)
	e.state="idle"
	e.wall=nil
	
	table.insert(all, e)
end

function enemy:draw()
	if self.state=="idle" then
		self.idle:draw(self.img, self.b:getX(), self.b:getY(), self.b:getAngle(), 1, 1, 12, 16)
	end
end

function enemy:update(dt, id)
	self.id=id
	self:animation(dt)

	if self.dano>0 and self.life>0 then
		self.life=self.life-self.dano*dt
	end
	if self.life<=0 then self:kill(id) end

	self:move(dt)
	--attack:new(self.b:getX(), self.b:getY(), 24, 32, "player", .1, self.force)
end

function enemy:animation(dt)
	if self.state=="idle" then
		self.idle:update(dt)
	end
end

function enemy:kill(id)
	self.f:destroy()
	table.remove(all, id)
end

function enemy:move(dt)
	local hspd=0
	local dx, dy=player.b:getX()-self.b:getX(), player.b:getY()-self.b:getY()

	if not self.hangry then
		local r=math.sqrt(dx^2+dy^2)

		if r<self.rad then self.hangry=true end
	end
	if self.hangry then
		hspd=math.sign(dx)*self.spd
	end

	local vx, vy=self.b:getLinearVelocity()
	if self.hited then hspd=vx-200*math.sign(vx)*dt if math.abs(vx)<100 then self.hited=false end end

	self.b:setLinearVelocity(hspd, vy)
end

function enemy:beginContact(a, b, contact)
	if (a==self.f or b==self.f) and (a==player.f or b==player.f) then
		self.wall=contact
	end
end

function enemy:endContact(a, b, contact)
	if self.wall==contact then
		self.wall=nil
	end
end

function drawAllEnemy()
	for i, k in ipairs(all) do
		k:draw()
	end
end

function updateAllEnemy(dt)
	for i, k in ipairs(all) do
		k:update(dt, i)
	end
end

function beginContactAllEnemy(a, b, contact)
	for i, k in ipairs(all) do
		k:beginContact(a, b, contact)
	end
end

function endContactAllEnemy(a, b, contact)
	for i, k in ipairs(all) do
		k:endContact(a, b, contact)
	end
end

return enemy