extends Area2D

#var velocity: Vector2

func attack():
	for enemy in get_overlapping_areas():
		if enemy is Enemy:
			enemy.health -= 50
			queue_free()
			

func _process(delta: float) -> void:
	attack()
	#position += velocity*delta
