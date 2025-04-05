extends Node2D

@onready var popup = $Window

# Called when the node enters the scene tree for the first time.
func _ready():
	openPop()

func openPop():
	popup.show()

func _on_window_close_requested() -> void:
	popup.hide() # Replace with function body.
