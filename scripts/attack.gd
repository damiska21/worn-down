extends Node2D

#chyby co možná stále existujou:
#na konci attacku problikne jeden z framů na druhým řádku, ten červenej

var attack_damage = 10
@export var attacking = true
var animation_time = 0.8 # in seconds

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		attack()

func attack():
	attacking = true
	await get_tree().create_timer(animation_time).timeout
	await get_tree().process_frame #kvůli tomu probliku
	attacking = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_hit"):
		print("hit")
