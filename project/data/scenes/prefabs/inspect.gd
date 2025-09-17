extends Control

@export var label: Label
@export var texture_rect: TextureRect

func set_data(painting_rs:paintingResource):
	var temp_str:String = painting_rs.message
	label.text = temp_str
	texture_rect.texture = painting_rs.painting
