extends Pawn
class_name Player

var pclass:Array[GlobalEnums.CLASSES] = [GlobalEnums.CLASSES.BARBARIAN];

var inspiration:bool;
var level:int = 1;

#Overworld Stuff
var CANMOVE:= false;
var MOVESPEED = 10;
var ACCELERATION = 10;
var FRICTION = 50;

var input_dir := Vector3.ZERO;

func _physics_process(delta):
	if CANMOVE: move(delta);

func update_input_dir():
	input_dir.x = int(Input.is_action_pressed("move_right"))-int(Input.is_action_pressed("move_left"));
	input_dir.z = int(Input.is_action_pressed("move_down"))-int(Input.is_action_pressed("move_up"));
	input_dir = input_dir.normalized();

func move(delta):
	update_input_dir();
	
	if input_dir == Vector3.ZERO: apply_friction(FRICTION*delta);
	else: apply_accel(delta);
	
	move_and_slide();

func apply_friction(fric):
	if velocity.length() > fric:
		velocity -= velocity.normalized()*fric;
	else:
		velocity = Vector3.ZERO;

func apply_accel(delta):
	var target_vel:Vector3 = input_dir*MOVESPEED;
	velocity.x = lerp(velocity.x, target_vel.x, ACCELERATION*delta);
	velocity.z = lerp(velocity.z, target_vel.z, ACCELERATION*delta);
