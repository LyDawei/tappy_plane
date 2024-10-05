extends Control

@onready var timer: Timer = $Timer
@onready var try_again_label: Label = $try_again_label
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalHub.on_plane_died.connect(on_plane_died)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if try_again_label.visible and Input.is_action_just_pressed("space"):
		GameManager.load_main_scene()
	pass


func on_plane_died() -> void:
	show()
	timer.start()
	audio_stream_player.play()
	GameManager.set_high_score()
	GameManager.save_high_score()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	try_again_label.visible = true
	pass # Replace with function body.
