math.randomseed(os.time())
corruptSound = math.random(1, 10);
corruptMusic = math.random(1, 10);

local missAnims = {"singLEFTmiss", "singDOWNmiss", "singUPmiss", "singRIGHTmiss"}

local allowCountdown = false
local canariasIntro = true;
local playCutscene = true;

--[[function onStartCountdown()	
	if not allowCountdown and isStoryMode and not seenCutscene then
		startVideo('gensomooru-cutscene')
		allowCountdown = true;
		return Function_Stop;
	elseif canariasIntro then
                startVideo('le-intro'); --Play video file from "videos/" folder
	        canariasIntro = false;
	        return Function_Stop;
        end
	return Function_Continue;
end]]--

function onStartCountdown()
   if not allowCountdown and isStoryMode and not seenCutscene and canariasIntro then
      startVideo('le-intro'); 
      canariasIntro = false;
      return Function_Stop;
   elseif playCutscene and isStoryMode and not seenCutscene then
      startVideo('gensomooru-cutscene')
      playCutscene = false;
      allowCountdown = true;
      return Function_Stop;
   end
end

function onCreate()
	-- SONG NAME IMAGES
	precacheImage('stages/song-names/bgm-text')
	precacheImage('stages/song-names/song-text-gensomooru')

	-- PAUSE MENU SONG
	setPropertyFromClass('PauseSubState', 'songName', 'eien');

	-- CHARACTER
	precacheImage('characters/genso-gameOver')
	
	-- SOUNDS/MUSICS
	precacheSound('genso-loss-sfx')
	
	makeAnimatedLuaSprite('cirno', 'stages/gensomooru/spooky-cirno', -850, 475)
	addAnimationByPrefix('cirno', 'cirno', 'cirno', 24, false)
	
	makeLuaSprite('shadows3', 'stages/gensomooru/genso-shadows3', -725, 685);
	
	makeLuaSprite('shadows4', 'stages/gensomooru/genso-shadows4', -850, 765);
	
	makeAnimatedLuaSprite('monster', 'stages/gensomooru/spooky-monster', 325, 240)
	addAnimationByPrefix('monster', 'monster', 'monster', 24, true)
	
	makeAnimatedLuaSprite('rick', 'stages/gensomooru/spooky-rick', 675, 325)
	addAnimationByPrefix('rick', 'rick', 'rick', 24, true)
	
	makeAnimatedLuaSprite('sakuya', 'stages/gensomooru/spooky-sakuya', -725, 100)
	addAnimationByPrefix('sakuya', 'sakuya', 'sakuya', 24, false)
	
	makeAnimatedLuaSprite('spooky-remilia', 'characters/spooky-remilia', -415, 260)
	
	addAnimationByPrefix('spooky-remilia', 'idle', 'REMI_idle', 24, false)
	addAnimationByPrefix('spooky-remilia', 'singLEFT', 'REMI_leftSING', 24, false)
	addAnimationByPrefix('spooky-remilia', 'singDOWN', 'REMI_downSING', 24, false)
	addAnimationByPrefix('spooky-remilia', 'singUP', 'REMI_upSING', 24, false)
	addAnimationByPrefix('spooky-remilia', 'singRIGHT', 'REMI_rightSING', 24, false)
	
	objectPlayAnimation('spooky-remilia', 'idle')
	
	addLuaSprite('monster', false)
	setProperty('monster.alpha', 0.1)
	addLuaSprite('shadows3', false);
	setBlendMode('shadows3','multiply');
	setProperty('shadows3.alpha',0.65);
	addLuaSprite('shadows4', false);
	setBlendMode('shadows4','multiply');
	setProperty('shadows4.alpha',0.65);
	addLuaSprite('rick', true)
	addLuaSprite('sakuya', false)
	addLuaSprite('cirno', true)
	addLuaSprite('spooky-remilia', false)
	
	makeLuaSprite('cart', 'stages/gensomooru/genso-cart', -570, 390)
	setScrollFactor('cart', 1, 1)
	
	addLuaSprite('cart', false)
	
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'spooky-remi' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
			end
		end
	end
	
	makeLuaSprite('remiP2', 'stages/gensomooru/remiNormal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('remiP2', 'hud')
    addLuaSprite('remiP2', true)

    makeLuaSprite('remiloseP2', 'stages/gensomooru/remiLose', getProperty('iconP2.x'), getProperty('iconP2.y'))
	setObjectCamera('remiloseP2', 'hud')
    addLuaSprite('remiloseP2', true)
	
	makeLuaSprite('pumpP1', 'stages/gensomooru/pumpNormal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('pumpP1', 'hud')
    addLuaSprite('pumpP1', true)

    makeLuaSprite('pumploseP1', 'stages/gensomooru/pumpLose', getProperty('iconP1.x'), getProperty('iconP1.y'))
	setObjectCamera('pumploseP1', 'hud')
    addLuaSprite('pumploseP1', true)
		
    setProperty('remiP2.visible', true) 
    setProperty('remiloseP2.visible', false)
    setProperty('pumpP1.visible', true)
    setProperty('pumploseP1.visible', false)
	

   setPropertyFromClass('GameOverSubstate', 'characterName', 'spooky-dead'); -- your character's json file name
  setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'genso-loss-sfx'); -- sound to play when the death screen is triggered
  setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'genso-gameOver');
   if corruptMusic == 5 then
      setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'host-retry');
   end
   setPropertyFromClass('GameOverSubstate', 'endSoundName', 'genso-gameOverEnd');
   if corruptSound == 10 then
      setPropertyFromClass('GameOverSubstate', 'endSoundName', 'host-confirm');
   end
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then
		if value1 == 'out' then
			addAnimationByPrefix('rick', 'out_rick', 'out_rick', 24, true)
			objectPlayAnimation('rick', 'out_rick')
			doTweenX('rickout', 'rick', 1200, 5)
		end
	end
	
	if name == 'Remilia (spookee)' then
		if value2 == 'idle' then
			remiIdle = true
			objectPlayAnimation('spooky-remilia', 'idle')
			setProperty('spooky-remilia.offset.x', 0)
			setProperty('spooky-remilia.offset.y', 0)
		end
		if value2 == 'sing' then
			remiIdle = false
		end
	end
	
	if name == 'Song Name' then
		if value2 == 'on' then
			makeLuaSprite('bgm', 'stages/song-names/bgm-text', 965, 670);
			setScrollFactor('bgm', 0, 0);
			setObjectCamera('bgm', 'hud')
			scaleObject('bgm', 0.75, 0.75);
			setProperty('bgm.alpha', 0) 
			addLuaSprite('bgm', true)
			
			makeLuaSprite('songName', 'stages/song-names/song-text-gensomooru', 1290, 670);
			setScrollFactor('songName', 0, 0);
			setObjectCamera('songName', 'hud')
			scaleObject('songName', 0.75, 0.75);
			addLuaSprite('songName', true)
			
			doTweenAlpha('bgmA', 'bgm', 1, 1.5, 'linear');
			doTweenX('songI', 'songName', 1070, 1, 'circOut');
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

