extends StaticBody3D

var SPEED = -60
var disabled = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector3.ZERO
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_P):
		disabled = true
	if Input.is_key_pressed(KEY_O):
		disabled = false
	if Input.is_key_pressed(KEY_I):
		SPEED *= -1
		
	if disabled:
		return
	position.x += SPEED * delta
	if position.x < -50:
		SPEED *= -1
	elif position.x > 50:
		SPEED *= -1
	
