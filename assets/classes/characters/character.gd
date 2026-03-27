extends Node
class_name Character

#variables
enum location {camera_a,camera_b,camera_c,office};

@export_range(0,20) var ai_level : int = 0;

@export var current_location : Variant = location.camera_a;
@export var position_reset : Variant = location.camera_a;

@export var timer_movement : Timer;
@export var timer_kill_player : Timer;
@export var timer_counter : Timer;

@export var can_kill_player : bool = true;
@export var can_player_counter : bool = true;

#functions
func _ready() -> void:
	timer_movement.connect("timeout",_timer_movement_timeout);
	
	if can_kill_player:
		timer_kill_player.connect("timeout",_timer_kill_player_timeout);
		
	if can_player_counter:
		timer_counter.connect("timeout",_timer_counter_timeout);
	
	if ai_level != 0 && current_location != location.office:
		timer_movement.start();
	
func _timer_movement_timeout() -> void:
	if randi_range(1,20) <= ai_level:
		_move();
		_handle_graphics();
		_handle_sounds();
	
	if current_location != location.office:
		timer_movement.start();
	else:
		if can_kill_player:
			timer_kill_player.start();
		else:
			_annoy_player();
		
func _timer_kill_player_timeout() -> void:
	pass;

func _timer_counter_timeout() -> void:
	current_location = position_reset;
	
	_handle_graphics();
	_handle_sounds();
	
	timer_movement.start();

func _handle_graphics() -> void:
	pass;

func _handle_sounds() -> void:
	pass;

func _move() -> void:
	pass

func _annoy_player() -> void:
	pass;
