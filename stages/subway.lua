function onCreate()

	makeLuaSprite('sky-city', 'stages/subway/sky-city', -600, 100);
	setScrollFactor('sky-city', 1, 1);
	scaleObject('sky-city', 0.5, 0.5);
	
	makeLuaSprite('sky', 'stages/subway/sky', -600, 100);
	setScrollFactor('sky', 1, 1);
	scaleObject('sky', 0.5, 0.5);
	
	makeAnimatedLuaSprite('city', 'stages/subway/city', -1250, 300);
	addAnimationByPrefix('city', 'city', 'city', 18, true);
	setScrollFactor('city', 1, 1);
	
	makeAnimatedLuaSprite('forest', 'stages/subway/forest', -1250, 300);
	addAnimationByPrefix('forest', 'forest', 'forest', 18, true);
	setScrollFactor('forest', 1, 1);
	
	makeAnimatedLuaSprite('power', 'stages/subway/power-train', -1250, 0);
	addAnimationByPrefix('power', 'power', 'power', 18, true);
	setScrollFactor('power', 1, 1);
	
	makeLuaSprite('tunnel', 'stages/subway/tunnel', -3500, -100);
	setScrollFactor('tunnel', 1, 1);
	
	makeLuaSprite('subway', 'stages/subway/subway', -1250, -100);
	setScrollFactor('subway', 1, 1);
	
	makeAnimatedLuaSprite('kanojo', 'stages/subway/lv_kanojo', -455, 415);
	addAnimationByPrefix('kanojo', 'kanojo', 'kanojo', 18, false);
	setScrollFactor('kanojo', 1, 1);
	
	makeAnimatedLuaSprite('kareshi', 'stages/subway/lv_kareshi', -525, 500);
	addAnimationByPrefix('kareshi', 'kareshi', 'kareshi', 18, false);
	setScrollFactor('kareshi', 1, 1);
	
	makeAnimatedLuaSprite('pico', 'stages/subway/lv_pico', 575, 450);
	addAnimationByPrefix('pico', 'pico', 'pico', 24, true);
	setScrollFactor('pico', 1, 1);
	
	makeAnimatedLuaSprite('nene', 'stages/subway/lv_nene', 100, 435);
	addAnimationByPrefix('nene', 'nene', 'nene', 12, true);
	setScrollFactor('nene', 1, 1);
	
	makeAnimatedLuaSprite('darnell', 'stages/subway/lv_darnell', 250, 450);
	addAnimationByPrefix('darnell', 'darnell', 'darnell', 24, true);
	setScrollFactor('darnell', 1, 1);
	
	addLuaSprite('sky-city', false);
	addLuaSprite('sky', false);
	addLuaSprite('city', false);
	addLuaSprite('forest', false);
	setProperty('forest.visible', false);
	addLuaSprite('power', false);
	setProperty('sky.visible', false);
	addLuaSprite('tunnel', false);
	addLuaSprite('subway', true);
	addLuaSprite('kanojo', true);
	addLuaSprite('kareshi', true);
	addLuaSprite('pico', true);
	addLuaSprite('nene', true);
	addLuaSprite('darnell', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end