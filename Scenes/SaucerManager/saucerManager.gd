extends Node2D

class_name SaucerManager

const SAUCER = preload("uid://copsjn0l360pt")
const WAIT_TIME: float = 5.0
const WAIT_VARIATION: float = 0.1

@onready var paths: Node2D = $Paths
@onready var spawn_timer: Timer = $SpawnTimer

var _path2Ds: Array[Path2D] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Add all the paths that we have in our Paths to this array
	for path in paths.get_children():
		_path2Ds.append(path)
	reset_timer()


func reset_timer() -> void:
	SpaceUtils.set_and_start_timer(spawn_timer, WAIT_TIME, WAIT_VARIATION)


func spawn_saucer():
	var saucer: Saucer = SAUCER.instantiate()
	var path: Path2D = _path2Ds.pick_random()
	path.add_child(saucer)
	reset_timer()
	


func _on_spawn_timer_timeout() -> void:
	spawn_saucer()
