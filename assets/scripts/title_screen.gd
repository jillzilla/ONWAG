extends Node

#functions
func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/night_screen.tscn");

func _on_quit_button_pressed() -> void:
	get_tree().quit();
