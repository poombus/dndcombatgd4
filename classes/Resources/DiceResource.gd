extends Resource
class_name Dice

@export var min:int = 1;
@export var max:int = 20;

var diceType:int;
var damageType:int;
var elementType:int;

func _init(i_min:int = 1, i_max:int = 20, i_dicetype = GlobalEnums.DICE_TYPES.MELEE, i_dmgtype = GlobalEnums.DMG_TYPES.SLASHING, i_eletype = GlobalEnums.DMG_ELEMENTS.NORMAL):
	min = i_min;
	max = i_max;
	diceType = i_dicetype;
	damageType = i_dmgtype;
	elementType = i_eletype;

func roll(): return randi_range(min,max);

func custom_roll(mn:int = 1, mx:int = 20): return randi_range(mn, mx);
