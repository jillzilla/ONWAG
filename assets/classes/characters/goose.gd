extends Character
class_name Goose

#variables
@export var graphics : Array[Sprite2D];
@export var knife : Sprite2D;

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
	for i in graphics.size():
		graphics[i].visible = false;
	
	knife.visible = true;
	
	match(current_location):
		location.camera_a:
			if !camera_a_alt:
				graphics[0].visible = true;
			else:
				graphics[1].visible = true;
		location.camera_b:
			graphics[2].visible = true;
		location.camera_c:
			graphics[3].visible = true;
			knife.visible = false;
