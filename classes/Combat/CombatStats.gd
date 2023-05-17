extends Node
class_name CombatStats

var parent:Pawn;

var energy:int = 3;
var ep:Dictionary = { #emotion points
	"positive": {
		"amount": 0,
		"causes": []
	},
	"negative": {
		"amount": 0,
		"causes": []
	}
}

var skills; #unarmed combat and equipped weapons
var spells;
var othActions; #running
var invActions; #only show items that can be used in combat

func _init(i_parent:Pawn):
	parent = i_parent;

func setup():
	energy = 3;
	setEP();
	#This function will be caused for Pawns at the start of combat. It should
	#set up all things combat. Energy, Emotion Points, UI, Skills... etc

func setEP(pos:= 0, neg:=0):
	ep = {
		"positive": {
			"amount": pos,
			"causes": []
		},
		"negative": {
			"amount": neg,
			"causes": []
		}
	}

func test():
	print(parent.name, " says hi");
