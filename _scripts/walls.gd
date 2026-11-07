extends Node2D

@onready var top_wall: Area2D = $TopWall
@onready var bottom_wall: Area2D = $BottomWall

var _speed: float = 200.0

func setup(init_speed: float) -> void:
	if init_speed < 0:
		return
	_speed = init_speed

func _ready() -> void:
	top_wall.body_entered.connect(_on_wall_hit)
	bottom_wall.body_entered.connect(_on_wall_hit)
	
func _on_wall_hit(body: Node2D) -> void:
	if body.name == "Player":
		print("게임 오버!")
		
func _process(delta: float) -> void:
	position.x -= _speed * delta
	if position.x < -100:
		queue_free()
