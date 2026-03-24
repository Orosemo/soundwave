extends Node2D


func _on_3d_button_pressed() -> void:
	get_tree().change_scene_to_file("res://demo/demo_2d.tscn")


func _on_2d_button_pressed() -> void:
	pass # Replace with function body.
