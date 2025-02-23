extends CharacterBody2D
class_name Bullet

@export var SPEED = 750

var spawnPosition: Vector2
var spawnRotation: float

func _ready():
	global_position = spawnPosition
	global_rotation = spawnRotation

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -SPEED).rotated(spawnRotation)
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		print(collision.get_collider().get_instance_id())
		if collision.get_collider().has_method("isHit"):
			collision.get_collider().isHit()
		queue_free()
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
