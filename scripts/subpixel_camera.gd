extends Camera2D

@onready var player: CharacterBody2D = $"../Player"
var actual_cam_pos : Vector2 
var look_ahead := 100

func _process(delta: float) -> void:
	var cam_pos : Vector2
	var player_direction = player.velocity.normalized().x
	cam_pos = Vector2(player.position.x + (look_ahead * player_direction), player.position.y-60)
	actual_cam_pos = actual_cam_pos.lerp(cam_pos, delta*2)
	
	var cam_subpixel_offset = actual_cam_pos.round() - actual_cam_pos
	
	get_parent().get_parent().get_parent().material.set_shader_parameter("cam_offset", cam_subpixel_offset)
	
	global_position = actual_cam_pos.round()
