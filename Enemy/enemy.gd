class_name Enemy
extends Area2D
@onready var Healthbar:= $HealthBarE

var destination: Vector2
var attack_damage := 10.0
var health := 100.0


func _ready() -> void:
	destination = global_position
func _process(delta: float) -> void:
	
	Healthbar.set_point_position(1,Vector2(-100 + (health*2),-220))
	
	
	if health <= 0:
		Player.points += 10
		Enemies.enemy_count -= 1
		queue_free()
	
func _physics_process(delta: float) -> void:
	if !Shop.shop_open:
		#region Get to the player
		var distance_to_player = global_position.distance_to(Player.last_position)
		
		if distance_to_player > 100:
			var direction = global_position.direction_to(Player.last_position)
			position += direction * 800 * delta
		#endregion
		
		for body in get_overlapping_bodies():
			if body is Player:
				body.take_damage(attack_damage * delta)
				#Player.Health -= attack_damage * delta 
	
	
func take_damage(dmg):
	health -= dmg
