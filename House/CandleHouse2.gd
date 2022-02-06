extends StaticBody2D


func _on_Candle_area_entered(area):
	if area.is_in_group("MC Interact"):
		var d = Dialogic.start("Confirm House")
		d.pause_mode = PAUSE_MODE_PROCESS
		get_parent().call_deferred('add_child', d)
		d.connect("timeline_end",self,"after_dialog")
		get_tree().paused = true

func after_dialog(timeline_name):
	get_tree().paused = false
	$Candle/CollisionShape2D.disabled = true
