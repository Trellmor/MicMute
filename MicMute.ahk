;MicMute.ahk

#NoEnv
#SingleInstance force

^M::
	SoundSet, +1, Microphone, MUTE, 4
	SoundGet, mute, Microphone, MUTE, 4	
	TrayTip, ToggleMic, Microphone mute is %mute%, 3
return