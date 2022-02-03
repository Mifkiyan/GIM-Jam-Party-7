extends KinematicBody2D

var velocity : Vector2
var arah

func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("Right"):
		velocity.x += 1
		$AnimatedSprite.animation = "Kanan"
		$Light2D.rotation_degrees = 0
		$Light2D.position.x = 28.133
		$Light2D.position.y = -1.313
		arah = 1
	elif Input.is_action_pressed("Left"):
		velocity.x += -1
		$AnimatedSprite.animation = "Kiri"
		$Light2D.rotation_degrees = 180
		$Light2D.position.x = -29.045
		$Light2D.position.y = -1.098
		arah = 2
	elif Input.is_action_pressed("Down"):
		velocity.y += 1
		$AnimatedSprite.animation = "Bawah"
		$Light2D.rotation_degrees = 90
		$Light2D.position.x = -0.939
		$Light2D.position.y = 26.397
		arah = 3
	elif Input.is_action_pressed("Up"):
		velocity.y += -1
		$AnimatedSprite.animation = "Atas"
		$Light2D.rotation_degrees = 270
		$Light2D.position.x = 1.41
		$Light2D.position.y = -29.759
		arah = 4
	
	move_and_collide(velocity)
	
	if (velocity.x == 0) and (velocity.y == 0):
		if arah == 1:
			$AnimatedSprite.animation = "Diem Kanan"
		elif arah == 2:
			$AnimatedSprite.animation = "Diem Kiri"
		elif arah == 3:
			$AnimatedSprite.animation = "Diem Bawah"
		elif arah == 4:
			$AnimatedSprite.animation = "Diem Atas"
			
	Interact()
	

func Interact():
	if $InteractArea/CollisionShape2D.disabled == false:
		$InteractArea/CollisionShape2D.disabled = true
	if Input.is_action_pressed("Interact"):
		$InteractArea/CollisionShape2D.disabled = false

func _on_InteractArea_body_entered(body):
	if body.is_in_group("Pintu Gereja"):
		var d = Dialogic.start("Pilihan masuk gereja")
		d.pause_mode = PAUSE_MODE_PROCESS
		get_parent().call_deferred('add_child', d)
		d.connect("timeline_end",self,"after_dialog")
		get_tree().paused = true

func after_dialog(timeline_name):
	get_tree().paused = false
