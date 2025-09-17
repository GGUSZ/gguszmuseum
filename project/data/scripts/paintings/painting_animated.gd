extends Node2D
@export var painting_resource:paintingResource
const ANIMATED_INSPECT = preload("res://data/scenes/prefabs/animated_inspect.tscn")

func trigger():
	GameState.set_game_gui()
	var new_inspect = ANIMATED_INSPECT.instantiate()
	new_inspect.set_data(painting_resource)
	get_tree().root.get_child(1).canvas_layer.add_child(new_inspect)
