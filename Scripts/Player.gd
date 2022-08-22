extends Sprite

var speed = 100
var velocity = Vector2(1, 0)
var hp = 10
var can_shoot = true

var bullet = preload("res://Assets/Bullet.tscn")

func _ready():
	Global.player = self

func _exit_tree():
	Global.player = null

func _process(delta):
	global_position += speed * velocity * delta
	
	if Input.is_action_pressed("action_key") and Global.node_creation_parent != null and can_shoot:
		Global.instance_node(bullet, global_position, Global.node_creation_parent)
		$Reload_speed.start()
		can_shoot = false
	if hp <= 0:
		
		queue_free()

func _on_Reload_speed_timeout():
	can_shoot = true

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Player_damager"):
		modulate = Color.white
		hp -= 1
		$Hit.play()
		area.get_parent().queue_free()
