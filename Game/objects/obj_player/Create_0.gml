// Set status
mobile = true

// Set default stats
speed_walk = 0.75
speed_sprint = 1.25
speed_current = speed_walk

dist_interact = 1

// Set keybinds
key_up = ord("W")
key_left = ord("A")
key_down = ord("S")
key_right = ord("D")

key_sprint = vk_shift

key_interact = ord("E")

// Determine wich objects collide with player
colliders = layer_get_all_elements("Collisions")

// Set up placeholders
current_note_instance = false
gates_cleared = 0
button_pressed = false