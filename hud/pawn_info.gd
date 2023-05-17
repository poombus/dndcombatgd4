extends ColorRect

func _ready():
	GlobalSignals.connect("pawn_clicked", self._on_signal_pawn_clicked);

func _on_signal_pawn_clicked(pawn:Pawn):
	visible = true;
	
	#Update plate to show Pawn stats
	$HealthBar/Label.text = str(pawn.hp) + "/" + str(pawn.max_hp);
	$HealthBar.max_value = pawn.max_hp;
	$HealthBar.value = pawn.hp;
	
	$Name.text = pawn.display_name;
	if pawn is Player:
		$LevelRaceClass.text = "Level " + str(pawn.level) + " " + str(pawn.race) + " " + str(pawn.pclass[0]);
	else: $LevelRaceClass.text = str(pawn.race);
	
	$Stats/StrContainer/Strength.text = "STR " + str(pawn.get_as(Pawn.AS.STR));
	$Stats/DexContainer/Dexterity.text = "DEX " + str(pawn.get_as(Pawn.AS.DEX));
	$Stats/ConContainer/Constitution.text = "CON " + str(pawn.get_as(Pawn.AS.CON));
	$Stats/IntContainer/Intelligence.text = "INT " + str(pawn.get_as(Pawn.AS.INT));
	$Stats/WisContainer/Wisdom.text = "WIS " + str(pawn.get_as(Pawn.AS.WIS));
	$Stats/ChaContainer/Charisma.text = "CHA " + str(pawn.get_as(Pawn.AS.CHA));

func _on_close_button_pressed(): visible = false;
