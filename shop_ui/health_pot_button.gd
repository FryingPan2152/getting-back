extends Button

var cost := 10

func _on_pressed() -> void:
	Player.Health += 10.0
	Player.points -= cost
	pass # Replace with function body.

func _process(delta: float) -> void:
	disabled = Player.points < cost
