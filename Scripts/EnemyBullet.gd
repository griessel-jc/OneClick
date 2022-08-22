extends Sprite

var velocity = Vector2(1, 0)
var speed = 600

var look_once = true

func _ready():
	$Shoot.play()

func _process(delta):
	if Global.player != null:
		velocity = global_position.direction_to(Global.player.global_position)
	global_position += velocity.rotated(rotation) * speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
