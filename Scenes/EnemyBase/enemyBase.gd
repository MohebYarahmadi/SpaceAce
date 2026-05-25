extends PathFollow2D

class_name EnemyBase

@export var points: int = 10
@export var crash_damage: int = 10
@onready var booms: Node2D = $Booms

var _speed: float = 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func make_boom() -> void:
	for b in booms.get_children():
		SignalHub.emit_on_create_explosion(b.global_position, Explosion.BOOM)
