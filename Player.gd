extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGTH = -550
var life = 3
var motion = Vector2()

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGTH
	else:
		$Sprite.play("Jump")
	
	motion = move_and_slide(motion, UP)


func _on_Pes_body_entered(body):
	
	body.dano()
	
	motion.y = JUMP_HEIGTH


func _on_Dano_body_entered(body):
	life -= 1
	
	if (life == 0):
		$".".queue_free()
