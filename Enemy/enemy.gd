class_name Enemy
extends Area2D

var destination: Vector2
var attack_damage := 10.0


func _ready() -> void:
	destination = global_position

func _physics_process(delta: float) -> void:
	
#region Get to the player
	var distance_to_player = global_position.distance_to(Player.last_position)
	
	if distance_to_player > 100:
		var direction = global_position.direction_to(Player.last_position)
		position += direction * 800 * delta
#endregion
	
	for body in get_overlapping_bodies():
		if body is Player:
			body.Health -= attack_damage * delta 
	
	
	
