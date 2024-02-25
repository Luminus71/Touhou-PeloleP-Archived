function onCreate()
	-- background shit
	makeLuaSprite('mall', 'stages/gensomooru/genso-mall', -1000, -250);
	setScrollFactor('mall', 1, 1);
	
	makeLuaSprite('shadows1', 'stages/gensomooru/genso-shadows1', -550, 710);
	setScrollFactor('shadows1', 1, 1);
	
	makeLuaSprite('shadows2', 'stages/gensomooru/genso-shadows2', 100, 700);
	setScrollFactor('shadows2', 1, 1);

	addLuaSprite('mall', false);
	addLuaSprite('shadows1', false);
	setBlendMode('shadows1','multiply');
	setProperty('shadows1.alpha',0.65);
	addLuaSprite('shadows2', false);
	setBlendMode('shadows2','multiply');
	setProperty('shadows2.alpha',0.65);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end