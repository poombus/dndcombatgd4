extends CharacterBody3D
class_name Pawn

var combatStats := CombatStats.new(self);

#CHANGE THE PLAYER CONTROLLER INTO A PAWN CONTROLLER

var race:GlobalEnums.RACES = GlobalEnums.RACES.HUMAN;

@export var display_name:String; #readable name
var desc:String; #description (will be seen by players)
var languages;
var senses;

var type:GlobalEnums.TYPES;

enum AS{STR = 0, DEX, CON, INT, WIS, CHA}
var abilityScores:Dictionary;

var profBonus:int; #extra value to add to rolls involving skill proficiencies
var skillProfs:Array; #skill proficiencies; acrobatics, animal handling, arcana, etc.
var saveThrowProfs:Array; #saving throw proficiency

var maxhp:int = 20;
var hp:int = 20;

var ac:int; #armor class

var conditions:Array; #status effects

#damage adjustment
var weaknesses:Array;
var resistances:Array;
var immunities:Array;

#collection (dunno whether to use arrays or dicts)
var spells;
var inventory;
var traits; #feats and traits

func _ready():
	#Setup Ability Scores
	for stat in AS: 
		abilityScores[stat] = {
			"base": 1,
			"racial_bonus": 0,
			"asi": 0, #ability score improvement
			"misc_bonus": 0,
			"other_bonus": 0
		}
	
	#Connecting Signals
	self.connect("input_event",_on_input_event);

var ethics:GlobalEnums.ETHICS;
var morals:GlobalEnums.MORALS;

#getters n' setters
func set_as(a:AS, val:int, bonus:String = "base") -> void:
	var id = AS.keys()[a];
	if bonus not in abilityScores[id]: bonus = "base";
	abilityScores[id][bonus] = val;
func get_as(a:AS, bonus:String = "all") -> int:
	var id = AS.keys()[a];
	if bonus != "all" and bonus not in abilityScores[id]: bonus = "all";
	var stat = abilityScores[id];
	if bonus == "all": return stat.base + stat.racial_bonus + stat.asi + stat.misc_bonus + stat.other_bonus;
	else: return stat[bonus];
func get_as_mod(a:AS):
	return floor((get_as(a)-10) as float/2);

func _on_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		combatStats.test();
		GlobalSignals.pawn_clicked.emit(self);
