local partON = false
local allowCountdown = false
local rumia = false

function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 1);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		startDialogue('startDialogue', 'pre-sdDialogue');
	end
	
	if tag == 'song-name' then
		doTweenAlpha('bgmAX', 'bgm', 0, 1.5, 'linear');
		doTweenY('songO', 'songName', 780, 1, 'circIn')
	end
end

-- code to change the note colors, made by Broster (@broster)

function onCreate()

	-- SONG NAME IMAGES
	precacheImage('stages/song-names/bgm-text')
	precacheImage('stages/song-names/song-text-sd')

	-- POST-SONG DIALOGUE BACKGROUND IMAGE
	precacheImage('stages/arrivalWeek-assets/post-sd-panel')
	makeLuaSprite('dialogueBG', 'stages/arrivalWeek-assets/post-sd-panel', -75, -50);
	setScrollFactor('dialogueBG', 0, 0);
	scaleObject('dialogueBG', 1.15, 1.15);
	setProperty('dialogueBG.alpha', 0);
	setObjectCamera('dialogueBG', 'hud')
	addLuaSprite('dialogueBG', true)

	-- PAUSE MENU SONG
	setPropertyFromClass('substates.PauseSubState', 'songName', 'eien');
	
	-- CHARACTER
	precacheImage('characters/SD-gameOver1')
	precacheImage('characters/SD-gameOver2-kareshi')
	precacheImage('characters/SD-gameOver2-reimu')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'sd-dead1');
	
	-- SOUNDS/MUSICS
	precacheSound('dusk-loss-k1')
	precacheSound('dusk-loss-k2')
	precacheSound('2hu-loss-sfx')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'dusk-loss-k1');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'pichuun-strange');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'pichuun-strange-end');
	
	precacheImage('stages/arrivalWeek-assets/arrival-stage1/particle')
	precacheImage('stages/arrivalWeek-assets/arrival-stage1/fairyBlue1')
	precacheImage('stages/arrivalWeek-assets/arrival-stage1/fairyBlue2')
	precacheImage('stages/arrivalWeek-assets/arrival-stage1/fairyPink')
	precacheImage('stages/arrivalWeek-assets/arrival-stage1/spell-card-1')
	precacheImage('stages/arrivalWeek-assets/arrival-stage1/spell-card-2')
	precacheImage('spell-rumia')
	precacheImage('stages/arrivalWeek-assets/arrival-stage1/p_demarcation')
	
	addCharacterToList('rumia', 'dad')

	makeLuaSprite('reimuP1', 'stages/arrivalWeek-assets/arrival-stage1/reimuNormal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('reimuP1', 'hud')
    addLuaSprite('reimuP1', true)

    makeLuaSprite('reimuloseP1', 'stages/arrivalWeek-assets/arrival-stage1/reimuLose', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('reimuloseP1', 'hud')
    addLuaSprite('reimuloseP1', true)
		
	setProperty('reimuP1.flipX', true) 
    setProperty('reimuP1.alpha', 0) 
    setProperty('reimuloseP1.flipX', true)
    setProperty('reimuloseP1.visible', 0)

end

function onCreatePost()

	setProperty('dad.visible',false)
	
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then
		if value1 == 'fairyBlue1' then
		
		makeAnimatedLuaSprite('fairyBlue1', 'stages/arrivalWeek-assets/arrival-stage1/fairyBlue1', -2000, math.random(-25, -5));
		addAnimationByPrefix('fairyBlue1', 'fairyBlue1', 'fairyBlue1', 24, true);
		
		addLuaSprite('fairyBlue1', false)
		
		doTweenX('FB1Tween', 'fairyBlue1', 1000, 7);
		
			
		end
		
		if value1 == 'fairyBlue2' then
		
		makeAnimatedLuaSprite('fairyBlue2', 'stages/arrivalWeek-assets/arrival-stage1/fairyBlue2', -2000, math.random(-15, -10));
		addAnimationByPrefix('fairyBlue2', 'fairyBlue2', 'fairyBlue2', 24, true);
		
		addLuaSprite('fairyBlue2', false)
		
		doTweenX('FB2Tween', 'fairyBlue2', 1000, 9);
			
		end
		
		if value1 == 'fairyPink' then
		
		makeAnimatedLuaSprite('fairyPink', 'stages/arrivalWeek-assets/arrival-stage1/fairyPink', -2000, math.random(535, 550));
		addAnimationByPrefix('fairyPink', 'fairyPink', 'fairyPink', 24, true);
		
		addLuaSprite('fairyPink', false)
		
		doTweenX('FPTween', 'fairyPink', 1000, 8);
			
		end
		
		if value1 == 'rumiaON' then
		
		setProperty('dad.visible',true)
		doTweenX('rumiaX', 'dad', -900, 2, 'circInOut')
		doTweenY('rumiaY', 'dad', 200, 2, 'circInOut')
		
		rumia = true
		
		doTweenAlpha('alpha2', 'iconP1', 1, 1, 'linear');
		doTweenAlpha('alpha3', 'iconP2', 1, 1, 'linear');
		doTweenAlpha('alpha4', 'healthBar', 1, 1, 'linear');
		doTweenAlpha('alpha5', 'timeBar', 1, 1, 'linear');
		doTweenAlpha('alpha6', 'timeBarBG', 1, 1, 'linear');
		doTweenAlpha('alpha7', 'timeTxt', 1, 1, 'linear');
		noteTweenAlpha('noteAlpha1', 0, 0, 1, 'linear');
		noteTweenAlpha('noteAlpha2', 1, 0, 1, 'linear');
		noteTweenAlpha('noteAlpha3', 2, 0, 1, 'linear');
		noteTweenAlpha('noteAlpha4', 3, 0, 1, 'linear');
		
		setProperty('health', 1)
		
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'dusk-loss-k2');
		setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'pichuun-apparition');
		
		end
	end
	
	if name == 'Icon Change' then
	
		if value2 == 'reimu' then
		
		setProperty('reimuP1.alpha', 1) 
		setProperty('reimuloseP1.alpha', 1)
		setProperty('iconP1.alpha', 0)	
		
		-- CHARACTER
			setPropertyFromClass('GameOverSubstate', 'characterName', 'sd-dead2-r');
	
		-- SOUNDS/MUSICS
			setPropertyFromClass('GameOverSubstate', 'deathSoundName', '2hu-loss-sfx');
			setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'pichuun-strange');
			
		end
		if value2 == 'kareshi' then
		
		setProperty('reimuP1.alpha', 0) 
		setProperty('reimuloseP1.alpha', 0) 
		setProperty('iconP1.alpha', 1)	
		setHealthBarColors( '0xff28143C', '0xff2F87D5')
		
		-- CHARACTER
			setPropertyFromClass('GameOverSubstate', 'characterName', 'sd-dead2-k');
	
		-- SOUNDS/MUSICS
			setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'dusk-loss-k2');
			setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'pichuun-apparition');
			
		end
		
	end
	
	if name == 'Spell' then
		if value2 == 'on' then
		
		playSound('spell', 1)
		
		doTweenAlpha('forest1OFF', 'forest1', 0.1, 2, 'linear');
		doTweenAlpha('forest2OFF', 'forest2', 0.1, 2, 'linear');
		doTweenAlpha('backOFF', 'back', 0.1, 2, 'linear');
		doTweenAlpha('lightOFF', 'lighting', 0, 2, 'linear');
		doTweenAlpha('shadowOFF', 'shadow', 0, 2, 'linear');
		
		doTweenAlpha('cloud1ON', 'cloud1', 0.5, 2, 'circIn');
		doTweenAlpha('cloud2ON', 'cloud2', 0.5, 2, 'circIn');
		doTweenAlpha('darknessON', 'darkness', 0.75, 2, 'circIn');
		
		makeLuaSprite('spell-rumia', 'spell-rumia', -1000, 100);
		scaleObject('spell-rumia', 1.75, 1.75);
		setProperty('spell-rumia.alpha', 0);
		setScrollFactor('spell-rumia', 0, 0);
		
		addLuaSprite('spell-rumia', true);
		setBlendMode('spell-rumia','add')
		
		doTweenX('spell-rumiaX', 'spell-rumia', -100, 2, 'circOut');
		doTweenAlpha('spell-rumiaA', 'spell-rumia', 0.75, 1, 'linear');
		
		end
		if value2 == 'off' then
		
		doTweenAlpha('forest1ON', 'forest1', 1, 2, 'linear');
		doTweenAlpha('forest2ON', 'forest2', 1, 2, 'linear');
		doTweenAlpha('backON', 'back', 1, 2, 'linear');
		doTweenAlpha('lightON', 'lighting', 0.25, 2, 'linear');
		doTweenAlpha('shadowON', 'shadow', 0.25, 2, 'linear');
		
		doTweenAlpha('cloud1OFF', 'cloud1', 0, 2, 'circOut');
		doTweenAlpha('cloud2OFF', 'cloud2', 0, 2, 'circOut');
		doTweenAlpha('darknessOFF', 'darkness', 0, 2, 'circOut');
		end
	end
	
	if name == 'Spell Card' then
		if value2 == 'card1' then
		
		setObjectCamera('bird-wing1', 'hud')
		setObjectCamera('bird-wing2', 'hud')
		setObjectCamera('bird-wing3', 'hud')
		
		makeLuaSprite('night-bird', 'stages/arrivalWeek-assets/arrival-stage1/spell-card-1', -200, 500);
		setScrollFactor('night-bird', 0, 0);
		setProperty('night-bird.alpha', 0);
		scaleObject('night-bird', 1.75, 1);
		
		addLuaSprite('night-bird', true);
		setBlendMode('night-bird','add');
		
		doTweenX('night-birdX', 'night-bird.scale', 1, 2, 'circOut');
		doTweenAlpha('night-birdA', 'night-bird', 0.75, 1, 'linear');
		
		doTweenAlpha('bird-wing1A', 'bird-wing1', 0.75, 1, 'linear');
		doTweenAlpha('bird-wing2A', 'bird-wing2', 0.75, 1, 'linear');
		doTweenAlpha('bird-wing3A', 'bird-wing3', 0.75, 1, 'linear');
		
		end
		if value2 == 'end-card1' then
		
		doTweenAlpha('night-birdOFF', 'night-bird', 0, 1, 'linear');
		doTweenAlpha('bird-wing1OFF', 'bird-wing1', 0, 1, 'linear');
		doTweenAlpha('bird-wing2OFF', 'bird-wing2', 0, 1, 'linear');
		doTweenAlpha('bird-wing3OFF', 'bird-wing3', 0, 1, 'linear');
		
		end
		if value2 == 'card2' then
		
		makeLuaSprite('p_demarcation1', 'stages/arrivalWeek-assets/arrival-stage1/p_demarcation', -590, -500);
		setProperty('p_demarcation1.alpha', 0);
		setScrollFactor('p_demarcation1', 0.3, 0.5);
		makeLuaSprite('p_demarcation2', 'stages/arrivalWeek-assets/arrival-stage1/p_demarcation', -590, -500);
		setProperty('p_demarcation2.alpha', 0);
		setScrollFactor('p_demarcation2', 0.3, 0.5);
		
		makeLuaSprite('demarcation', 'stages/arrivalWeek-assets/arrival-stage1/spell-card-2', 145, 500);
		setScrollFactor('demarcation', 0, 0);
		setProperty('demarcation.alpha', 0);
		scaleObject('demarcation', 1.75, 1);
		
		addLuaSprite('p_demarcation1', false); 
		setBlendMode('p_demarcation1','add');
		addLuaSprite('p_demarcation2', false); 
		setBlendMode('p_demarcation2','add');
		addLuaSprite('demarcation', true);
		setBlendMode('demarcation','add');
		
		doTweenX('demarcationX', 'demarcation.scale', 1, 2, 'circOut');
		doTweenAlpha('demarcationA', 'demarcation', 0.75, 1, 'linear');
		
		doTweenAlpha('p_demarcation1A', 'p_demarcation1', 0.75, 1, 'linear');
		doTweenAngle('p_demarcation1R', 'p_demarcation1', 3600, 40, 'linear')
		doTweenAlpha('p_demarcation2A', 'p_demarcation2', 0.75, 1, 'linear');
		doTweenAngle('p_demarcation2R', 'p_demarcation2', -3600, 40, 'linear')
		
		end
		if value2 == 'end-card2' then
		
		doTweenAlpha('demarcationOFF', 'demarcation', 0, 1, 'linear');
		doTweenAlpha('p_demarcation1OFF', 'p_demarcation1', 0, 1, 'linear');
		doTweenAlpha('p_demarcation2OFF', 'p_demarcation2', 0, 1, 'linear');
		
		end
	end
	
	if name == 'Song Name' then
		if value2 == 'on' then
			makeLuaSprite('bgm', 'stages/song-names/bgm-text', 935, 670);
			setScrollFactor('bgm', 0, 0);
			setObjectCamera('bgm', 'hud')
			scaleObject('bgm', 0.75, 0.75);
			setProperty('bgm.alpha', 0) 
			addLuaSprite('bgm', true)
			
			makeLuaSprite('songName', 'stages/song-names/song-text-sd', 1290, 670);
			setScrollFactor('songName', 0, 0);
			setObjectCamera('songName', 'hud')
			scaleObject('songName', 0.75, 0.75);
			addLuaSprite('songName', true)
			
			doTweenAlpha('bgmA', 'bgm', 1, 1.5, 'linear');
			doTweenX('songI', 'songName', 1035, 1, 'circOut');
			runTimer('song-name', 5);
		end
	end
	
