extends Control

@onready var health_bar: HealthBar = $ColorRect/MarginContainer/HealthBar
@onready var sound: AudioStreamPlayer2D = $Sound


func _enter_tree() -> void:
	SignalHub.on_player_hit.connect(player_hit)
	SignalHub.on_player_health_bonus.connect(health_bonus)


func player_hit(v: int) -> void:
	health_bar.take_damage(v)


func health_bonus(v: int) -> void:
	health_bar.incr_value(v)
	sound.play()


func _on_health_bar_died() -> void:
	print("Player DIED")
