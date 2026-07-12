if (state == "closed") && (obj_player.button_pressed == true)
{
    state = "opening"
    image_speed = 1
}

if (state == "opening") && (image_index >= image_number - 1) {
    instance_destroy()
}