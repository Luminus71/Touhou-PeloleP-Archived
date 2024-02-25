local allowCountdown = false

function onStartCountdown()
	
	if not allowCountdown and isStoryMode and not seenCutscene then
		startVideo('crimson-dream-cutscene')
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onUpdate(elapsed)
	if inGameOver then
		setProperty('camGame.scroll.x', getProperty('boyfriend.cameraPosition[0]'));
		setProperty('camGame.scroll.y', getProperty('boyfriend.cameraPosition[0]'));
	end
end

function onCreate()

	-- SONG NAME IMAGES
	precacheImage('stages/song-names/bgm-text')
	precacheImage('stages/song-names/song-text-cd')

	-- PAUSE MENU SONG
	setPropertyFromClass('PauseSubState', 'songName', 'eien');

	-- CHARACTER
	precacheImage('characters/kareshi-dead')
	
	-- SOUNDS/MUSICS
	precacheSound('fnf_loss_sfx')

	precacheImage('stages/reimuOrb/reimuOrb1')
	precacheImage('stages/reimuOrb/reimuOrb2')
	
	makeAnimatedLuaSprite('orb1', 'stages/reimuOrb/reimuOrb1', -750, 400);
	addAnimationByPrefix('orb1', 'orb', 'orb1', 24, true);
		
	addLuaSprite('orb1', false)
	setProperty('orb1.visible', false)
	
	makeAnimatedLuaSprite('orb2', 'stages/reimuOrb/reimuOrb2', -1100, 425);
	addAnimationByPrefix('orb2', 'orb', 'orb2', 24, true);
		
	addLuaSprite('orb2', false)
	setProperty('orb2.visible', false)
	

   setPropertyFromClass('GameOverSubstate', 'characterName', 'kareshi-dead'); -- your character's json file name
  setPropertyFromClass('GameOverSubstate', 'deathSoundName', '2hu-loss-sfx'); -- sound to play when the death screen is triggered
  setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'pichuun-strange'); -- song that will play during the death screen
  setPropertyFromClass('GameOverSubstate', 'endSoundName', 'pichuun-strange-end'); --sound to play when you press the confirm button to retry
end

function onEvent(name,value1,value2)
	if name == 'Intro Text' then
		if isStoryMode then
			if value2 == 'intro' then
				doTweenAlpha('intro', 'title', 1, 1.5, 'linear');
				setProperty('quote.alpha', 1);
				objectPlayAnimation('quote', 'intro');
			end
			if value2 == 'introEnd' then
				doTweenAlpha('introEnd', 'title', 0, 1.5, 'linear');
			end
			if value2 == 'end' then
				doTweenAlpha('end', 'quote', 0, 1.5, 'linear');
			end
		end
	end
	if name == 'Play Animation' then
		if value1 == 'reimuSolo' then
			doTweenZoom('reimuSolo', 'camGame', 1, 5.5, 'linear');
		end
	end
	if name == 'Spell Card' then
		if value2 == 'orbs' then
			setProperty('orb1.visible', true)
			setProperty('orb2.visible', true)
		end
	end
	
	if name == 'Song Name' then
		if value2 == 'on' then
			makeLuaSprite('bgm', 'stages/song-names/bgm-text', 920, 670);
			setScrollFactor('bgm', 0, 0);
			setObjectCamera('bgm', 'hud')
			scaleObject('bgm', 0.75, 0.75);
			setProperty('bgm.alpha', 0) 
			addLuaSprite('bgm', true)
			
			makeLuaSprite('songName', 'stages/song-names/song-text-cd', 1290, 670);
			setScrollFactor('songName', 0, 0);
			setObjectCamera('songName', 'hud')
			scaleObject('songName', 0.75, 0.75);
			addLuaSprite('songName', true)
			
			doTweenAlpha('bgmA', 'bgm', 1, 1.5, 'linear');
			doTweenX('songI', 'songName', 1020, 1, 'circOut');
			runTimer('song-name', 5);
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
	if not allowEndShit and isStoryMode and not seenCutscene then
		setProperty('camHUD.alpha', 0)
		setProperty('camGame.alpha', 0)
		startVideo('spiritual-dusk-cutscene')
		allowEndShit = true;
		return Function_Stop;
	end
	return Function_Continue;
end

