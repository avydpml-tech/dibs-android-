extends Node

signal bored_mode_set
signal exploration_mode_set
signal sfw_mode_set(value)
signal one_handed_mode_set
signal jump_stamina_drain_set
signal infinite_ammo_mode_set
signal auto_combine_ammo_mode_set
signal one_handed_deadzone_set


var keyboard_layout = "QWERTY"
var controls = {
	
	"QWERTY": [KEY_SPACE, KEY_W, KEY_A], 
	"AZERTY": [KEY_SPACE, KEY_Z, KEY_Q]
}
var input_map = ["ui_up", "ui_up", "ui_left"]



var is_bored_mode: bool = false setget set_bored_mode
var is_exploration_mode: bool = false setget set_exploration_mode
var is_sfw_mode: bool = false setget set_sfw_mode
var is_one_handed_mode: bool = false setget set_one_handed_controls
var is_jump_stamina_drain_mode: bool = false setget set_jump_stamina_drain_mode
var is_frisky: bool = false setget set_frisky
var is_infinite_ammo_mode: bool = false setget set_infinite_ammo_mode
var is_auto_combine_ammo_mode: bool = false setget set_auto_combine_mode


var is_autosave: bool = true
var one_handed_deadzone: float = 0 setget set_one_handed_deadzone


func set_bored_mode(value):
	is_bored_mode = value
	
	emit_signal("bored_mode_set")


func set_exploration_mode(value):
	is_exploration_mode = value
	if is_exploration_mode:
		connect_plants_to_exploration_mode()
	emit_signal("exploration_mode_set")


func set_sfw_mode(value):
	is_sfw_mode = value
	emit_signal("sfw_mode_set")


func set_one_handed_controls(value):
	is_one_handed_mode = value
	emit_signal("one_handed_mode_set")


func set_jump_stamina_drain_mode(value):
	is_jump_stamina_drain_mode = value
	emit_signal("jump_stamina_drain_set")



func set_frisky(value):
	is_frisky = value

func set_infinite_ammo_mode(value):
	is_infinite_ammo_mode = value
	emit_signal("infinite_ammo_mode_set")


func set_auto_combine_mode(value):
	is_auto_combine_ammo_mode = value
	emit_signal("auto_combine_ammo_mode_set")


func set_one_handed_deadzone(value):
	one_handed_deadzone = value
	emit_signal("one_handed_deadzone_set")


func connect_plants_to_exploration_mode():
	for p in get_tree().get_nodes_in_group("Nonplayer"):
		
		if not self.is_connected("exploration_mode_set", p, "exploration_mode_changed"):
			self.connect("exploration_mode_set", p, "exploration_mode_changed")
		


func change_keyboard_layout( var is_qwerty: bool):
	keyboard_layout = "QWERTY" if is_qwerty else "AZERTY"
	add_input_events(keyboard_layout)

	var other_layout = "QWERTY" if not is_qwerty else "AZERTY"
	remove_input_events(other_layout)



func add_input_events( var keyboard_layout):
	
	for i in range(len(input_map)):
		var event = InputEventKey.new()
		event.scancode = controls[keyboard_layout][i]
		InputMap.action_add_event(input_map[i], event)



func remove_input_events( var keyboard_layout_to_remove):
	for i in range(len(input_map)):
		var event = InputEventKey.new()
		event.scancode = controls[keyboard_layout_to_remove][i]
		InputMap.action_erase_event(input_map[i], event)













"""
https://docs.godotengine.org/en/stable/classes/class_@globalscope.html#enumerations
KEY_SPACE = 32 --- Space key.
KEY_AT = 64 --- @ key.
KEY_A = 65 --- A key.
KEY_B = 66 --- B key.
KEY_C = 67 --- C key.
KEY_D = 68 --- D key.
KEY_E = 69 --- E key.
KEY_F = 70 --- F key.
KEY_G = 71 --- G key.
KEY_H = 72 --- H key.
KEY_I = 73 --- I key.
KEY_J = 74 --- J key.
KEY_K = 75 --- K key.
KEY_L = 76 --- L key.
KEY_M = 77 --- M key.
KEY_N = 78 --- N key.
KEY_O = 79 --- O key.
KEY_P = 80 --- P key.
KEY_Q = 81 --- Q key.
KEY_R = 82 --- R key.
KEY_S = 83 --- S key.
KEY_T = 84 --- T key.
KEY_U = 85 --- U key.
KEY_V = 86 --- V key.
KEY_W = 87 --- W key.
KEY_X = 88 --- X key.
KEY_Y = 89 --- Y key.
KEY_Z = 90 --- Z key.

# Mouse wheel 
if event is InputEventMouseButton:
	if event.is_pressed():
		# zoom in
		if event.button_index == BUTTON_WHEEL_UP:
			zoom_pos = get_global_mouse_position()
			# call the zoom function
		# zoom out
		if event.button_index == BUTTON_WHEEL_DOWN:
			zoom_pos = get_global_mouse_position()
			# call the zoom function
"""
	
	
	
