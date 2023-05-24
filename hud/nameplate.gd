extends Control

var pawn;

@onready var nameplate := $"Nameplate Texture";
@onready var display_name := $"Nameplate Texture/Name";
@onready var health := $"Nameplate Texture/Health";
@onready var stagger_resist := $"Nameplate Texture/Stagger Resist";
@onready var emotion_level := $"Nameplate Texture/Emotion Level";

@onready var ep_level_textures:Array = [
	preload("res://assets/textures/icons/ep_0.png"),
	preload("res://assets/textures/icons/ep_1.png"),
	preload("res://assets/textures/icons/ep_2.png"),
	preload("res://assets/textures/icons/ep_3.png"),
	preload("res://assets/textures/icons/ep_4.png"),
	preload("res://assets/textures/icons/ep_5.png")
];

func _ready():
	display_name.text = pawn.display_name;
	health.max_value = pawn.maxhp;
	health.value = pawn.hp;
	stagger_resist.max_value = pawn.maxsr;
	stagger_resist.value = pawn.sr;

func init(p1:Pawn):
	pawn = p1;
