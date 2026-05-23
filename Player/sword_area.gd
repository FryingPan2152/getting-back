class_name SwordArea
extends Area2D

@onready var anim_player := $AnimationPlayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("sword_attack"):
		anim_player.play("sword_attack")

func attack_enemies():
	for body in get_overlapping_areas():
		if body is Enemy:
			body.take_damage(50)
