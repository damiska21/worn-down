extends Node2D

const SPEED = 120.0
var enemy = get_parent()

func _physics_process(delta: float) -> void:
	print(enemy)
	# Add the gravity.
	if not enemy.is_on_floor():
		enemy.velocity += enemy.get_gravity() * delta

	
	enemy.velocity.x = 1 * SPEED
	
	enemy.move_and_slide()
