draw_set_font(Font1);
draw_set_colour(c_white);

if (global.gui_active == 0) { 
    
    var _menuopen = keyboard_check(ord("E"));
    
    if (_menuopen) {

        global.gui_active = -1;
        exit;
    }
    
    draw_text(800, 30, "Energy");
    draw_text(60, 30, "Coins: "+string(global.coins));
    for(var i = 0; i < global.coins; i++) {
        draw_sprite(spr_coin, gui_frame, 30 + 68 * (i % 5), 90+68*(i div 5));
    }
    for (var i = 0; i < global.hp; i++) {
        draw_sprite_ext(spr_heart, 0, 960+50*(i%5), 90+50*(i div 5), 3, 3, 0, c_white, 1);
    }
   
   draw_set_colour(c_black);
   draw_rectangle(930, 30, 1250, 70, false);
   draw_set_colour(c_lime);
   draw_rectangle(940, 37, 940+2*energy, 63, false);
    
    
} else if (global.gui_active == -1) {
    
    global.mobile = 0;
    
    var escaping = keyboard_check(vk_escape);
    if (escaping) {
        global.gui_active = false;
        alarm[0] = 15;
    }
    
    draw_rectangle(240, 60, 960, 660, false);
    draw_set_colour(c_black);
    draw_rectangle(250, 70, 480, 650, false);
    draw_rectangle(490, 70, 950, 650, false);
    draw_set_valign(fa_top);
    draw_set_halign(fa_middle);
    draw_set_colour(c_white);
    draw_text(365, 80, "STATS")
    draw_sprite(spr_coin, 0, 280, 160);
    draw_sprite_ext(spr_heart, 0, 280, 244, 4.5, 4.5, 0, c_white, 1);
    draw_text(380, 173, string(global.coins))
    draw_text(380, 247, string(global.hp))
    draw_text(720, 80, "INVENTORY");
}



