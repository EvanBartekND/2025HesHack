extends Node2D
var eventScn = load("res://scenes/event.tscn")
var loopCounter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if loopCounter == 0:
				pass #spawn disease notice
			elif loopCounter == 1:
				pass #spawn minigame
			elif loopCounter == 2:
				spawnEvent()
			else:
				loopCounter = 0
			loopCounter += 1


func spawnEvent():
	var newEvent = eventScn.instantiate()
	add_child(newEvent)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