end

function onTweenCompleted(tag)
	if tag == 'FB1Tween' then
		removeLuaSprite('fairyBlue1', true)
	end
	if tag == 'FB2Tween' then
		removeLuaSprite('fairyBlue2', true)
	end
	if tag == 'FPTween' then
		removeLuaSprite('fairyPink', true)
	end
	if tag == 'spell-rumiaX' then
		doTweenX('spell-rumiaSX', 'spell-rumia.scale', 2.5, 1, 'circOut');
		doTweenY('spell-rumiaSY', 'spell-rumia.scale', 2.5, 1, 'circOut');
		doTweenAlpha('spell-rumiaAA', 'spell-rumia', 0, 1, 'linear');
	end
	if tag == 'spell-rumiaAA' then
		removeLuaSprite('spell-rumia', true)
	end
	if tag == 'night-birdX' then
		doTweenY('night-birdY', 'night-bird', 0, 2, 'circOut');
	end
	if tag == 'night-birdOFF' then
		removeLuaSprite('night-bird', true)
		removeLuaSprite('bird-wing1', true)
		removeLuaSprite('bird-wing2', true)
		removeLuaSprite('bird-wing3', true)
	end
	if tag == 'demarcationX' then
		doTweenY('demarcationY', 'demarcation', 100, 2, 'circOut');
	end
	if tag == 'demarcationOFF' then
		removeLuaSprite('demarcation', true)
	end
