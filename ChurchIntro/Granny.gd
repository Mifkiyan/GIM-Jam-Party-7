extends StaticBody2D
onready var Pintu = get_parent().get_node("Pintu/CollisionShape2D")

func _ready():
	Pintu.disabled = true

func _on_Area2D_area_entered(area):
	if area.is_in_group("MC Interact"):
		var d = Dialogic.start("Church 1")
		d.pause_mode = PAUSE_MODE_PROCESS
		get_parent().call_deferred('add_child', d)
		d.connect("timeline_end",self,"after_dialog")
		get_tree().paused = true
		
		
func after_dialog(timeline_name):
	get_tree().paused = false
	$Area2D/CollisionShape2D.disabled = true
	Pintu.disabled = false



