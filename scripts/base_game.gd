extends Node2D
class_name gameState
var eventScn = load("res://scenes/event.tscn")
var noticeScn = load("res://scenes/start_pop.tscn")
var loopCounter = 0
signal updateState

@onready var happy: int = 0
@onready var spread: int= 0
@onready var infected: int = 0
var dead = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	updateStateVals(70,10,60)



func updateStateVals(addHappy, addSpread, addInfected):
	happy= happy+ addHappy
	spread = spread+ addSpread
	infected = infected+spread+addInfected
	updateState.emit()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if loopCounter == 0:
				spawnNotice() #spawn disease notice
			elif loopCounter == 1:
				spawnEvent()
			elif loopCounter == 2:
				startMinigame()
			else:
				loopCounter = 0
			loopCounter += 1

func spawnNotice():
	var notice = noticeScn.instantiate()
	add_child(notice)

func startMinigame():
	get_tree().change_scene_to_file("res://scenes/Minigame.tscn")	

func spawnEvent():
	var newEvent = eventScn.instantiate()
	add_child(newEvent)
	newEvent.eventResult.connect(updateStateVals.bind())
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
