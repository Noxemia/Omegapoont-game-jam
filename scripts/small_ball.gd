extends RigidBody2D

@export var initial_velocity: Vector2

func _ready():
	linear_velocity = initial_velocity
