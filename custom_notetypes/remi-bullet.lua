function onUpdatePost()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'remi-bullet' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'stages/notes/remi-bullet');
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == true then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
end


function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'remi-bullet' then
		characterPlayAnim('boyfriend', 'dodge', false);
		characterPlayAnim('dad', 'shoot', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
		playSound('remishoot', 1);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'remi-bullet' then
		setProperty('health', -1);
	end
end