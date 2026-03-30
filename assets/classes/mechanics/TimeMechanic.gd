extends Mechanics
class_name TimeMechanic

#variables
@export var timer: Timer = null;
@export var counter: Label = null;

@export var iterations : Array[String] = [];
var current_iteration : int = 0;

#functions
func _ready() -> void:
	timer.connect("timeout",_timer_timeout);
	
	timer.one_shot = true;
	timer.start();

func _timer_timeout() -> void:
	current_iteration += 1;
	
	counter.text = str(iterations[current_iteration]);
	
	if current_iteration < iterations.size() - 1:
		timer.start();
	elif current_iteration >= iterations.size() - 1:
		get_tree().change_scene_to_file("res://assets/scenes/title_screen.tscn");
