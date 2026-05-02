class_name Player
extends CharacterBody2D
@onready var camera:= $Camera2D
@onready var healthbar := $CanvasLayer/Control/Health
var Health := 100.0
static var last_position: Vector2

func _ready() -> void:
	last_position = global_position

func _process(delta: float) -> void: 
	healthbar.value = Health
	if Input.is_action_pressed("Zoom Out"):
		camera.zoom -= Vector2(1,1) * delta
	if Input.is_action_pressed("Zoom In"):
		camera.zoom += Vector2(1,1) * delta
	
	last_position = global_position

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 1150
	#print(velocity)
	move_and_slide()
