class_name Player
extends CharacterBody2D
@onready var camera:= $Camera2D
@onready var healthbar := $CanvasLayer/Control/VBoxContainer/Health
var Health := 100.0
static var last_position: Vector2
static var points := 0
var aoe_scene := preload("res://Player/a_oe_attack.tscn")
var puddle = null
var puddle_scene = preload("res://Player/m_1.tscn")
func _ready() -> void:
	last_position = global_position

func _process(delta: float) -> void: 
	healthbar.value = Health
	$CanvasLayer/Control2/Pts.text = str(points)
	$"CanvasLayer/Control/VBoxContainer/pud cooldown bar".value = (1 - ($"Pud cooldonw".time_left / $"Pud cooldonw".wait_time)) * 100.0
	if Input.is_action_just_pressed("Aoe"):
		var a = aoe_scene.instantiate()
		get_parent().add_child(a)
		a.global_position = global_position
		
	if Input.is_action_just_pressed("M1") and $"Pud cooldonw".is_stopped():
		
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
