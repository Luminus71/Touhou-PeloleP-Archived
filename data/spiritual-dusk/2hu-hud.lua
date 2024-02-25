function onCreatePost()
	
	setProperty('timeTxt.x', 779)
	setProperty('timeTxt.y', 629)
	setProperty('healthBar.y', 630)
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('scoreTxt.y', 20)
	
end

function onUpdatePost()

	songTime = getProperty('songLength') - getPropertyFromClass('backend.Conductor', 'songPosition')
	
	setProperty('timeTxt.text', math.floor(songTime / 1000) + 1)
	
end