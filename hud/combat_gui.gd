extends Control

@onready var skills_menu = $"Action Menus/Skills Menu"
@onready var spells_menu = $"Action Menus/Spells Menu"
@onready var misc_menu = $"Action Menus/Misc Menu"
@onready var items_menu = $"Action Menus/Item Menu"
func Cman():
	skills_menu.get_popup().clear()
	for skills in GlobalCM.players[0].skills:
		skills_menu.get_popup().add_item(skills.display_name)
