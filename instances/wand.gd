extends XRToolsPickable

@export var fireBall: PackedScene
@export var fireBallSpeed: float = 10.0

var canFire = true

func action():
	super.action()
	
	if canFire:
		_spawnFireball()
		canFire = false
		$cooldown.start()

func _spawnFireball():
	if fireBall:
		var newFireBall: RigidBody3D = fireBall.instantiate()
		if (newFireBall):
			newFireBall.set_as_toplevel(true)
			add_child(newFireBall)
			newFireBall.transform = $SpawnPoint.global_position
			newFireBall.linear_velocity = $SpawnPoint.position.z * fireBallSpeed


func _on_cooldown_timeout() -> void:
	canFire = true
