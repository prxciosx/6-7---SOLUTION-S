if (place_meeting(x,y,obj_player) && keyboard_check_pressed(ord("X")) && !instance_exists(obj_minigame)){
	global.minimgame = true;
	instance_create_depth(obj_player.x, obj_player.y - 200,1,obj_minigame)
}