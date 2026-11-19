extends CharacterBody2D
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var SPEED: float = 300.0
@export var MAX_STEERING_FORCE: float = 1000.0

func _physics_process(_delta: float) -> void:
	
	var current_direction := Input.get_vector("left", "right", "up", "down")

	if current_direction != Vector2.ZERO:
		rotation = Vector2.UP.angle_to(current_direction)

	var desired_velocity: Vector2 = current_direction * SPEED
	var steering: Vector2 = desired_velocity - velocity

	velocity += steering.limit_length(MAX_STEERING_FORCE)

	move_and_slide()
