extends ProgressBar

@export var gameState: gameState

# Called when the node enters the scene tree for the first time.
func _ready():
	gameState.updateState.connect(update)
	update()

func update():
	value = gameState.spread

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
