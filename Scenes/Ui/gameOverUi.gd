extends Control

@export var wait_time: float = 2.0

@onready var score_label: Label = $VB/ScoreLabel
@onready var press: Label = $VB/Press

var _can_shoot: bool = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		GameManager.load_main_scene()
	if _can_shoot and event.is_action_pressed("ui_accept"):
		GameManager.load_level_scene()
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused


func _ready() -> void:
	hide()
	get_tree().paused = false
	SignalHub.on_player_died.connect(player_died)
	

func player_died() -> void:
	get_tree().paused = true
	show()
	await get_tree().create_timer(wait_time).timeout
	_can_shoot = true
	score_label.text = "Score:%s (Best:%s)" % [
		ScoreManager.score,
		ScoreManager.high_score
	]
	score_label.show()
	press.show()
