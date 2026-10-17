
if (global.gui_active == shopId) {

        show_debug_message("Nomral shop, shopId: "+string(shopId));
    global.mobile = 0;
    var escaping = keyboard_check(vk_escape);
    
    if (escaping) {
        global.gui_active = false;
        alarm[0] = 15;
    }
    var window_width = window_get_width();
    var window_height = window_get_height();
    
    draw_set_colour(c_white);
    draw_rectangle(120, 70, 1160, 650, false);
    draw_set_colour(c_black)
    draw_rectangle(610, 80, 1150, 470, false);
    draw_rectangle(610, 480, 1150, 640, false);
    draw_rectangle(130, 80, 600, 640, false);

    draw_set_colour(c_white);
    draw_set_halign(fa_middle);
    draw_text(365, 100, "INVENTORY")
    draw_set_halign(fa_left);
    
    for (var i = 0; i < 8; i++) {
        var str = i >= array_length(global.inventory) ? "-" : "- "+global.inventory[i];
        draw_text(200, 200+50*i, str)
    }
    
    draw_set_halign(fa_middle);
    draw_text(880, 100, "SHOP");
    array_foreach(items, function(item, idx) {
        draw_set_halign(fa_left);
        if (selection == idx) {
            draw_sprite(spr_selector, 0, 635, 135+80*idx)
        }
        draw_text(680, 150+80*idx, item.name);
        draw_set_font(FontSmall);
        draw_text(720, 190+80*idx, item.description);
        draw_set_font(Font1);
        draw_set_halign(fa_right);
        draw_text(1080, 150+80*idx, string(item.cost)+"G");
    })
    
    var numItems = array_reduce(global.inventory, function(_previous, _element, _index) {
        return _previous + (global.inventory[_index] != "");
    }, 0)
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_sprite(spr_coin, 0, 658, 528);
    draw_text(730, 560, "x "+string(global.coins));
    draw_text(930, 560, "Items: " + string(numItems) + "/8");

}
