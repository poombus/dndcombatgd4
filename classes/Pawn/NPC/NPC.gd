extends Pawn
class_name NPC

var hp_die_num:int; #number of die rolled for hp
var hp_dice:int; #value of die rolled for hp
var hp_mod:int; #added to rolled hp. uses CON if not manually set
var hp_avg:int; #automatically calculated if not manually set

var cr:int;
