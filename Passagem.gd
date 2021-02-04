extends Area2D

export(String, FILE, "*.tscn") var scenes

func _on_Passagem_body_entered(body):
	
	get_tree().change_scene(scenes)
	
	pass
