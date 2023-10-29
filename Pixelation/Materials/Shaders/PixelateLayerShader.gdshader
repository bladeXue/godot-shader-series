shader_type canvas_item;

// Set pixelation scale and screen-reading texture
uniform int pixel_size : hint_range(1, 99, 1);
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

void fragment() {

	// Get the full size of screen texture.
	vec2 screen_texture_size = vec2(textureSize(screen_texture, 0));
	
	// Origin pixel's coord inside the texture.
	float origin_x = screen_texture_size.x * SCREEN_UV.x;
	float origin_y = screen_texture_size.y * SCREEN_UV.y;
	vec2 origin_coord = vec2(origin_x, origin_y);
	
	// Figure out the center coord of scaling squares.
	vec2 square_index = floor(origin_coord.xy / float(pixel_size));
	vec2 center_coord = float(pixel_size) * (square_index + 0.5);

	// Calculate new uv for replacing the origin SCREEN_UV.
	vec2 uv = center_coord / screen_texture_size;
	COLOR = textureLod(screen_texture, uv, 0.0);
}
