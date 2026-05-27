extends TextureButton


class_name UiButton
@onready var label: Label = $Label

@export var text: String = "Button"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = text
