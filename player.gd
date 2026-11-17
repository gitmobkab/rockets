extends CharacterBody2D
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var SPEED = 300.0

func _physics_process(_delta: float) -> void:

	var direction := Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_just_pressed("down"):
		sprite_2d.flip_v =  true
	elif Input.is_action_just_pressed("up"):
		sprite_2d.flip_v =  false
	velocity = direction * SPEED
	
	move_and_slide()
