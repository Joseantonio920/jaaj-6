player=require "scr/player"
portal=require "scr/portal"
enemy=require "scr/enemy"
cam=require "scr/cam"
attack=require "scr/attack"

local game={}
local bg=lg.newImage("assets/background.png")
local bc={0, .8, .8}
local bs=.2

function game:load()
	map=sti("map/1.lua", {"box2d"})
	map:box2d_init(world)
	map.layers.solid.visible=false
	map.layers.enty.visible=false
	
	cam:load()
	spawnObjects()
end

function game:draw()
	map:resize(lg:getWidth()/sx, lg:getHeight()/sy)
	
	lg.setColor(bc)
	lg.draw(bg)
	lg.setColor(1, 1, 1)

	cam:set()
	map:draw(width/2-cam.x+tx, height/2-cam.y+ty, sx, sy)
	player:draw()
	portal:draw()
	drawAllEnemy()
end

function game:update(dt)
	bc[2]=bc[2]+bs*dt
	if bc[2]>1 or bc[2]<0 then bs=-bs end
	
	player:update(dt)
	portal:update(dt)
	updateAllEnemy(dt)
	updateAllAttack(dt)
end

function game:beginContact(a, b, contact)
	player:beginContact(a, b, contact)
	portal:beginContact(a, b, contact)
	beginContactAllEnemy(a, b, contact)
	beginContactAllAttack(a, b, contact)
end

function game:endContact(a, b, contact)
	player:endContact(a, b, contact)
	endContactAllEnemy(a, b, contact)
end

function game:keypressed(key)
	player:keypressed(key)
end

function spawnObjects()
	for i, k in ipairs(map.layers.enty.objects) do
		if k.type=="player" then
			player:load(k.x+k.width/2, k.y+k.height/2)
		elseif k.type=="portal" then
			portal:load(k.x+k.width/2, k.y+k.height/2)
		elseif k.type=="enemy" then
			enemy:new(k.x+k.width/2, k.y+k.height/2)
		end
	end
end

return game