end

function onStepHit()
    Particle()
end

pa = 1
  
function Particle()
		songPos = getSongPosition()

		local currentBeat = (songPos/500)

		pa = pa + 1
	
		tweenX = math.random(2, 1500)
		tweenY = math.random(2, 1500)
		tweenA = math.random(2, 1500)
		scale = math.random(0.75, 1)

		makeLuaSprite('part' .. pa, 'stages/arrivalWeek-assets/arrival-stage1/particle', math.random(-2000, 1500), 1600);
		doTweenX(tweenX, 'part' .. pa, -900*math.sin((currentBeat+1*0.1)*math.pi), 6);
		doTweenY(tweenY, 'part' .. pa, -900*math.tan((currentBeat+1*0.1)*math.pi), 6);
		doTweenAlpha(tweenA, 'part' .. pa, 0, 6, 'circIn');
		scaleObject('part' .. pa, scale, scale);
		
		addLuaSprite('part' .. pa, true);
		setBlendMode('part' .. pa,'add')
  
		if pa >= 50 then
			pa = 1
		end
end

function onUpdate(elapsed)

	if rumia == true then
		if getProperty('health') < 0.4 then
			setProperty('reimuP1.visible', false)
			setProperty('reimuloseP1.visible', true) 
		else
			setProperty('reimuP1.visible', true) 
			setProperty('reimuloseP1.visible', false)
		end
	end
		
