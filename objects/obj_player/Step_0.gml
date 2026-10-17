var input_horiz = keyboard_check(ord("D"))-keyboard_check(ord("A"));
var input_vert = keyboard_check(ord("S"))-keyboard_check(ord("W"));
var running = keyboard_check(vk_shift);

if (global.mobile == 0) move_speed = 0;
    else move_speed = 3.5

if (running && energy > 1 && (input_horiz != 0 or input_vert != 0)) {move_speed = 6; energy -= 1;}
else if (running) {move_speed = 2;}
else energy += 1;
    
if (energy < 0) energy = 0
    else if (energy > 150) energy = 150
    
gui_frame += gui_speed;
gui_frame %= 6;
    
move_and_collide(input_horiz*move_speed, input_vert*move_speed, [tilemap, obj_adam], undefined, undefined, undefined, move_speed, move_speed);

if (input_horiz != 0 or input_vert != 0) {
    if (input_vert > 0) sprite_index = spr_player_down_walk;
        else if (input_vert < 0) sprite_index = spr_player_up_walk;
        else if (input_horiz > 0) sprite_index = spr_player_right_walk;
        else if (input_horiz < 0) sprite_index = spr_player_left_walk;
} else {
    if (sprite_index == spr_player_down_walk) sprite_index = spr_player_down_idle;
    else if (sprite_index == spr_player_up_walk) sprite_index = spr_player_up_idle;
    else if (sprite_index == spr_player_right_walk) sprite_index = spr_player_right_idle;
    else if (sprite_index == spr_player_left_walk) sprite_index = spr_player_left_idle;
}

x = clamp(x, 0, room_width-64);
y = clamp(y, 0, room_height-64);