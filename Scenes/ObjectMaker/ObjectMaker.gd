extends Node2D

const EXPLOSION = preload("uid://32ovesy8b5fc")

const ADD_OBJECT: String = "add_object"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_create_explosion.connect(create_explosion)


func add_object(obj: Node, pos: Vector2) -> void:
	add_child(obj)
	obj.global_position = pos


func create_explosion(pos: Vector2, anim_name: String) -> void:
	var scene: Explosion = EXPLOSION.instantiate()
	scene.setup(anim_name)
	call_deferred(ADD_OBJECT, scene, pos)
