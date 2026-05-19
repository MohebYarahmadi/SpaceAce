extends Projectile

class_name BulletBase

enum BulletType {
	Player,
	Enemy,
	Bomb
}

var _direction := Vector2.UP
var _speed: float = 20.0


func _process(delta: float) -> void:
	position += delta * _direction * _speed


func setup(dir: Vector2, speed: float):
	_direction = dir
	_speed = speed
