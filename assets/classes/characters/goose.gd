extends Character
class_name Goose

#variables
@export var graphics : Dictionary[String,Sprite2D] = {};
@export var cameras_for_graphics : Dictionary[String, Sprite2D] = {};
@export var knife : Sprite2D;
@export var static_fade_effect : StaticFadeEffect;
@export var camera_change_sound : AudioStreamPlayer;
@export var monitor_mechanic : MonitorMechanic;

var camera_a_alt : bool = false;

#functions
func _move() -> void:
	match(current_location):
		location.camera_a:
			if !camera_a_alt:
				camera_a_alt = true;
			else:
				current_location = [location.camera_b,location.camera_c].pick_random();
				camera_a_alt = false;
		location.camera_b:
			current_location = [location.camera_a,location.camera_c].pick_random();
		location.camera_c:
			current_location = [location.camera_a,location.camera_b].pick_random();

func _handle_graphics() -> void:
	if monitor_mechanic.isMonitorFullyOpened:
		for i in cameras_for_graphics.size():
			if cameras_for_graphics[cameras_for_graphics.keys()[i]].visible && graphics[graphics.keys()[i]].visible:
				if static_fade_effect.is_emitting:
					static_fade_effect.stop_effect.emit();
				static_fade_effect._trigger_fade_effect(1,0.2,0.5);
				camera_change_sound.play();
				break;
	
	for i in graphics.size():
		graphics[graphics.keys()[i]].visible = false;
	
	knife.visible = true;
	
	match(current_location):
		location.camera_a:
			if !camera_a_alt:
				graphics["camera_a"].visible = true;
			else:
				graphics["camera_a_alt"].visible = true;
		location.camera_b:
			graphics["camera_b"].visible = true;
		location.camera_c:
			graphics["camera_c"].visible = true;
			knife.visible = false;
