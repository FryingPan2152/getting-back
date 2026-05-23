extends Area2D
class_name AOE_Attack

func attack():
	for enemy in get_overlapping_areas():
		if enemy is Enemy:
			#enemy.health -= 50
			enemy.take_damage(50)
	queue_free()

func _ready() -> void:
	$AnimationPlayer.play("Attack")
