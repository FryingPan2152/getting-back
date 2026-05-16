class_name Enemies
extends Node2D

var enemy_scene = preload("res://Enemy/enemy.tscn")
static var enemy_count:= 0



func _on_spawn_timer_timeout() -> void:
	if enemy_count < 40:
		var enemy: Enemy = enemy_scene.instantiate()
		enemy.global_position = global_position
		add_child(enemy)
		enemy_count += 1
