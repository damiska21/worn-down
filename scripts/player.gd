extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -400.0
var last_direction

@onready var animation_tree: AnimationTree = $AnimationTree

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity.x != 0:
		last_direction = velocity.normalized().x 
	
	#settování směru koukání na všechny animace
	animation_tree.set("parameters/idle/blend_position",last_direction)
	animation_tree.set("parameters/run/blend_position",last_direction)
	animation_tree.set("parameters/attack/blend_position",last_direction)

	move_and_slide()
