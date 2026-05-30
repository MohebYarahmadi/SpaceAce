extends Control

@onready var health_bar: HealthBar = $ColorRect/MarginContainer/HealthBar
@onready var sound: AudioStreamPlayer2D = $Sound
@onready var score_label: Label = $ColorRect/MarginContainer/ScoreLabel


func _ready() -> void:
	ScoreManager.reset_score()


func _enter_tree() -> void:
	SignalHub.on_player_hit.connect(player_hit)
	SignalHub.on_player_health_bonus.connect(health_bonus)
	SignalHub.on_score_updated.connect(score_updated)


func player_hit(v: int) -> void:
	health_bar.take_damage(v)


func health_bonus(v: int) -> void:
	health_bar.incr_value(v)
	sound.play()
	

func score_updated(v: int) -> void:
	score_label.text = "%06d" % v


func _on_health_bar_died() -> void:
	SignalHub.emit_on_player_died()
