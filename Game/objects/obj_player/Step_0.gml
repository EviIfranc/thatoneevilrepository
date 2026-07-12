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
if (keyboard_check_pressed(key_interact))
{
    if (distance_to_object(parent_interactible) < dist_interact)
    {
        mobile = false
        current_note_instance = instance_create_layer(x-2.5, y, layer_get_id("Notes"), instance_nearest(x, y, obj_shiny_thing).note)
    }
}
else if (!keyboard_check(key_interact))
{
    mobile = true
    //parent_note.visible = false
    if current_note_instance
    {
        instance_destroy(current_note_instance)
    }
}

//Make camera follow player
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

var cam_x = obj_player.x - (view_w * 0.5);
var cam_y = obj_player.y - (view_h * 0.5);

camera_set_view_pos(view_camera[0], cam_x, cam_y);