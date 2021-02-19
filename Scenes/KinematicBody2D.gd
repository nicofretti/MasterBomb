extends KinematicBody2D


const gravity = 2
func _physics_process(delta):
	var direction = Vector2()
	direction.x += (Input.get_action_strength("ui_right")*1 - Input.get_action_strength("ui_left")*1)
	update_animation(direction)
	
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		direction.y = -35
	else:
		direction.y += gravity
	move_and_slide(direction*200, Vector2(0,-1))
	
	

func update_animation(direction):
	if(direction==Vector2()):
		$Sprite.play("Idle")
	elif direction.y==1:
		$Sprite.play("Run")
	elif direction.y==-1:
		$Sprite.play("Run")
	elif direction.x==-1:
		$Sprite.play("Run")
		$Sprite.flip_h=true
	elif direction.x==1:
		$Sprite.play("Run")
		$Sprite.flip_h=false

