extends Control


func _on_play_btn_pressed() -> void:
	GameManager.load_level_scene()


func _on_exit_btn_pressed() -> void:
	get_tree().quit()
