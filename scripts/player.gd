extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 2*ProjectSettings.get_setting("physics/2d/default_gravity")
var facing_direction := 1  # 1 = right, -1 = left


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		animated_sprite_2d.play("default")
		velocity.x = direction * SPEED
		if direction != facing_direction:
			print_debug(direction)
			facing_direction = direction
			scale.x = abs(scale.x) * -1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.play("stand")


	move_and_slide()
