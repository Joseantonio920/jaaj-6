anim8=require "libs/anim8"
sti=require "libs/sti"
require "libs/math"

lg=love.graphics
lp=love.physics
lk=love.keyboard
lg.setDefaultFilter("nearest")

player=require "scr/player"
portal=require "scr/portal"
enemy=require "scr/enemy"
cam=require "scr/cam"
attack=require "scr/attack"

local bg=lg.newImage("assets/background.png")
local bc={0, .8, .8}
local bs=.2

function love.load()
	map=sti("map/1.lua", {"box2d"})
	lp.setMeter(32)
	world=lp.newWorld(0, 9.81*32, false)
	world:setCallbacks(beginContact, endContact)
	map:box2d_init(world)
	map.layers.solid.visible=false
	map.layers.enty.visible=false
	
	cam:load()
	spawnObjects()
end

function love.draw()
	lg.setColor(bc)
	lg.draw(bg)
	lg.setColor(1, 1, 1)
	
	cam:set()
	map:draw(lg:getWidth()/2-cam.x, lg:getHeight()/2-cam.y)
	player:draw()
	portal:draw()
	drawAllEnemy()
	drawAllAttack()
end

function love.update(dt)	
	bc[2]=bc[2]+bs*dt
	if bc[2]>1 or bc[2]<0 then bs=-bs end
	
	world:update(dt)
	player:update(dt)
	portal:update(dt)
	updateAllEnemy(dt)
	updateAllAttack(dt)
end

function beginContact(a, b, contact)
	player:beginContact(a, b, contact)
	portal:beginContact(a, b, contact)
	beginContactAllEnemy(a, b, contact)
	beginContactAllAttack(a, b, contact)
end

function endContact(a, b, contact)
	player:endContact(a, b, contact)
	endContactAllEnemy(a, b, contact)
end

function love.keypressed(key)
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