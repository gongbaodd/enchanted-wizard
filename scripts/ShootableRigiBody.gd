extends RigidBody3D


func _on_body_entered(body: Node) -> void:
	if body.has_meta("is_fireball") and body.get_meta("is_fireball"):
		queue_free()
