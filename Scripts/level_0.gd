extends Node2D

func _ready():
	Global.node_creation_parent = self
	$Music.play()
	
func _exit_tree():
	Global.node_creation_parent = null


func _on_MainMenuBtn_pressed():
	get_tree().paused = true
	var menu = load("res://Menus/Menu.tscn").instance()
	get_tree().current_scene.add_child(menu)
	$Music.stop()
