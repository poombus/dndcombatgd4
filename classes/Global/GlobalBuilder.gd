extends Node
var skills:Array[Skills];
func _ready():
	skillBuilder()
func skillBuilder():
	var file = "res://assets/data/skills.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json = JSON.parse_string(json_as_text)
	
	for skill in json:
		var new_skill:Skills = Skills.new();
		new_skill["display_name"] = json[skill]["name"];
		new_skill["min_level"] = json[skill]["min_level"];
		new_skill["energy_cost"] = json[skill]["energy_cost"]
		for dice in json[skill].dice:
			new_skill.dice.append(diceBuilder(dice))
		skills.append(new_skill)

func diceBuilder(dice):
	var d = Dice.new(
		dice.minmax[0], 
		dice.minmax[1],
		GlobalEnums.DICE_TYPES[dice.dicetype],
		GlobalEnums.DMG_TYPES[dice.dmgtype],
		GlobalEnums.DMG_ELEMENTS[dice.dmgelement]
	)
	return d;
	
