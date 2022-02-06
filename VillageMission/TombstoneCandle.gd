extends StaticBody2D

onready var done = get_parent().get_node("CanvasLayer/Objective/Label")

func _on_Area2D_area_entered(area):
	if area.is_in_group("MC Interact"):
			var d = Dialogic.start("Graveyard")
			d.pause_mode = PAUSE_MODE_PROCESS
			get_parent().call_deferred('add_child', d)
			d.connect("dialogic_signal",self,"new_objective")
			d.connect("timeline_end",self,"after_dialog")
			get_tree().paused = true

func after_dialog(timeline_name):
	get_tree().paused = false
	$Area2D/CollisionShape2D.disabled = true

func new_objective(param):
	if param == "objective_done":
		done.text = """Objective :
			Speak to Granny"""
		
	
