extends CharacterBody2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var interaction_area: Area2D = $InteractionArea


const SPEED = 100.0


func _physics_process(delta: float) -> void:
	if GameState.game_state == GameState.game_states.PLAYER:
		if Input.is_action_just_pressed("INTERACT"):
			interact()
		##print(velocity.y)
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var directionY := Input.get_axis("UP", "DOWN")
		var directionX := Input.get_axis("LEFT", "RIGHT")
		if directionX:
			velocity.x = directionX * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		if directionY:
			velocity.y = directionY * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
			
		if velocity == Vector2.ZERO:
			animation_tree.get("parameters/playback").travel("idle")
		else:
			animation_tree.get("parameters/playback").travel("walk")
			animation_tree.set("parameters/idle/blend_position", velocity)
			animation_tree.set("parameters/walk/blend_position", velocity)
		move_and_slide()
		closest_show_ui()



func get_closest_interact():
	if not interaction_area.get_overlapping_areas() == null:
		var areas = interaction_area.get_overlapping_areas()
		var min_distance:float = 9999
		var closest_area = null
		for i in areas:
			if i.global_position.distance_to(global_position) < min_distance:
				closest_area = i
				min_distance = i.global_position.distance_to(global_position)
		if not closest_area == null:
			return closest_area.get_parent()

func closest_show_ui():
	var areas = interaction_area.get_overlapping_areas()
	var closest_area = get_closest_interact()
	for i in areas:
		if i.get_parent() == closest_area:
			i.get_parent().show_animation()
		if not i.get_parent() == closest_area:
			i.get_parent().hide_animation()

func interact():
	get_closest_interact().trigger()
