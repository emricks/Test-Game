is_interacting = keyboard_check(vk_enter);
if (is_interacting == 1 && distance_to_object(obj_player) < 4 && global.gui_active != shopId) {
    global.gui_active = shopId;
    exit;
}
if (global.gui_active != shopId) {
    exit;
}

var _direction = keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up);
var _purchased = keyboard_check_pressed(vk_enter);

if (_purchased == 1 && global.coins >= items[selection].cost) {
    global.coins -= items[selection].cost;
    array_push(global.inventory, items[selection].name);
}

if (_direction != 0) {
    selection = (selection + _direction + 4000000) % 4;
}
