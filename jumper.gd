extends StaticBody3D

const SPEED = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector3.ZERO
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += SPEED * delta
	if position.x > 50:
		position.x = -50
