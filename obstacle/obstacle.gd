extends CharacterBody2D

@export var speed := 100
@export var distance := 200

var start_position
var direction := 1

func _ready():
	start_position = global_position

func _physics_process(delta):
	velocity.x = speed * direction
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		var obj = collision.get_collider()
		
		# 👉 Si toca al player → pierde
		if obj.is_in_group("player"):
			get_tree().call_group("game", "lose")
		
		# 👉 Cambia dirección
		direction *= -1
	
	if abs(global_position.x - start_position.x) > distance:
		direction *= -1
