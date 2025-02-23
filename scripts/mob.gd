extends CharacterBody2D
class_name Mob

@export var BASE_SPEED = 100

@onready var animation_player: AnimationPlayer = $AnimatedSprite2D/AnimationPlayer

var spawnPosition: Vector2
var spawnRotation: float
var health: float
var speed: float

func _ready():
	$AnimatedSprite2D.play()
	global_position = spawnPosition
	global_rotation = spawnRotation
	health = 3
	speed = randf_range(BASE_SPEED, 3 * BASE_SPEED)

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, speed).rotated(spawnRotation)
	move_and_collide(velocity * delta)
	
func isHit():
	health -= 1
	animation_player.stop()
	if (health > 0):
		animation_player.play("damageFlash")
	if (health == 0):
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
