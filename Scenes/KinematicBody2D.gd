extends KinematicBody2D

const GRAVITY = 2
const JUMP = -20
const M = 12000
func _physics_process(delta):
	var direction = Vector2()
	direction.x += (Input.get_action_strength("ui_right")*1 -
					Input.get_action_strength("ui_left")*1)
	
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		direction.y = JUMP
	update_animation(direction)
	direction.y += GRAVITY
	move_and_slide(direction*delta*M, Vector2(0,-1))
	
	

func update_animation(direction):
	print(direction)
	if direction.y == JUMP:
		$Sprite.play("Jump")
	elif (direction==Vector2()):
		$Sprite.play("Idle")
	elif direction.x==-1:
		$Sprite.play("Run")
		$Sprite.flip_h=true
	elif direction.x==1:
		$Sprite.play("Run")
		$Sprite.flip_h=false
	
	else:
		$Sprite.play("Run")

