extends Button

var cost = 50

func _on_pressed() -> void:
	Player.points -= cost
	Player.max_shield += 10
	pass # Replace with function body.

func _process(delta: float) -> void:
	disabled = Player.points < cost
