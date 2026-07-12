switch (obj_player.cutscene_counter)
{
    case 1:
        if ((sprite_index == cut_hallway) && (image_index >= image_number - 1))
        {
            sprite_index = cut_elevator
        }
        else if (image_index >= image_number - 1)
        {
            finished = true
        }
}

if finished
{
    room_goto_next()
}