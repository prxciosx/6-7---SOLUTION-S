if (place_meeting(x,y,obj_player) && keyboard_check_pressed(ord("X"))){
	if (obj_player.pedido != "nada"){
			obj_player.pedido += "biscoito";
		} else{
			obj_player.pedido = "biscoito";
		}
}