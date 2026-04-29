extends CharacterBody2D

@export var speed := 500
var direction := Vector2.ZERO

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()

	var collision = move_and_collide(direction * speed * delta)
	
	if collision:
		if collision.get_collider().is_in_group("enemy"):
			collision.get_collider().queue_free()
		queue_free()
