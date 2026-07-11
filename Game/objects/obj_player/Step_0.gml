if (keyboard_check(up_key))
{
    y -= speed_walk
}
if (keyboard_check(left_key))
{
    x -= speed_walk
}
if (keyboard_check(down_key))
{
    y += speed_walk
}
if (keyboard_check(right_key))
{
    x += speed_walk
}

// Get current view dimensions
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

// Calculate center position
var cam_x = obj_player.x - (view_w * 0.5);
var cam_y = obj_player.y - (view_h * 0.5);

// Apply position
camera_set_view_pos(view_camera[0], cam_x, cam_y);