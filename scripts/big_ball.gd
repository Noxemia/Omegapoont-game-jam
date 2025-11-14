extends RigidBody2D

var initial_velocity = Vector2(300, 300)

const min_x_speed = 200

func _physics_process(delta: float) -> void:
	linear_velocity.x = sign(linear_velocity.x) * max(abs(linear_velocity.x), min_x_speed)
