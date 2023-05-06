@tool
extends EditorPlugin

var dock
var editorInterface : EditorInterface
var inPlayMode = false


func _enter_tree() -> void:
	dock = preload("res://addons/radiogodot/radio_root.tscn").instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_UL,dock)
	editorInterface = get_editor_interface()


func _process(delta: float) -> void:
	if editorInterface.is_playing_scene() and not inPlayMode:
		inPlayMode = true
		print("in play mode")
		dock.StopAudio()
	
	elif not editorInterface.is_playing_scene() and inPlayMode:
		inPlayMode = false
		print("out of play mode")
		dock.StartAudio()

func PlayPressed():
	print("eee")

func PlayAudio():
	var player:AudioStreamPlayer = dock.get_node("Audio")
	player.play()
	
	
func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_control_from_docks(dock)
	dock.free()
