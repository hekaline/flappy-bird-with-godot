extends Node2D



var wall_scene := preload("res://_scenes/walls.tscn")
@export var spawn_interval: float = 3.0
@export var y_offset_range: float = 200.0
@export var wall_speed: float = 300.0
var timer: float = 0.0





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer >= spawn_interval:
		timer = 0.0
		spawn_wall()

func spawn_wall() -> void:
	var wall = wall_scene.instantiate()
	# spawn walls at (spawner.x, random y near spawner.y)
	var y_offset = randf_range(-y_offset_range, y_offset_range)
	wall.position = Vector2(global_position.x, global_position.y + y_offset)
	wall.setup(wall_speed);

	get_tree().current_scene.add_child(wall)
