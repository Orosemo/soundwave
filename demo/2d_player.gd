extends CharacterBody2D

var score = 0

const SPEED = 200.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# back to menu
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://demo/demo.tscn")

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("a", "d")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.texture = load("res://demo/demo_assets/UI/Tiles/Characters/tile_0001.png")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.texture = load("res://demo/demo_assets/UI/Tiles/Characters/tile_0000.png")

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	score += 1
	$"../score".text = str(score) + "/7 gems collected"
