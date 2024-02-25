function onCreate()
	-- background shit
	makeLuaSprite('back', 'stages/arrivalWeek-assets/arrival-stage1/forest-back', -750, -300);
	setScrollFactor('back', 0, 0.3);
	
	makeAnimatedLuaSprite('forest1', 'stages/arrivalWeek-assets/arrival-stage1/forest', -700, -400);
	addAnimationByPrefix('forest1', 'forest', 'forest', 24, true);
	setScrollFactor('forest1', 0.2, 0.4);
	
	makeAnimatedLuaSprite('forest2', 'stages/arrivalWeek-assets/arrival-stage1/forest', -2920, -400);
	addAnimationByPrefix('forest2', 'forest', 'forest', 24, true);
	setScrollFactor('forest2', 0.2, 0.4);
	
	makeLuaSprite('lighting', 'stages/arrivalWeek-assets/arrival-stage1/forest-lighting',  -750, -300);
	setScrollFactor('lighting', 0, 0);

	makeLuaSprite('shadow', 'stages/arrivalWeek-assets/arrival-stage1/forest-shadow',  -750, -300);
	setScrollFactor('shadow', 0, 0);
	

	addLuaSprite('back', false);
	addLuaSprite('forest2', false);
	addLuaSprite('forest1', false);
	addLuaSprite('shadow', true);
	addLuaSprite('lighting', true);
	setProperty('shadow.alpha',0.25);
	setBlendMode('shadow','multiply');
	setProperty('lighting.alpha',0.25);
	setBlendMode('lighting','add');
	
	makeAnimatedLuaSprite('cloud1', 'stages/arrivalWeek-assets/arrival-stage1/spell-cloud', -750, -1450);
	addAnimationByPrefix('cloud1', 'cloud', 'cloud', 24, true);
	setScrollFactor('cloud1', 0.2, 0.4);		
	scaleObject('cloud1', 1.5, 1.5);
	
	makeAnimatedLuaSprite('cloud2', 'stages/arrivalWeek-assets/arrival-stage1/spell-cloud', -750, 0);
	addAnimationByPrefix('cloud2', 'cloud', 'cloud', 24, true);
	setScrollFactor('cloud2', 0.2, 0.4);
	scaleObject('cloud2', 1.5, 1.5);
		
	makeLuaSprite('darkness', 'stages/arrivalWeek-assets/arrival-stage1/spell-darkness',  -300, -155);
	setScrollFactor('darkness', 0, 0);
	scaleObject('darkness', 1.5, 1.5);
		
	addLuaSprite('cloud1', false);
	setProperty('cloud1.alpha',0);
	setBlendMode('cloud1','add');
	addLuaSprite('cloud2', false);
	setProperty('cloud2.alpha',0);
	setBlendMode('cloud2','add');
	addLuaSprite('darkness', true);
	setProperty('darkness.alpha',0);
	setBlendMode('darkness','multiply');
	
	makeLuaSprite('bird-wing1', 'stages/arrivalWeek-assets/arrival-stage1/bird-wing1', 730, 50);
	setScrollFactor('bird-wing1', 0, 0);
	setProperty('bird-wing1.alpha', 0);
	
	makeLuaSprite('bird-wing2', 'stages/arrivalWeek-assets/arrival-stage1/bird-wing2', 687, 100);
	setScrollFactor('bird-wing2', 0, 0);
	setProperty('bird-wing2.alpha', 0);
	
	makeLuaSprite('bird-wing3', 'stages/arrivalWeek-assets/arrival-stage1/bird-wing3', 670, 175);
	setScrollFactor('bird-wing3', 0, 0);
	setProperty('bird-wing3.alpha', 0);
	
	addLuaSprite('bird-wing3', true);
	addLuaSprite('bird-wing2', true);
	addLuaSprite('bird-wing1', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end