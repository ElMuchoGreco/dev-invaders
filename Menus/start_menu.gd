extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_new_game_button_pressed() -> void:
	print("New Game Button Pressed!")
	get_tree().change_scene_to_file("res://GameContainer.tscn")


func _on_load_game_button_pressed() -> void:
	print("Load Game Button Pressed!")


func _on_options_button_pressed() -> void:
	print("Options Button Pressed!")


func _on_quit_button_pressed() -> void:
	print("Quit Button Pressed!")
