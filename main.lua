width, height=320, 240

anim8=require "libs/anim8"
sti=require "libs/sti"
require "libs/math"

lg=love.graphics
lp=love.physics
lk=love.keyboard
lm=love.mouse
lg.setDefaultFilter("nearest")

font=lg.getFont()
room=require "rooms/menu"

lg.clear()
lg.print("loading", lg:getWidth()/2, lg:getHeight()/2, 0, 1, 1, font:getWidth("loading")/2, font:getHeight("loading")/2)
lg.present()

tx, ty=0, 0
sx, sy=1, 1

function love.load()
	lp.setMeter(32)
	world=lp.newWorld(0, 9.81*32, false)
	world:setCallbacks(beginContact, endContact)
	
	room:load()
end

function love.draw()
	sx, sy=lg:getWidth()/width, lg:getHeight()/height
	tx, ty=0, 0
	local mode=0
	if sx>sy then sx=sy mode=1 end
	if sx<sy then sy=sx mode=2 end
	tx=(lg:getWidth()/sx-width)/2
	ty=(lg:getHeight()/sy-height)/2

	lg.scale(sx, sy)
	lg.push()
	lg.translate(tx, ty)
	
	lg.setColor(1, 1, 1)
	room:draw()
	
	lg.pop()
	lg.setColor(0, 0, 0)
	if mode==1 then
		lg.rectangle("fill", 0, 0, tx, height)
		lg.rectangle("fill", lg:getWidth()/sx-tx, 0, tx, height)
	elseif mode==2 then
		lg.rectangle("fill", 0, 0, width, ty)
		lg.rectangle("fill", 0, lg:getHeight()/sy-ty, width, ty)
	end
end

function love.update(dt)	
	world:update(dt)
	room:update(dt)
end

function beginContact(a, b, contact)
	room:beginContact(a, b, contact)
end

function endContact(a, b, contact)
	room:endContact(a, b, contact)
end

function love.keypressed(key)
	if key=="f11" then
		love.window.setFullscreen(not love.window.getFullscreen())
	end
	room:keypressed(key)
end