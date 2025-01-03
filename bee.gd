extends CharacterBody3D


const SPEED = 25.0
const JUMP_VELOCITY = 20
const GRAVITY_MULTIPLIER = 4

@onready var bee_obj : Node = $BeebotSkin


func _ready() -> void:
	position = Vector3.ZERO


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta * GRAVITY_MULTIPLIER

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_key_pressed(KEY_R):
		position = Vector3.ZERO
		rotation_degrees = Vector3.ZERO
	
	if Input.is_key_pressed(KEY_B):
		bee_obj.power_off()
		
	if Input.is_key_pressed(KEY_E):
		rotation_degrees.y -= 3
	elif Input.is_key_pressed(KEY_Q):
		rotation_degrees.y += 3
	#elif Input.is_key_pressed(KEY_W):
	#	rotation_degrees.x -= 10
	#elif Input.is_key_pressed(KEY_S):
	#	rotation_degrees.x += 10
	elif Input.is_key_pressed(KEY_X):
		bee_obj.attack()
	


	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
