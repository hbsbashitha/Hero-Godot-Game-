extends KinematicBody2D


var speed:int=300
var gravity:=600
var jumpForce:=800

var vel:=Vector2()
onready var playerSprite:=get_node("Player")
func _physics_process(delta:float)->void:
	
	vel.y+=gravity*delta
	vel.x = 0
	if Input.is_action_pressed("left"):
		vel.x-=speed
		
	
	if Input.is_action_pressed("right"):
		vel.x+=speed
		
		
	if vel.x<0:
		playerSprite.flip_h = true
		
	elif vel.x>0:
		playerSprite.flip_h = false
				
	if is_on_floor() && Input.is_action_pressed("jump"):
		vel.y -=jumpForce
		
	
	vel=move_and_slide(vel,Vector2.UP)
	
	
	
	for i in get_slide_count():
		var colition=get_slide_collision(i)
		
		if colition.collider.name.begins_with("gardian"):
			get_tree().reload_current_scene()
	
		
#func _on_Area2D_area_entered(area):
	#if area.get_parent().name.begins_with("gardian"):
		#get_tree().reload_current_scene()
		#print("test")
