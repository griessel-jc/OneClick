extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()
	$MenuOverlay.rect_size = OS.get_screen_size()

func _on_StartButton_pressed():
	get_tree().change_scene("res://Levels/level_0.tscn")


func _on_OptionsButton_pressed():
	var options = load("res://Menus/options.tscn").instance()
	get_tree().current_scene.add_child(options)


func _on_QuitButton_pressed():
	get_tree().quit()
