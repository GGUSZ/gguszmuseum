extends Node

enum game_states{
	PLAYER,
	GUI,
	OTHERS
}

var game_state: game_states = game_states.PLAYER

func set_game_player():
	game_state = game_states.PLAYER
func set_game_gui():
	game_state = game_states.GUI
func set_game_others():
	game_state = game_states.OTHERS
