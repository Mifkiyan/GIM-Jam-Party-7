extends Node2D


func _ready():
	var d = Dialogic.start("Ending Rian")
	d.pause_mode = PAUSE_MODE_PROCESS
	get_parent().call_deferred('add_child', d)
	d.connect("timeline_end",self,"after_dialog")
	get_tree().paused = true

func after_dialog(timeline_name):
	get_tree().paused = false
