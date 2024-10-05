extends Node

const SCROLL_SPEED: float = 120.0
const PLANE_SPEED: float = 300
const GAME:PackedScene = preload("res://scenes/game/game.tscn")
const MAIN = preload("res://scenes/main/main.tscn")
const SCORES_PATH = 'user://tappy.dat'
var score:int = 0
var highScore:int = 0

func add_point()->void:
	score += 10
	
func set_high_score()->void:
	if score > highScore:
		highScore = score

func reset_score()->void:
	score = 0
	
func save_high_score()->void:
	var file:FileAccess = FileAccess.open(SCORES_PATH, FileAccess.WRITE)
	if file:
		file.store_32(highScore)
		file.close()

	pass

func get_high_score()->int:
	
	var file:FileAccess = FileAccess.open(SCORES_PATH, FileAccess.READ)
	
	if file:
		if file.get_length() > 0:
			highScore = file.get_32()
			print('highScore loaded %d' %highScore )
			return highScore
		else:
			print('Nothing on file.')
	else:
		print('Failed to open %s' % SCORES_PATH)
	
	return 0

func load_game_scene()->void:
	get_tree().change_scene_to_packed(GAME)

func load_main_scene()->void:
	get_tree().change_scene_to_packed(MAIN)
