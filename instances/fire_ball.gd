extends RigidBody3D

func _on_life_time_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node) -> void:
	if body.has_method("destory"):
		print("destory")
		body.destory()
	queue_free()
