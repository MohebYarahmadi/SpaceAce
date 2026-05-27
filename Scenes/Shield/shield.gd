extends Area2D

class_name Shield

@onready var timer: Timer = $Timer
@onready var sound: AudioStreamPlayer2D = $Sound
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var start_health: int = 5
var _health: int = start_health


func _ready() -> void:
	disable_shield()
	#enable_shield()	# For testing


func enable_shield() -> void:
	animation_player.play("RESET")
	_health = start_health
	timer.start()
	SpaceUtils.toggle_area2d(self, true)
	show()
	sound.play()


func disable_shield() -> void:
	timer.stop()
	SpaceUtils.toggle_area2d(self, false)
	hide()
	


func hit() -> void:
	animation_player.play("hit")
	_health -= 1
	if _health <= 0:
		disable_shield()


func _on_timer_timeout() -> void:
	disable_shield()


func _on_area_entered(area: Area2D) -> void:
	hit()
