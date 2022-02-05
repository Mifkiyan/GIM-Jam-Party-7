extends KinematicBody2D

export var speed = 100
export var acceleration = 3500
var velocity : Vector2
var player = null
var arah

onready var MC = get_parent().get_node("MC")

func _physics_process(delta):
	animasiPlayer()
	velocity = Vector2.ZERO
	if player != null:
		#velocity = position.direction_to(player.position) * 100
		var direction = (player.global_position - global_position).normalized()
		velocity = velocity.move_toward(direction*speed,acceleration*delta)
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_slide(velocity)
	
	
func animasiPlayer():
	if velocity.x > 0:
		if velocity.x > abs(velocity.y):
			$AnimatedSprite.animation = "Kanan"
			arah = 1
		elif velocity.x < abs(velocity.y):
			if velocity.y > 0:
				$AnimatedSprite.animation = "Depan"
				arah = 3
			elif velocity.y < 0:
				$AnimatedSprite.animation = "Belakang"
				arah = 4
	elif velocity.x < 0:
		if abs(velocity.x) > abs(velocity.y):
			$AnimatedSprite.animation = "Kiri"
			arah = 2
		elif abs(velocity.x) < abs(velocity.y):
			if velocity.y > 0:
				$AnimatedSprite.animation = "Depan"
				arah = 3
			elif velocity.y < 0:
				$AnimatedSprite.animation = "Belakang"
				arah = 4
	
	if (velocity.x == 0) and (velocity.y == 0):
		if arah == 1:
			$AnimatedSprite.animation = "Kanan diem"
		elif arah == 2:
			$AnimatedSprite.animation = "Kiri diem"
		elif arah == 3:
			$AnimatedSprite.animation = "Depan diem"
		elif arah == 4:
			$AnimatedSprite.animation = "Belakang diem"

func _on_FollowLimit_body_entered(body):
	if body.is_in_group("MC"):
		player = null

func _on_FollowLimit_body_exited(body):
	if body.is_in_group("MC"):
		player = body
