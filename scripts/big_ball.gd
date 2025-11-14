extends RigidBody2D

@export var initial_velocity: Vector2

const min_x_speed = 200

func _ready():
	linear_velocity = initial_velocity

func _physics_process(delta: float) -> void:
	linear_velocity.x = sign(linear_velocity.x) * max(abs(linear_velocity.x), min_x_speed)
