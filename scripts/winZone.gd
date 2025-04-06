extends Area2D
var player

func _ready() -> void:
	player = get_parent().get_node("player")





func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print_debug("hit")
		get_parent().get_parent().get_tree().change_scene_to_file("res://scenes/ending.tscn")
