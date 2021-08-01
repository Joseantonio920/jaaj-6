local attack={}
local all={}

function attack:new(x, y, w, h, type, time, force)
    local a=setmetatable({}, {__index=self})

    a.b=lp.newBody(world, x, y, "static")
    a.s=lp.newRectangleShape(w, h)
    a.f=lp.newFixture(a.b, a.s)
    a.type=type
    a.time=time
    a.force=force

    table.insert(all, a)
end

function attack:update(dt, id)
    if self.time~=nil then
        self.time=self.time-dt
        if self.time<=0 then
            self.f:destroy()
            table.remove(all, id)
        end
    end
end

function attack:beginContact(a, b, contact)
	local ua, ub=a:getUserData(), b:getUserData()
    
    if a==self.f and ub.type==self.type then
        ub.b:setLinearVelocity(-(self.b:getX()-ub.b:getX())*10, -(self.b:getY()-ub.b:getY())*10)
        ub.hited=true
        ub.dano=ua.force
	end
    if b==self.f and ua.type==self.type then
        ua.b:setLinearVelocity(-(self.b:getX()-ua.b:getX())*10, -(self.b:getY()-ua.b:getY())*10)
        ua.hited=true
        ua.dano=self.force
	end
end

function updateAllAttack(dt)
    for i, k in ipairs(all) do
        k:update(dt, i)
    end
end

function beginContactAllAttack(a, b, contact)
	for i, k in ipairs(all) do
		k:beginContact(a, b, contact)
	end
end

return attack