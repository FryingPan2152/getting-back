extends Node2D

var enemy_scene = preload("res://Enemy/enemy.tscn")




func _on_spawn_timer_timeout() -> void:
	var enemy: Enemy = enemy_scene.instantiate()
	enemy.global_position = global_position
	add_child(enemy)
