extends Node


signal on_player_hit(v: int)
signal on_score_updated(v: int)
signal on_create_explosion(pos: Vector2, anim_name: String)
signal on_create_powerup(pos: Vector2, pu_type: PowerUp.PowerUpType)
signal on_create_powerup_random(pos: Vector2)
signal on_create_bullet(
	pos: Vector2, dir: Vector2, speed: float, bullet_type: BulletBase.BulletType
)
signal on_player_health_bonus(v: int)
signal on_player_shoot


func emit_on_player_hit(v: int) -> void:
	on_player_hit.emit(v)

func emit_on_score_updated(v: int) -> void:
	on_score_updated.emit(v)

func emit_on_create_explosion(pos: Vector2, anim_name: String) -> void:
	on_create_explosion.emit(pos, anim_name)

func emit_on_create_powerup(pos: Vector2, pu_type: PowerUp.PowerUpType) -> void:
	on_create_powerup.emit(pos, pu_type)

func emit_on_create_powerup_random(pos: Vector2) -> void:
	on_create_powerup_random.emit(pos)

func emit_on_create_bullet(
	pos: Vector2, dir: Vector2, speed: float, bullet_type: BulletBase.BulletType
) -> void:
	on_create_bullet.emit(pos, dir, speed, bullet_type)

func emit_on_player_health_bonus(v: int) -> void:
	on_player_health_bonus.emit(v)

func emit_on_player_shoot() -> void:
	on_player_shoot.emit()
