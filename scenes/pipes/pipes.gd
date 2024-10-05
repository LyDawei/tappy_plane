extends Node2D
class_name Pipes

const speed = GameManager.SCROLL_SPEED

func _ready() -> void:
	SignalHub.on_plane_died.connect(on_plane_died)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	position.x -= speed * delta
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.

func on_plane_died() -> void:
	set_process(false)

func _on_pipe_body_entered(body: Node2D) -> void:
	if body.name == 'plane' and body.has_method('gameover'):
		body.gameover()
	pass # Replace with function body.
