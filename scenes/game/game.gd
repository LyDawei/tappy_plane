extends Node2D

const PIPES = preload("res://scenes/pipes/pipes.tscn")

@onready var spawn_timer: Timer = $SpawnTimer
@onready var spawn_point_a: Marker2D = $SpawnPointA
@onready var spawn_point_b: Marker2D = $SpawnPointB
@onready var pipes_holder: Node = $PipesHolder
@onready var game_over_canvas: CanvasLayer = $GameOverCanvas
@onready var score_label: Label = $ScoreLabel

func _ready() -> void:
	SignalHub.on_plane_died.connect(_on_plane_died)
	spawn_pipes()
	
func _process(delta: float) -> void:
	#pass
	score_label.text = "%d" % GameManager.score
	

func _on_spawn_timer_timeout() -> void:
	spawn_pipes()

func spawn_pipes() -> void:
	var new_pipes:Pipes = PIPES.instantiate()
	var y_position:float = randf_range(spawn_point_b.position.y, spawn_point_a.position.y)
	
	pipes_holder.add_child(new_pipes)
	new_pipes.position = Vector2(spawn_point_b.position.y, y_position)

func _on_plane_died() -> void:
	spawn_timer.stop()
	game_over_canvas.visible = true
	GameManager.save_high_score()
	pass # Replace with function body.
