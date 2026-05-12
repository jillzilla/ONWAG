extends Mechanics
class_name StaticFadeEffect

signal stop_effect;

#variables
@onready var fade_tween : Tween = null;
@export var static_ : AnimatedSprite2D;

var is_emitting : bool = false;

#methods
func _ready() -> void:
	stop_effect.connect(_stop_current_effect);

func _trigger_fade_effect(start: float, finish: float, time: float) -> void:
	fade_tween = create_tween();
	is_emitting = true;
	static_.modulate.a = start;
	fade_tween.tween_property(static_,"modulate:a",finish,time).set_trans(Tween.TRANS_CUBIC);
	await fade_tween.finished;
	is_emitting = false;
	fade_tween = null;

func _stop_current_effect() -> void:
	if fade_tween != null:
		fade_tween.stop();
	else:
		return;
