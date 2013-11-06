;MicMute.ahk

#NoEnv
#SingleInstance force

SoundGet, mute, Microphone, MUTE, 5
Menu, TRAY, Icon, mic_mute_%mute%.ico

^M::
	SoundSet, +1, Microphone, MUTE, 5
	SoundGet, mute, Microphone, MUTE, 5
	TrayTip, ToggleMic, Microphone mute is %mute%, 3
	Menu, TRAY, Icon, mic_mute_%mute%.ico	
return