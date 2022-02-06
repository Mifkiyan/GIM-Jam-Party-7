extends StaticBody2D

onready var BG = get_parent().get_node("AudioStreamPlayer")

func _on_Area2D_area_entered(area):
	if area.is_in_group("MC Interact"):
		var d = Dialogic.start("Church Done")
		BG.playing = false
		d.pause_mode = PAUSE_MODE_PROCESS
		get_parent().call_deferred('add_child', d)
		d.connect("timeline_end",self,"after_dialog")
		get_tree().paused = true
		
		
func after_dialog(timeline_name):
	get_tree().paused = false
	BG.playing = true
