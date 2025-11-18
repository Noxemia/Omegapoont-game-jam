extends PanelContainer

const GAME = preload("res://scenes/game.tscn")

func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_packed(GAME)

func _on_button_server_pressed() -> void:
	# Mayhaps call on some type of start server function in server.gd
	# Then we can change some stuff in autoloads and the scripts, after that we should be able to get a dedicated server up on itch.io
	pass # Replace with function body.
