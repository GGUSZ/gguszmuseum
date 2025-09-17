extends Node2D
@onready var current_painting: Sprite2D = $painting/painting

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interact_popup: AnimatedSprite2D = $InteractPopup




@export var painting_resource:paintingResource
const INSPECT = preload("res://data/scenes/prefabs/inspect.tscn")

func _ready() -> void:
	if painting_resource:
		set_painting_texture(painting_resource.painting)

func set_painting_texture(new_texture: Texture2D):
	var old_texture_size = current_painting.texture.get_size()
	current_painting.texture = new_texture
	var new_texture_size = new_texture.get_size()
		# Calculate and apply scale to maintain visual size
	if new_texture_size != Vector2.ZERO:
		var scale_ratio = old_texture_size / new_texture_size
		current_painting.scale *= scale_ratio

func trigger():
	GameState.set_game_gui()
	var new_inspect = INSPECT.instantiate()
	new_inspect.set_data(painting_resource)
	get_tree().root.get_child(1).canvas_layer.add_child(new_inspect)


func show_animation():
	if interact_popup.visible == false:
		animation_player.play("show_gui")


func hide_animation():
	animation_player.play("hide_gui")

func show_ui():
	interact_popup.show()

func hide_ui():
	interact_popup.hide()


func _on_area_2d_area_exited(area: Area2D) -> void:
	hide_animation()
