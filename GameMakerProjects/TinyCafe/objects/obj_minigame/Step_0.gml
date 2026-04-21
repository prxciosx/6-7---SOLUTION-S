if (global.minimgame){
	switch (tecla){
		case "Z":
		image_index = 0;
		break;
		
		case "X":
		image_index = 1;		
		break;
		
		case "C":
		image_index = 2;
		
		break;
	}
	if (keyboard_check_pressed(vk_anykey)){
		if (keyboard_check_pressed(ord(tecla))){
			progresso += 1;
			tecla = choose("Z","X","C");
		}else{
			if (progresso>0){
				progresso -= 1;
			}
			tecla = choose("Z","X","C");
		}
	}
	if (progresso >= progresso_max){
		show_debug_message("cabo");
		if (obj_player.pedido != "nada"){
			obj_player.pedido += "cafe";
		} else{
			obj_player.pedido = "cafe";
		}
		global.minimgame = false;		
	}
} else{
	instance_destroy();
}