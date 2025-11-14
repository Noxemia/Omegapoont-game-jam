extends Node2D

const big_ball_scene = preload("res://scenes/big_ball.tscn")
const small_ball_scene = preload("res://scenes/small_ball.tscn")

@onready var big_ball_timer = $BigBallTimer
@onready var small_ball_timer = $SmallBallTimer

const directions = [
	Vector2(1, 1),
	Vector2(1, -1),
	Vector2(-1, 1),
	Vector2(-1, -1)
]

var big_ball_instance
var small_ball_instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_spawn_big_ball()
	_spawn_small_ball()

func _spawn_big_ball() -> void:
	big_ball_instance = big_ball_scene.instantiate()
	add_child(big_ball_instance)
	
	big_ball_instance.global_position = Vector2(600, 400)
	big_ball_timer.start()

func _on_big_ball_timer_timeout() -> void:
	big_ball_instance.linear_velocity = big_ball_instance.initial_velocity * directions.pick_random()
	while big_ball_instance.linear_velocity == small_ball_instance.linear_velocity:
		big_ball_instance.linear_velocity = big_ball_instance.initial_velocity * directions.pick_random()
	
func _spawn_small_ball() -> void:
	small_ball_instance = small_ball_scene.instantiate()
	add_child(small_ball_instance)
	
	small_ball_instance.global_position = Vector2(690, 432)
	#small_ball_instance.get_node("Sprite2D").modulate.a = 0.5
	small_ball_timer.start()

func _on_small_ball_timer_timeout() -> void:
	small_ball_instance.linear_velocity = small_ball_instance.initial_velocity * directions.pick_random()
	while big_ball_instance.linear_velocity == small_ball_instance.linear_velocity:
		small_ball_instance.linear_velocity = small_ball_instance.initial_velocity * directions.pick_random()
