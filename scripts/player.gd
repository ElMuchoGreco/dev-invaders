extends Area2D

signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

var attack_speed

@onready var main = get_tree().get_root().get_node("GameContainer")
@onready var bullet = load("res://bullet.tscn")

func _ready() -> void:
	screen_size = get_viewport_rect().size


# Equivilent to update():
func _process(delta: float) -> void:
	$AnimatedSprite2D.play()
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func shoot():
	var bulletInstance = bullet.instantiate()
	bulletInstance.spawnPosition = global_position
	bulletInstance.spawnPosition.y -= 50
	bulletInstance.spawnRotation = global_rotation
	main.add_child.call_deferred(bulletInstance)

func _on_body_entered(_body: Node2D) -> void:
	hit.emit()
	print("i am hit!")
