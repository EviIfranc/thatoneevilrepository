// Handle player-object interactions
nearest_interactible = instance_nearest(x, y, parent_interactible)

if (distance_to_object(nearest_interactible) <= dist_interact) && (keyboard_check_pressed(key_interact))
{
    mobile = false 
    
    switch (nearest_interactible.type)
    {
        case "shiny":
            if (global.shiny_count >= nearest_interactible.shinies_needed)
            {
               current_note_instance = instance_create_layer(x-2.5, y, layer_get_id("Notes"), nearest_interactible.note)
               if (global.shiny_count == nearest_interactible.shinies_needed)
               {
                   global.shiny_count += 1
               }
            }
            break
        
        case "button":
            current_button_instance = nearest_interactible
            button_pressed = true
            nearest_interactible.pressed = true
            break
    }
}
else if (!keyboard_check(key_interact))
{
    mobile = true
    if current_note_instance
    {
        instance_destroy(current_note_instance)
    }
    
    if current_button_instance
    {
        current_button_instance.pressed = false
    }
}





// Handle movement if able to move
if mobile
{
    // Find all colliders
    colliders = []
    collider_ids = layer_get_all_elements("Collisions")
    array_foreach(collider_ids, function(value, index)
    {
        array_push(colliders, layer_instance_get_instance(value))
    })
    
    // Check sprinting
    if (keyboard_check(key_sprint))
   {
       speed_current = speed_sprint
   }
   else 
   {
       speed_current = speed_walk
   }

   // Move
   if ((keyboard_check(key_up)) && (!place_meeting(x, y - speed_current, colliders)))
   {
       y -= speed_current
   }
   if ((keyboard_check(key_left)) && (!place_meeting(x - speed_current, y, colliders)))
   {
       x -= speed_current
       image_xscale = -1
   }
   if ((keyboard_check(key_down)) && (!place_meeting(x, y + speed_current, colliders)))
   {
       y += speed_current
   }
   if ((keyboard_check(key_right)) && (!place_meeting(x + speed_current, y, colliders)))
   {
       x += speed_current
       image_xscale = 1
   }
}





// Handle gates
if place_meeting(x, y, obj_gate)
{
    gates_cleared = 1
}





//Make camera follow player
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

var cam_x = obj_player.x - (view_w * 0.5);
var cam_y = obj_player.y - (view_h * 0.5);

camera_set_view_pos(view_camera[0], cam_x, cam_y);