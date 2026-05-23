class_name Player
extends CharacterBody2D
@onready var camera:= $Camera2D
@onready var healthbar := $CanvasLayer/Control/VBoxContainer/Health

static var Health := 100.0
static var last_position: Vector2
static var points := 0

var shield:= 100.0
static var max_shield := 100.0
static var shield_regen_rate := 0.0

var aoe_scene := preload("res://Player/a_oe_attack.tscn")
var puddle = null
var puddle_scene = preload("res://Player/m_1.tscn")

func _ready() -> void:
	last_position = global_position

func _process(delta: float) -> void: 
	
	
	
	healthbar.value = Health
	$CanvasLayer/Control2/Pts.text = str(points)
	$"CanvasLayer/Control/VBoxContainer/pud cooldown bar".value = (1 - ($"Pud cooldonw".time_left / $"Pud cooldonw".wait_time)) * 100.0
	$CanvasLayer/Control/VBoxContainer/Shield.value = (shield / max_shield)*100
	$CanvasLayer/Control/VBoxContainer/Shield/Label.text = str(round(shield * 100) / 100) + "/" + str(round(max_shield))
	if shield < max_shield:
		shield = clamp(shield + delta * shield_regen_rate,0,max_shield)
	if Input.is_action_just_pressed("Aoe") and !Shop.shop_open:
		var a = aoe_scene.instantiate()
		get_parent().add_child(a)
		a.global_position = global_position
		
	if Input.is_action_just_pressed("M1") and $"Pud cooldonw".is_stopped() and !Shop.shop_open:
		
		if is_instance_valid(puddle):
			puddle.queue_free()
		
		var pud = puddle_scene.instantiate()
		get_parent().add_child(pud)
		puddle = pud
		pud.global_position = get_global_mouse_position()
		
		$"Pud cooldonw".start()
	
	if Input.is_action_pressed("Zoom Out"):
		camera.zoom -= Vector2(1,1) * delta
	if Input.is_action_pressed("Zoom In"):
		camera.zoom += Vector2(1,1) * delta
	
	if is_instance_valid(puddle):
		last_position = puddle.global_position
	else:
		last_position = global_position

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 1150
	#print(velocity)
	move_and_slide()

func take_damage(dmg):
	if shield > 0:
		var difference = shield - dmg
		if difference < 0:
			shield = 0
			Player.Health -= abs(difference)
		else:
			shield = shield - dmg
	else:
		Player.Health -= dmg
