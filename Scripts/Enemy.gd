extends Sprite

var speed = 150
var velocity = Vector2()

var stun = false
var hp = 3
var can_shoot = true

var bullet = preload("res://Assets/EnemyBullet.tscn")

func _process(delta):
	if Global.player != null and stun == false:
		velocity = global_position.direction_to(Global.player.global_position)
	elif stun:
		velocity = lerp(velocity, Vector2(0, 0), 0)
		can_shoot = false
	global_position += velocity * speed * delta
	if hp <= 0:
		queue_free()
	if can_shoot == true and Global.player != null and Global.node_creation_parent != null:
		Global.instance_node(bullet, global_position, Global.node_creation_parent)
		$Shoot_timer.start()
		can_shoot = false

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager"):
		modulate = Color.white
		if stun == true:
			velocity = velocity * 2
		else:
			velocity = -velocity * 2
		stun = true
		hp -= 1
		$Stun_timer.start()
		area.get_parent().queue_free()


func _on_Stun_timer_timeout():
	modulate = Color("f00000")
	stun = false


func _on_Shoot_timer_timeout():
	can_shoot = true
