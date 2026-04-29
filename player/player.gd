extends CharacterBody2D

@export var speed := 160
@export var bullet_scene: PackedScene

func _physics_process(delta):
	var dir = Vector2.ZERO
	
	dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	dir.y = Input.get_action_strength("move_bottom") - Input.get_action_strength("move_up")
	
	dir = dir.normalized()
	velocity = dir * speed
	
	var collision = move_and_collide(velocity * delta)

	if collision:
		var obj = collision.get_collider()
	
		if obj is RigidBody2D:
			obj.apply_central_impulse(velocity * 0.5)

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	
	var dir = (get_global_mouse_position() - global_position).normalized()
	
	bullet.global_position = global_position + dir * 20
	bullet.direction = dir
