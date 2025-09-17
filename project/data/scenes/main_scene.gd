extends Node2D

@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _process(delta: float) -> void:
	if GameState.game_state == GameState.game_states.GUI:
		if Input.is_action_just_pressed("CLICK"):
			GameState.set_game_player()
			if canvas_layer.get_child(0):
				canvas_layer.get_child(0).queue_free()
