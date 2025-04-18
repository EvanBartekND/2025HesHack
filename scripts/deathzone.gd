extends Area2D

var checkpoint_manager
var player

func _ready() -> void:
	checkpoint_manager = get_parent().get_node("checkpointManager")
	player = get_parent().get_node("player")



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		killPlayer()
		
func killPlayer():
	player.position = checkpoint_manager.last_location
