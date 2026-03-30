extends Character
class_name Goose

#variables
@export var time_mechanic : TimeMechanic;

@export var knife : Sprite2D;
var camera_a_alt : bool = false;

#functions
func _move() -> void:
	match(current_location):
		location.camera_a:
			if !camera_a_alt:
				camera_a_alt = true;
			else:
				if time_mechanic.current_iteration < 5:
					current_location = [location.camera_b,location.camera_c].pick_random();
				elif time_mechanic.current_iteration >= 5:
					current_location = [location.camera_b,location.camera_c,location.office].pick_random();
				camera_a_alt = false;
		location.camera_b:
			if time_mechanic.current_iteration < 5:
				current_location = [location.camera_a,location.camera_c].pick_random();
			elif time_mechanic.current_iteration >= 5:
				current_location = [location.camera_a,location.camera_c,location.office].pick_random();
		location.camera_c:
			if time_mechanic.current_iteration < 5:
				current_location = [location.camera_a,location.camera_b].pick_random();
			elif time_mechanic.current_iteration >= 5:
				current_location = [location.camera_a,location.camera_b,location.office].pick_random();

func _handle_graphics() -> void:
	_reset_graphics_visibility();
	
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
