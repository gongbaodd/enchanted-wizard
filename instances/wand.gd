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
		add_child(newFireBall)
		newFireBall.global_position = $SpawnPos.global_position
		newFireBall.linear_velocity.z = ballSpeed * $SpawnPos.position.z
		
