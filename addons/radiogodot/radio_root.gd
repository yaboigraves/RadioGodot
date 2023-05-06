@tool
extends Control

#core runetime manager of the radio app
#lets start with play functionality

func StopAudio():
	$Audio.stream_paused = true
	
func StartAudio():
	$Audio.stream_paused = false


func _enter_tree() -> void:
	print("bingus")
	
func _process(delta: float) -> void:
	pass
	if $Audio.playing:
		$VBoxContainer/ProgScrubber.value = $Audio.get_playback_position()/$Audio.stream.get_length() 

#play button, make this more clear later
func _on_button_pressed() -> void:
	$Audio.play()

#0 is 100
func _on_volume_value_changed(value: float) -> void:
	$Audio.volume_db = value
