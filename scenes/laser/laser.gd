extends Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == 'plane':
		GameManager.add_point()
		audio_stream_player_2d.play()
	pass # Replace with function body.
