extends KinematicBody2D


var speed:int=30
var gravity:=600
var jumpForce:=500

var vel:=Vector2()
onready var gardianSprite:=get_node("gardian")
func _physics_process(delta:float)->void:
	
	vel.y+=gravity*delta	
	
	
	if is_on_floor():
		vel.y -=jumpForce
		
		
	#print(gardianSprite.position)
	

		
	

	
		
	vel=move_and_slide(vel,Vector2.UP)
	
