extends Control

@export var label: Label

func set_data(painting_rs:paintingResource):
	var temp_str:String = painting_rs.message
	label.text = temp_str
