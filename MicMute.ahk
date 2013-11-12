;MicMute.ahk

#NoEnv
#SingleInstance force

Mixer = -1
Loop  ; For each mixer number that exists in the system, query its capabilities.
{
	CurrMixer := A_Index
	SoundGet, Setting,,, %CurrMixer%
	if ErrorLevel = Can't Open Specified Mixer  ; Any error other than this indicates that the mixer exists.
		break
		
	SoundGet, Setting, MICROPHONE,, %CurrMixer%
	
	if ErrorLevel = Mixer Doesn't Support This Component Type
		continue  ; Start a new iteration to move on to the next component type.
	else
		Mixer = %CurrMixer%
}

if Mixer = -1
	MsgBox, No Microphone found
else {
	SoundGet, mute, Microphone, MUTE, %Mixer%
	Menu, TRAY, Icon, mic_mute_%mute%.ico

	^M::
		SoundSet, +1, Microphone, MUTE, %Mixer%
		SoundGet, mute, Microphone, MUTE, %Mixer%
		TrayTip, ToggleMic, Microphone mute is %mute%, 3
		Menu, TRAY, Icon, mic_mute_%mute%.ico	
	return
}