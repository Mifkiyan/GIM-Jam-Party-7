extends YSort

func _ready():
	var d = Dialogic.start("Church 1")
	d.pause_mode = PAUSE_MODE_PROCESS
	get_parent().call_deferred('add_child', d)
	d.connect("timeline_end",self,"after_dialog")
	get_tree().paused = true
