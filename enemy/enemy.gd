extends CharacterBody2D

@export var speed := 100
@export var detection_range := 200.0

var player

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	if player:
		var distance = global_position.distance_to(player.global_position)
		
		if distance <= detection_range:
			var dir = (player.global_position - global_position).normalized()
			velocity = dir * speed
		else:
			velocity = Vector2.ZERO
		
		var collision = move_and_collide(velocity * delta)
		
		if collision:
			var obj = collision.get_collider()
			
			if obj.is_in_group("player"):
				get_tree().call_group("game", "lose")
