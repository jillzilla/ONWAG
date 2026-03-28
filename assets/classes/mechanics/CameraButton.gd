extends Mechanics
class_name CameraButton

#variables
@export var button : Button;
@export var camera_to_show : Sprite2D;
@export var cursor_to_show : Sprite2D;
@export var camera_change_sound : AudioStreamPlayer;
@export var static_fade_effect : StaticFadeEffect;

#functions
func _ready() -> void:
	button.connect("pressed", _button_pressed);
	
func _button_pressed() -> void:
	if static_fade_effect.is_emitting:
		static_fade_effect.stop_effect.emit();
	static_fade_effect._trigger_fade_effect(1,0.2,0.5);
	
	camera_change_sound.play();
	
	for camera in get_tree().get_nodes_in_group("camera"):
		if camera != camera_to_show:
			camera.visible = false;

	for cursor in get_tree().get_nodes_in_group("cursor"):
		if cursor != cursor_to_show:
			cursor.visible = false;
			
		camera_to_show.visible = true;
		cursor_to_show.visible = true;
