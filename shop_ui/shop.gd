class_name Shop
extends Panel

static var shop_open: bool = false

func _ready() -> void:
	visible = false
	shop_open = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shop_key"):
		shop_open = !shop_open
		visible = shop_open
