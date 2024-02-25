local allowCountdown = false

function onStartCountdown()
	
	if not allowCountdown and isStoryMode and not seenCutscene then
		startVideo('lowest-vibes-cutscene')
		allowCountdown = true;
		return Function_Stop;
	end
	setProperty('camHUD.alpha', 1)
	setProperty('camGame.alpha', 1)
	return Function_Continue;
end

function onCreate()

	setProperty('camHUD.alpha', 0)
	setProperty('camGame.alpha', 0)
	
	-- SONG NAME IMAGES
	precacheImage('stages/song-names/bgm-text')
	precacheImage('stages/song-names/song-text-lv')

	-- PAUSE MENU SONG
	setPropertyFromClass('PauseSubState', 'songName', 'eien');

	-- CHARACTER
	precacheImage('characters/lv-gameOver')
	
	-- SOUNDS/MUSICS
	precacheSound('lv-loss-sfx')

	setProperty('boyfriend.alpha', 0);
	setProperty('gf.alpha', 0);
	setProperty('dad.alpha', 0);
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('healthBar.alpha', 0)
	
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('kanojo', 'kanojo');
		objectPlayAnimation('kareshi', 'kareshi');
		objectPlayAnimation('tunnelLight', 'movement');
	end
	if curBeat % 2 == 1 then
		objectPlayAnimation('tunnelLight', 'movement');
	end
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then
		if value1 == 'TUNNELenter' then
			doTweenX('TUNNELenter', 'tunnel', -1250, 1, 'linear')
		end
		if value1 == 'TUNNELexit' then
			doTweenX('TUNNELexit', 'tunnel', 2000, 1, 'linear')
		end
		if value1 == 'lightON' then
			makeAnimatedLuaSprite('light', 'stages/subway/tunnelLight', -1250, 200);
			addAnimationByPrefix('light', 'movement', 'tunnel', 24, true);
			setScrollFactor('light', 1, 1);
			
			addLuaSprite('light', false);
			setProperty('light.alpha', 0);
			doTweenAlpha('LIGHTappear', 'light', 1, 1, 'linear')
		end
		if value1 == 'lightOFF' then
			setProperty('sky-city.visible', false);
			setProperty('sky.visible', true);
			setProperty('city.visible', false);
			setProperty('power.visible', false);
			setProperty('forest.visible', true);
			doTweenAlpha('LIGHTdisappear', 'light', 0, 1, 'linear')
		end
	end
	
	if name == 'Song Name' then
		if value2 == 'on' then
			makeLuaSprite('bgm', 'stages/song-names/bgm-text', 955, 670);
			setScrollFactor('bgm', 0, 0);
			setObjectCamera('bgm', 'hud')
			scaleObject('bgm', 0.75, 0.75);
			setProperty('bgm.alpha', 0) 
			addLuaSprite('bgm', true)
			
			makeLuaSprite('songName', 'stages/song-names/song-text-lv', 1290, 670);
			setScrollFactor('songName', 0, 0);
			setObjectCamera('songName', 'hud')
			scaleObject('songName', 0.75, 0.75);
			addLuaSprite('songName', true)
			
			doTweenAlpha('bgmA', 'bgm', 1, 1.5, 'linear');
			doTweenX('songI', 'songName', 1047, 1, 'circOut');
			runTimer('song-name', 7);
		end
	end
	
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'song-name' then
		doTweenAlpha('bgmAX', 'bgm', 0, 1.5, 'linear');
		doTweenY('songO', 'songName', 780, 1, 'circIn')
	end
end

local allowEndShit = false

function onEndSong()
	if not allowEndShit and isStoryMode then
		setProperty('camHUD.alpha', 0)
		setProperty('camGame.alpha', 0)
		startVideo('lv-post-cutscene')
		allowEndShit = true;
		return Function_Stop;
	end
	return Function_Continue;
end