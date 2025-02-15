extends Node3D

@export var monsters: Array[PackedScene]
@export var area: Area3D

var xr_interface: XRInterface

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
		
	else:
		print("OpenXR not initialized, please check if your headset is connected")

func _spawn_monsters():
	var pos = _get_random_pos()
	var new_monster: Node3D = monsters.pick_random().instantiate()
	new_monster.global_transform.origin = pos
	new_monster.rotate_y(randf_range(0, 2*PI))
	new_monster.set_meta("is_monster", true)
	add_child(new_monster)
	
func _get_random_pos():
	var shape: Shape3D = area.get_child(0).shape
	var extents = shape.size * 0.5
	var random_offset = Vector3(
		randf_range(-extents.x, extents.x),
		randf_range(-extents.y, extents.y),
		randf_range(-extents.z, extents.z),		
	)
	return area.global_transform.origin + random_offset


func _on_timer_timeout() -> void:
		_spawn_monsters()
	

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.has_meta("is_monster") and body.get_meta("is_monster"):
		body.queue_free()
		print("remove monster")
