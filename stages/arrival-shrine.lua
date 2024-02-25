function onCreate()
	-- background shit
	makeLuaSprite('sky', 'stages/arrivalWeek-assets/arrival-shrine/sky', -1500, -250);
	setScrollFactor('sky', 0, 0.1);
	
	makeLuaSprite('backest-mountain', 'stages/arrivalWeek-assets/arrival-shrine/backest-mountain', -500, -100);
	setScrollFactor('backest-mountain', 0.05, 0.15);
	
	makeLuaSprite('back-mountains', 'stages/arrivalWeek-assets/arrival-shrine/back-mountains', -1000, -200);
	setScrollFactor('back-mountains', 0.15, 0.3);
	
	makeLuaSprite('cloud1', 'stages/arrivalWeek-assets/arrival-shrine/cloud1', 550, 0);
	setScrollFactor('cloud1', 0.2, 0.31);
	
	makeLuaSprite('cloud2', 'stages/arrivalWeek-assets/arrival-shrine/cloud2', -500, -100);
	setScrollFactor('cloud2', 0.22, 0.35);
	
	makeLuaSprite('forest', 'stages/arrivalWeek-assets/arrival-shrine/forest', -950, -50);
	setScrollFactor('forest', 0.8, 1.01);
	
	makeLuaSprite('shrine-grounds', 'stages/arrivalWeek-assets/arrival-shrine/shrine-grounds', -1550, -300);
	setScrollFactor('shrine-grounds', 1, 1);
	scaleObject('shrine-grounds', 1.2, 1.2);
	
	makeLuaSprite('characters-shadow', 'stages/arrivalWeek-assets/arrival-shrine/characters-shadow', -850, 630);
	setScrollFactor('characters-shadow', 1, 1);
	
	makeLuaSprite('fore-bushes', 'stages/arrivalWeek-assets/arrival-shrine/fore-bushes', -2250, 350);
	setScrollFactor('fore-bushes', 1.2, 1.2);
	scaleObject('fore-bushes', 1.75, 1.75);
	
	makeLuaSprite('sunlight', 'stages/stages/arrivalWeek-assets/arrival-shrine/sunlight', -700, -200);
	setScrollFactor('sunlight', 0.1, 0.1);
	
	makeLuaSprite('title', 'stages/arrivalWeek-assets/arrival-title', 290, 175);
	setScrollFactor('title', 0, 0);
	setProperty('title.alpha', 0);
	
	makeAnimatedLuaSprite('quote', 'stages/arrivalWeek-assets/arrival-quote', 125, 375);
	addAnimationByPrefix('quote', 'idle', 'quote idle', 24, false);
	addAnimationByPrefix('quote', 'intro', 'quote intro', 24, false);
	setScrollFactor('quote', 0, 0);
	setProperty('quote.alpha', 0);

	addLuaSprite('sky', false);
	addLuaSprite('backest-mountain', false);
	addLuaSprite('back-mountains', false);
	addLuaSprite('cloud1', false);
	addLuaSprite('cloud2', false);
	addLuaSprite('forest', false);
	addLuaSprite('shrine-grounds', false);
	addLuaSprite('characters-shadow', false);
	setProperty('characters-shadow.alpha',0.5);
	setBlendMode('characters-shadow','multiply');
	addLuaSprite('fore-bushes', true);
	addLuaSprite('sunlight', true);
	setProperty('sunlight.alpha',0.19);
	setBlendMode('sunlight','add');
	addLuaSprite('title', true);
	addLuaSprite('quote', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end