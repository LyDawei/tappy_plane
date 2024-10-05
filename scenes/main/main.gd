extends Node2D

@onready var score: Label = $MarginContainer/HSplitContainer/Score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	score.text = "%d" % GameManager.get_high_score()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		GameManager.reset_score()
		GameManager.load_game_scene()
	pass
