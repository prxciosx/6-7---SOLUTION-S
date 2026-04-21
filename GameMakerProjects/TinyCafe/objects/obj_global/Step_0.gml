
cont += delta_time / 1000000;
show_debug_message(cont);
show_debug_message(spawn);
if (cont >= spawn) {
	show_debug_message("foi")
	var inst = instance_create_depth(1216, 704, 0, obj_cliente);
	spawn = irandom_range(5,15);
	show_debug_message(spawn);
	cont = 0;
}  