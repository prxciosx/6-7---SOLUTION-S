pedido = false;

espera = 10;
tempo_decorrido = 0;

spd = -3;
state = "idle";

mostrar_texto = false;
cont = 0;
npedidos = irandom_range(1,2);
pedidoI = choose("cafe","biscoito");
texto = "quero: " + pedidoI;