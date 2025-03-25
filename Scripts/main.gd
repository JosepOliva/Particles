extends Node
var levels = [
	"res://Scenes/rain.tscn",
	"res://Scenes/fireworks.tscn",
]

var current_index = 0

func _ready():
	load_effect(current_index)

func load_effect(index):
	for child in $EffectHolder.get_children():
		$EffectHolder.remove_child(child)
		child.queue_free()
	var levels_scene = load(levels[index]).instantiate()
	$EffectHolder.add_child(levels_scene)
	

func _on_next_button_pressed():
	current_index = (current_index + 1) % levels.size()
	load_effect(current_index)

func _on_previous_button_pressed():
	current_index = (current_index - 1 + levels.size()) % levels.size()
	load_effect(current_index)
