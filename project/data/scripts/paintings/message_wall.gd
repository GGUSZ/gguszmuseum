extends Node2D
const WALL = preload("res://data/scenes/prefabs/wall.tscn")


func trigger():
	GameState.set_game_gui()
	var new_inspect = WALL.instantiate()
	get_tree().root.get_child(1).canvas_layer.add_child(new_inspect)
