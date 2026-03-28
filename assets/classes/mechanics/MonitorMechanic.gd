extends Mechanics
class_name MonitorMechanic

#variables
@export var button : TextureButton;
@export var monitor : AnimatedSprite2D;
@export var screen : Node2D;

@export var monitor_on_sound : AudioStreamPlayer;
@export var monitor_off_sound : AudioStreamPlayer;

var isOpen : bool = false;
var isMonitorFullyOpened : bool = false;

#functions
func _ready() -> void:
	button.connect("mouse_entered",_button_mouse_entered);
	monitor.connect("animation_finished",_monitor_animation_finished);

func _process(_delta: float) -> void:
	if get_viewport().get_mouse_position().y <= button.position.y - button.size.y / 2:
		if button.disabled:
			button.disabled = true;
			button.visible = true;

func _button_mouse_entered() -> void:
	button.disabled = true;
	button.visible = false;
	
	screen.visible = false;
	
	if !isOpen:
		monitor.visible = true;
		monitor.play("default");
		monitor_on_sound.play();
		isOpen = true;
	else:
		isMonitorFullyOpened = false;
		monitor.play_backwards("default");
		monitor_off_sound.play();
		isOpen = false;

func _monitor_animation_finished() -> void:
	if !isOpen:
		monitor.visible = false;
	else:
		isMonitorFullyOpened = true;
		screen.visible = true;
