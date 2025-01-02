extends RigidBody3D

var velocity = Vector3.ZERO
var speed = .2
var acceleration = 60
var screen_size = Vector3.ZERO # Size of the game window.
var player = Vector3.ZERO


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var size = get_viewport().size
	screen_size.x = size[0] - 500
	screen_size.y = size[1] - 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector3.ZERO

	if Input.is_action_pressed("ui_left"):
		direction.x += 1
	if Input.is_action_pressed("ui_right"):
		direction.x -= 1
	if Input.is_action_pressed("ui_up"):
		direction.y += 1
	if Input.is_action_pressed("ui_down"):
		direction.y -= 1

	player.x += direction.x * speed
	player.y += direction.y * speed

	position = player
	position = position.clamp(Vector3(-500,-500,0), screen_size)
