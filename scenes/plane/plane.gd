extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
const SPEED = GameManager.PLANE_SPEED
@export var amplitude = -400

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("space"):
		velocity.y = amplitude
		animation_player.play('fly')
	
	if get_rotation_degrees() == 0 or get_rotation_degrees() != 20:
		animated_sprite_2d.rotate(0.01)
		
	move_and_slide()
	
	if is_on_floor():
		gameover()
	 	


func gameover() -> void:
	set_physics_process(false)
	animated_sprite_2d.stop()
	SignalHub.on_plane_died.emit()
