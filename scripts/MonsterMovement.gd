extends Node3D

@export var speed: float = 0.2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var forward_dir = global_transform.basis.z.normalized()
	position += forward_dir * speed * delta
