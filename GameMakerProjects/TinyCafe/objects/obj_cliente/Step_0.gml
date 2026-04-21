#region MOVIMENTO E COLISÃO
var vspd = spd;

// andar até o balcão
if (place_meeting(x + vspd, y, obj_block)) {
    vspd = 0;

    if (!pedido && state == "idle") {
        pedido = true;
        tempo_decorrido = 0;
    } 
}

if (place_meeting(x+vspd,y,obj_cliente) && state == "idle"){vspd = 0;}

#endregion
#region FAZER PEDIDO

// contador de tempo
if (pedido && state == "idle") {
	mostrar_texto = true; // mostrar pedido
	
    tempo_decorrido += delta_time / 1000000;

    if (tempo_decorrido >= espera) {
        state = "angry";
    }
}
#endregion

// comportamento por estado
switch (state) {
    
    case "idle":
	image_xscale = 1;
        sprite_index = spr_cliente;
    break;

    case "angry":
        sprite_index = spr_clienteangry;
		image_xscale = -1;
        vspd = 4; // vai embora
		texto = "que demora grr...";
    break;

    case "happy":
        sprite_index = spr_clientehappy;
		image_xscale = -1;
        vspd = 4;
		texto = "perfeito";
		obj_player.pedido = "nada";
    break;
}

x += vspd;

if (keyboard_check_pressed(ord("X")) && place_meeting(x-100,y,obj_player) && obj_player.pedido == pedidoI){
	state = "happy";
	pedido = false;
}
if (cont< npedidos){
	pedidoI += choose("cafe","biscoito");
	texto = "quero: " + pedidoI;
	cont+=1;
}
// destruir quando sair da tela
if (x > room_width + 96) {
    instance_destroy();
}