remiIdle = true

idleOffset = {'0', '0'}   

function onBeatHit()
	if curBeat % 2 == 0 then
		if remiIdle == true then
			objectPlayAnimation('spooky-remilia', 'idle')
			setProperty('spooky-remilia.offset.x', idleOffset[1]);
		setProperty('spooky-remilia.offset.y', idleOffset[2]);
		end
		objectPlayAnimation('cirno', 'cirno')
		objectPlayAnimation('sakuya', 'sakuya')
	end
end

local sing = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}

leftO = {'12', '2'}
downO = {'12', '24'}
upO = {'3', '25'}
rightO = {'-16', '22'}

local singOffset = {leftO, downO, upO, rightO};

function opponentNoteHit(id, direction, noteType, isSustainNote)
	
	if noteType == "spooky-remi" then
	
		objectPlayAnimation('spooky-remilia', sing[direction+1], true)
		setProperty('spooky-remilia.offset.x', singOffset[direction + 1][1]);
		setProperty('spooky-remilia.offset.y', singOffset[direction + 1][2]);
		
	end
	
end

function onUpdate(elapsed)
	
    if getProperty('health') > 1.6 then
        setProperty('remiP2.visible', false)
        setProperty('remiloseP2.visible', true) 
    else
        setProperty('remiP2.visible', true) 
        setProperty('remiloseP2.visible', false)
    end
	if getProperty('health') < 0.4 then
        setProperty('pumpP1.visible', false)
        setProperty('pumploseP1.visible', true) 
    else
        setProperty('pumpP1.visible', true) 
        setProperty('pumploseP1.visible', false)
    end
end

function onUpdatePost(elapsed)
		
		setProperty('pumpP1.x', getProperty('iconP1.x') + 59) 
        setProperty('pumpP1.angle', getProperty('iconP1.angle')) 
        setProperty('pumpP1.y', getProperty('iconP1.y') - 50)
        setProperty('pumpP1.scale.x', getProperty('iconP1.scale.x') - 0.06) 
        setProperty('pumpP1.scale.y', getProperty('iconP1.scale.y') - 0.06)

        setProperty('pumploseP1.x', getProperty('iconP1.x') + 50) 
        setProperty('pumploseP1.angle', getProperty('iconP1.angle')) 
        setProperty('pumploseP1.y', getProperty('iconP1.y') - 70) 
        setProperty('pumploseP1.scale.x', getProperty('iconP1.scale.x') - 0.06) 
        setProperty('pumploseP1.scale.y', getProperty('iconP1.scale.y') - 0.06)
		
        setProperty('remiP2.x', getProperty('iconP2.x') - 59) 
        setProperty('remiP2.angle', getProperty('iconP2.angle')) 
        setProperty('remiP2.y', getProperty('iconP2.y') - 50)
        setProperty('remiP2.scale.x', getProperty('iconP2.scale.x') - 0.06) 
        setProperty('remiP2.scale.y', getProperty('iconP2.scale.y') - 0.06)

        setProperty('remiloseP2.x', getProperty('iconP2.x') - 50) 
        setProperty('remiloseP2.angle', getProperty('iconP2.angle')) 
        setProperty('remiloseP2.y', getProperty('iconP2.y') - 50) 
        setProperty('remiloseP2.scale.x', getProperty('iconP2.scale.x') - 0.06) 
        setProperty('remiloseP2.scale.y', getProperty('iconP2.scale.y') - 0.06)
		
end