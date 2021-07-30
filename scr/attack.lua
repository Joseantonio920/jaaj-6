local attack={}
local all={}

function attack:new(x, y, w, h, type, time)
    local a={}
    a.b=lp.newBody(world, x, y, "static")
    a.s=lp.newRectangleShape(w, h)
    a.f=lp.newFixture(a.b, a.s)
    a.type=type
    a.time=time

    table.insert(all, setmetatable(a, {__index=self}))
end

function attack:draw()
    lg.polygon("fill", self.b:getWorldPoints(self.s:getPoints()))
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
		ub:kill()
	elseif b==self.f and ua.type==self.type then
        ua:kill()
	end
end

function drawAllAttack()
    for i, k in ipairs(all) do
        k:draw()
    end
end

function updateAllAttack(dt)
    for i, k in ipairs(all) do
        k:update(dt, id)
    end
end

function beginContactAllAttack(a, b, contact)
	for i, k in ipairs(all) do
		k:beginContact(a, b, contact)
	end
end

return attack