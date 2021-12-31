/// ptype_update_sprite_models()
/// Updates the 3D models for sprite particles.

var tex, swid, shei, fwid, fhei, framesx;

for (var m = 0; m < sprite_models; m++)
	model_destroy(sprite_model[m])

tex = sprite_tex.particles_texture[sprite_tex_image]
swid = texture_width(tex)
shei = texture_height(tex)
fwid = min(swid, sprite_frame_width)
fhei = min(shei, sprite_frame_height)
framesx = swid div fwid

sprite_models = abs(sprite_frame_end - sprite_frame_start) + 1
for (var m = 0; m < sprite_models; m++) {
	var frame, tx1, ty1, tx2, ty2;
	frame = min(sprite_frame_start, sprite_frame_end) + m;
	tx1 = ((frame mod framesx) * fwid) / swid
	ty1 = ((frame div framesx) * fhei) / shei
	tx2 = tx1 + fwid / swid
	ty2 = ty1 + fhei / shei
	sprite_model[m] = model_start()
	vertex_add(-fwid / 2, 0, fhei / 2, 0, 0, 1, tx1, ty1)
	vertex_add(fwid / 2, 0, fhei / 2, 0, 0, 1, tx2, ty1)
	vertex_add(fwid / 2, 0, -fhei / 2, 0, 0, 1, tx2, ty2)
	vertex_add(-fwid / 2, 0, fhei / 2, 0, 0, 1, tx1, ty1)
	vertex_add(fwid / 2, 0, -fhei / 2, 0, 0, 1, tx2, ty2)
	vertex_add(-fwid / 2, 0, -fhei / 2, 0, 0, 1, tx1, ty2)
	model_done()
}
