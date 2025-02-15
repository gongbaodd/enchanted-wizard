extends XRToolsPickable

@export var FireBall: PackedScene
@export var ballSpeed: float = 10.0

func action():
	super.action()
	_spawnFireBall()
	
func _spawnFireBall():
	var newFireBall: RigidBody3D = FireBall.instantiate()
	if (newFireBall):
		#newFireBall.set_as_toplevel(true)
		add_sibling(newFireBall)
		newFireBall.global_position = $SpawnPos.global_position
		var forwarDir = $SpawnPos.global_transform.basis.x.normalized()
		newFireBall.linear_velocity += forwarDir * ballSpeed
		
