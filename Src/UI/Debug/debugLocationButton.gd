

















extends Node

export (String, FILE) var stage_file_path
export (bool) var player_skipped = false
export (bool) var clear_current_pos_location = false

func _clear_current_pos_location():
	PosManager.curr_start_pos = ""

func _player_skipped():
	_clear_current_pos_location()
	EventManager.link_to_target("res://Src/1_World/1_zones/ship/Stage_09-Warehouse.tscn", "lockedDoor", true)


func _on_self_pressed():
	var temp_file = File.new()
	if not temp_file.file_exists(stage_file_path):
		print_debug(self.get_name(), ": File does not exist. Will not change scene. Please check if file path correct.")
		return

	if player_skipped:
		_player_skipped()
	elif clear_current_pos_location:
		_clear_current_pos_location()
	
	get_node("/root/SceneChanger")._change_scene(stage_file_path)




"""
# ================================================================
# USING PACKEDSCENE INSTEAD OF (String, FILE)

# Why: 
#	I'd like to have a file dir reference for this button's target
#	scene. That way, if I move or rename my stage.tscn files, then
#	target_location will be updated everytime there is a name or 
#	directory change.

# Why it doesn't work:
# 	There is a weird quirk with PackedScene. Here's an example.
#	debugLocationsOverlay is instantiated by Player. Player is 
#	always already on the stage. Now, when I pack a stage scene, it 
#	also includes the player.

# Effectively, there is an infinite feedback loop of the player
#	packing a stage, which also includes a reference to the player,
#	who will then also pack the stage, and so on.

export (PackedScene) var target_location
func _on_self_pressed():
	# Go to scene
	print(target_location.get_path())
	pass
"""
