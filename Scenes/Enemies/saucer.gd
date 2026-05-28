extends EnemyBase

class_name Saucer

@onready var shoot_timer: Timer = $ShootTimer
@onready var hit_box: Area2D = $HitBox

var _is_shooting: bool = false
var _is_dead: bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !_is_shooting:
		super(delta)


func set_shooting(s: bool) -> void:
	_is_shooting = s


func fire_missile() -> void:
	SignalHub.emit_on_create_homig_missile(global_position)


func _on_shoot_timer_timeout() -> void:
	set_shooting(true)


func _on_health_bar_died() -> void:
	_is_dead = true
	shoot_timer.stop()
	set_process(false)
	SpaceUtils.toggle_area2d(hit_box, false)
	ScoreManager.increment_score(points)


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == "die":
		die()
