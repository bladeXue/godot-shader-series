shader_type canvas_item;

// Ideally size=1 should affect the original rendering.
uniform int pixel_size : hint_range(1, 99, 1);
uniform sampler2D color_texture : filter_linear_mipmap;

void fragment() {
	 
	// Get the origin size of texture for uv calculation later.
	vec2 texture_size = vec2(textureSize(color_texture, 0));
	
	// Origin pixel's coord inside the texture.
	float origin_x = texture_size.x * UV.x;
	float origin_y = texture_size.y * UV.y;
	vec2 origin_coord = vec2(origin_x, origin_y);
	
	// Figure out the center coord of scaling squares.
	vec2 square_index = floor(origin_coord.xy / float(pixel_size));
	vec2 center_coord = float(pixel_size) * (square_index + 0.5);

	// Calculate new uv.
	vec2 uv = center_coord / texture_size;
	COLOR = texture(color_texture, uv);
}
