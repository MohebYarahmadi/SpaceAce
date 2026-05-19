extends Node2D

const EXPLOSION = preload("uid://32ovesy8b5fc")
const POWER_UP = preload("uid://cngtd7wacyhf7")
const BOMB_BULLET = preload("uid://yk2ghb23ai4g")
const BULLET_ENEMY = preload("uid://8slbkqdm36uw")
const BULLET_PLAYER = preload("uid://dl5nvrjhgqxqs")

const ADD_OBJECT: String = "add_object"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_create_explosion.connect(create_explosion)
	SignalHub.on_create_powerup.connect(create_powerup)
	SignalHub.on_create_powerup_random.connect(create_powerup_random)
	SignalHub.on_create_bullet.connect(create_bullet)


func add_object(obj: Node, pos: Vector2) -> void:
	add_child(obj)
	obj.global_position = pos


func create_explosion(pos: Vector2, anim_name: String) -> void:
	var scene: Explosion = EXPLOSION.instantiate()
	scene.setup(anim_name)
	call_deferred(ADD_OBJECT, scene, pos)


func create_powerup(pos: Vector2, pu_type: PowerUp.PowerUpType) -> void:
	var pu: PowerUp = POWER_UP.instantiate()
	pu.power_up_type = pu_type
	call_deferred(ADD_OBJECT, pu, pos)


func create_powerup_random(pos: Vector2) -> void:
	var rpu: PowerUp.PowerUpType = PowerUp.PowerUpType.values().pick_random()
	create_powerup(pos, rpu)
	

func create_bullet(
	pos: Vector2, dir: Vector2, speed: float, bullet_type: BulletBase.BulletType
)-> void:
	# Which scene we want to create?
	var scene: BulletBase
	# Match the BulletType
	match bullet_type:
		BulletBase.BulletType.Player:
			scene = BULLET_PLAYER.instantiate()
		BulletBase.BulletType.Enemy:
			scene = BULLET_ENEMY.instantiate()
		BulletBase.BulletType.Bomb:
			scene = BOMB_BULLET.instantiate()
	if scene:
		scene.setup(dir, speed)
		call_deferred(ADD_OBJECT, scene, pos)
