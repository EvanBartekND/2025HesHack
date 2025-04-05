extends Node2D
@onready var popup = $Window
signal eventResult

# Called when the node enters the scene tree for the first time.
func _ready():
	openPop()


func openPop():
	popup.show()

func _on_window_close_requested():
	popup.hide() # Replace with function body.


func _on_button_pressed() -> void:
	eventResult.emit(-10,3,0)
	popup.hide() 

func _on_button_2_pressed() -> void:
	eventResult.emit(-40,-1,0)
	popup.hide()


func _on_button_3_pressed() -> void:
	eventResult.emit(5,7,10)
	popup.hide()
