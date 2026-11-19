extends CharacterBody2D

const PLAYER_NODE_PATH: String = "/root/Main/player"

@export var SPEED: float = 240.0
@export var MAX_STEERING_FORCE: float = 10.3

var target: Vector2 = Vector2.ZERO
var player_node: Node2D

func _ready() -> void:
	if get_node(PLAYER_NODE_PATH) == null :
		print("[WARNING] :: Player not found in Scene Tree")
		return
	
	player_node = get_node(PLAYER_NODE_PATH)
	target = player_node.global_position
	
func _physics_process(_delta: float) -> void:
	
	target = get_node(PLAYER_NODE_PATH).global_position
	var direction: Vector2 = global_position.direction_to(target)
	var desired_velocity: Vector2 = direction * SPEED
	var steering: Vector2 = desired_velocity - velocity
	
	velocity += steering.limit_length(MAX_STEERING_FORCE)
	move_and_slide()
