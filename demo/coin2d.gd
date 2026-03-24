extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	$CollisionShape2D.disabled = true
	$AnimationPlayer.play("dissapear")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "dissapear":
		queue_free()
