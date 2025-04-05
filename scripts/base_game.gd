extends Node2D
class_name gameState
var eventScn = load("res://scenes/event.tscn")
var minigameScn = load("res://scenes/Minigame.tscn")
var loopCounter = 0
signal updateState

@onready var happy: int = 0
@onready var spread: int= 0
@onready var infected: int = 0
var dead = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	updateStateVals(90,2,1)



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
				pass #spawn minigame
			elif loopCounter == 2:
				spawnEvent()
			else:
				loopCounter = 0
			loopCounter += 1

func spawnNotice():
	pass

func startMinigame():
	var minigame = minigameScn.instantiate()
	add_child(minigame)
	

func spawnEvent():
	var newEvent = eventScn.instantiate()
	add_child(newEvent)
	newEvent.eventResult.connect(updateStateVals.bind())
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
