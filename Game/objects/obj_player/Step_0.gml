// Handle movement if able to move
if mobile
{
   if (keyboard_check(key_sprint))
   {
       speed_current = speed_sprint
   }
   else 
   {
       speed_current = speed_walk
   }
   
   
   if ((keyboard_check(key_up)) && (!place_meeting(x, y - speed_current, obj_collision)))
   {
       y -= speed_current
   }
   if ((keyboard_check(key_left)) && (!place_meeting(x - speed_current, y, obj_collision)))
   {
       x -= speed_current
       image_xscale = -1
   }
   if ((keyboard_check(key_down)) && (!place_meeting(x, y + speed_current, obj_collision)))
   {
       y += speed_current
   }
   if ((keyboard_check(key_right)) && (!place_meeting(x + speed_current, y, obj_collision)))
   {
       x += speed_current
       image_xscale = 1
   }
}

// Handle player-object interactions
if (keyboard_check(key_interact))
{
    if (distance_to_object(obj_shiny_thing) < dist_interact)
    {
        mobile = false
        obj_note.visible = true
        obj_note.x = x
        obj_note.y = y
    }
}
else 
{
    mobile = true
    obj_note.visible = false
}

//Make camera follow player
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

var cam_x = obj_player.x - (view_w * 0.5);
var cam_y = obj_player.y - (view_h * 0.5);

camera_set_view_pos(view_camera[0], cam_x, cam_y);