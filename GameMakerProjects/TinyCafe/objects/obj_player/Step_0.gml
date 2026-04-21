var move = keyboard_check(ord("D")) - keyboard_check(ord("A"));
hspd = move * spd;

#region COLISÃO HORIZONTAL
if (place_meeting(x + hspd, y, obj_block)) {
    while (!place_meeting(x + sign(hspd), y, obj_block)) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;
#endregion
/// GRAVIDADE
vspd += grv;

#region COLISÃO VERTICAL
if (place_meeting(x, y + vspd, obj_block)) {
    while (!place_meeting(x, y + sign(vspd), obj_block)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;
#endregion
show_debug_message(pedido);