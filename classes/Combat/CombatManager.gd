extends Node
class_name CombatManager

#Dictates outcome and animations for combat.

var skirmishes:Array[Dictionary] = [];

var players:Array[Player];
var npc:Array[NPC]

func setup(i_player:Array[Player], i_NPC:Array[NPC]):
	players = i_player;
	npc = i_NPC;
	
