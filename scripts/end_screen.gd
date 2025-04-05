extends Node2D
@onready var endPop = $Window

# Called when the node enters the scene tree for the first time.
func _ready():
	openPop()

func openPop():
	endPop.show()

func _on_window_close_requested() -> void:
	endPop.hide() # Replace with function body.
