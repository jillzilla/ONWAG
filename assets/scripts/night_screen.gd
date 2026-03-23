extends Node

#functions
func _on_timer_next_scene_timeout() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/gameplay.tscn");
