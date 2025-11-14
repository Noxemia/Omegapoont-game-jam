extends RigidBody2D

@onready var color_rect = $ColorRect
@onready var collision_shape = $CollisionShape2D

const paddle_speed = 500

func _ready() -> void:
	var color_size = color_rect.size * color_rect.scale
	collision_shape.shape.extents = color_size / 2
	collision_shape.global_position += color_size / 2

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("LeftPaddleUp"):
		global_position.y -= paddle_speed * delta
	if Input.is_action_pressed("LeftPaddleDown"):
		global_position.y += paddle_speed * delta
	
