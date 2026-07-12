draw_self();
if show_text
{
    draw_set_halign(fa_middle)
    draw_set_colour(c_black)
    font_add_enable_aa(false)
    font_note = font_add("VCR_OSD_MONO_1.001.ttf", 8, false, false, 32, 128)
    draw_set_font(font_note)
    draw_text_ext(x+5,y-48,text, 8, 118);  
}
