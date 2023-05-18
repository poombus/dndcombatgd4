extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var p:Player = $Player3D;
	var e:NPC = $"Test Enemy";
	
	GlobalCM.setup([p], [e])
	$"Combat GUI".Cman()
