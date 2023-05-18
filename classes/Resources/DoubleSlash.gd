extends Skills

func _ready():
	display_name = "Double slash";
	dice=[
		Dice.new(1,4,GlobalEnums.DICE_TYPES.MELEE,GlobalEnums.DMG_TYPES.SLASHING,GlobalEnums.DMG_ELEMENTS.NORMAL),
		Dice.new(1,4,GlobalEnums.DICE_TYPES.MELEE,GlobalEnums.DMG_TYPES.SLASHING,GlobalEnums.DMG_ELEMENTS.NORMAL)
	]
