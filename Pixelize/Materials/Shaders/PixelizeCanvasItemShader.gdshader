shader_type canvas_item;

// Ideally size=1 should affect the original rendering.
uniform int pixelSize : hint_range(1, 99, 1);
uniform sampler2D colorTexture : filter_linear_mipmap;

void fragment() {
	 
	// Get the origin size of texture for uv calculation later.
	vec2 texSize = vec2(textureSize(colorTexture, 0));
	
	// Origin pixel's coord inside the texture.
	float originX = texSize.x * UV.x;
	float originY = texSize.y * UV.y;
	vec2 originCoord = vec2(originX, originY);
	
	// Figure out the center coord of scaling squares.
	vec2 squareIndex = floor(originCoord.xy / float(pixelSize));
	vec2 centerCoord = float(pixelSize) * (squareIndex + 0.5);

	// Calculate new uv.
	vec2 uv = centerCoord / texSize;
	COLOR = texture(colorTexture, uv);
}