end

function onUpdatePost(elapsed)

        setProperty('reimuP1.x', getProperty('iconP1.x')) 
        setProperty('reimuP1.angle', getProperty('iconP1.angle')) 
        setProperty('reimuP1.y', getProperty('iconP1.y'))
        setProperty('reimuP1.scale.x', getProperty('iconP1.scale.x')) 
        setProperty('reimuP1.scale.y', getProperty('iconP1.scale.y'))

        setProperty('reimuloseP1.x', getProperty('iconP1.x')) 
        setProperty('reimuloseP1.angle', getProperty('iconP1.angle')) 
        setProperty('reimuloseP1.y', getProperty('iconP1.y')) 
        setProperty('reimuloseP1.scale.x', getProperty('iconP1.scale.x')) 
        setProperty('reimuloseP1.scale.y', getProperty('iconP1.scale.y'))
		
	if rumia == false then
	
		setProperty('healthBar.alpha', 0)
		setProperty('timeBar.alpha', 0)
		setProperty('timeBarBG.alpha', 0)
		setProperty('timeTxt.alpha', 0)
		setProperty('iconP1.alpha', 0)
		setProperty('iconP2.alpha', 0)
	
	end
	
end

local allowEndShit = false
local playVideo = true

--[[ function onEndSong()
	doTweenAlpha('dialogueBGa', 'dialogueBG', 1, 1, 'linear');
	if not allowEndShit and isStoryMode then
		setProperty('inCutscene', true);
		startDialogue('endDialogue', 'post-sdDialogue');
		allowEndShit = true;
		return Function_Stop;
	end
	return Function_Continue;
end ]]--

function onEndSong()
   doTweenAlpha('dialogueBGa', 'dialogueBG', 1, 1, 'linear')   
      if not allowEndShit  then
       setProperty('inCutscene', true);
       startDialogue('endDialogue', 'post-sdDialogue');
       allowEndShit = true;
       return Function_Stop;
   elseif playVideo then     
      startVideo('ending'); --Play video file from "videos/" folder
      playVideo = false;
      return Function_Stop; 
   end
end

