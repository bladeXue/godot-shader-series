shader_type canvas_item;

uniform sampler2D color_texture : filter_linear_mipmap;

void fragment() {
	COLOR = texture(color_texture, UV);
}
