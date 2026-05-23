extends Button

var cost = 100

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	Player.points -= cost
	Player.shield_regen_rate += 1.0


func _process(delta: float) -> void:
	disabled = Player.points < cost
