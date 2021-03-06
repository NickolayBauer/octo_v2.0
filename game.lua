local composer = require("composer"); -- вызов библиотеки Composer
local widget = require("widget");
local physics = require("physics");
local scene = composer.newScene(); -- создаём новую сцену

function scene:create(event)
	local sceneGroup = self.view;
	
	physics.start();
		local background = display.newImageRect("images/b.jpg",_W,_H+50);
		background.x =_W/2
		background.y=_H/2
		octo = display.newImageRect("images/octo.png",150,100);
		octo.x = _W/2
		octo.y = _H - 50
		physics.addBody( octo,"static", { density=2.9, friction=0.5, bounce=0.7, radius=40 } );

 
		local mamont = false


		function octo:touch(e)
		
		if (e.phase == "moved") then
		--45 -266
		if mamont  == false then
		octo.x = e.x
		else 
			octo.bodyType = "dynamic" 
		
		end
		end
	-- body
		end


local size = 150
local tapText = display.newText( 0, display.contentCenterX,  display.contentCenterY, native.systemFont, size)



 


local randomBall = function()
	
	
	if mamont  == false then
	local a = math.random(50,200)
	bomb = display.newImageRect( "images/bomb.png",a,a);
	bomb.x = math.random( _W )
	bomb.y = -50
	bomb.rotation = math.random(-180,180)
	physics.addBody( bomb , { density=2.9, friction=0.5, bounce=0.7, radius=24 } );
	tapText.text = tapText.text + 1
	
	if spawnTimer._delay > 0 then
	spawnTimer._delay=spawnTimer._delay-5
	end
	
		end
end

spawnTimer = timer.performWithDelay(1000, randomBall, 100000 )

function octo:collision(event)
	
	if (event.phase == "ended") then
	mamont = true

	
	

	local button = widget.newButton {
			shape = 'roundedRect',
    		raidus = 10,
    		width = _W*0.85,
    		height = '70',
    		fillColor = { default={ 255,0, 0 }, over={ 0, 149/255, 59/255 } },
		    labelColor = { default={ 1 }, over={ 1 } },
			fontSize = 32,
			label = "ещё раз?",
			y = _H/2*0.30,
			x = _W/2,

			onPress = function (event)
					 event.target:removeSelf() 
   					 event.target = nil
					 mamont = false
					 tapText.text = 0
					 octo.bodyType = "static"
					 octo.x = _W/2
					 octo.y = _H - 50
					 octo.rotation = 0
					 spawnTimer._delay = 1000
					 
					end
										}
		
	end

end


octo:addEventListener('collision',octo)
octo:addEventListener("touch",octo)


----------------------------------------------------
end

scene:addEventListener("create", scene);
return scene;


