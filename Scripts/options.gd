extends Control

func _ready():
	$VBoxContainer/Fullscreen.grab_focus()

func _on_Back_pressed():
	get_tree().current_scene.remove_child(self)

func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	var isFullscreen = OS.window_fullscreen
	if !isFullscreen:
		$VBoxContainer/Fullscreen.text = "Fullscreen"
	else: 
		$VBoxContainer/Fullscreen.text = "Windowed"
		$OptionsOverlay.rect_size = OS.get_screen_size()


func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)


func _on_EffectsSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effects"), value)
	$TestEffects.play()


func _on_MasterSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)


func _on_OptionsOverlay_child_entered_tree(_node):
	$OptionsOverlay.rect_size = OS.get_screen_size()


func _on_MusicSlider_drag_started():
	$TestMusic.play()


func _on_MusicSlider_drag_ended(_value_changed):
	$TestMusic.stop()
