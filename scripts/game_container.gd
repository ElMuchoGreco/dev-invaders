extends Node

@onready var mob = load("res://mob.tscn")
var score

func _ready() -> void:
	new_game()


func _process(_delta: float) -> void:
	pass

func game_over():
	print("Game Over!")
	$ScoreTimer.stop()
	$MobTimer.stop()
	$AttackSpeed.stop()

func new_game():
	score = 0
	$StartTimer.start()
	$AttackSpeed.start()
	
func _on_score_timer_timeout():
	score += 1

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_mob_timer_timeout():
	var mobInstance = mob.instantiate()
	var mob_spawn_position = Vector2(randf_range(0, 1920), 0)
	var mob_spawn_rotation = 0
	mobInstance.spawnPosition = mob_spawn_position
	mobInstance.spawnRotation = mob_spawn_rotation
	add_child.call_deferred(mobInstance)
