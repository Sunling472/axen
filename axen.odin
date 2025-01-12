package axen

import its "base:intrinsics"
import rl "vendor:raylib"

WindowSettings :: struct {
	width:  i32,
	height: i32,
	title:  cstring,
	fps:    i32,
	flags:  rl.ConfigFlags,
}

run :: proc(
	model: ^$M,
	init: proc(model: ^$m),
	update: proc(model: ^$md, dt: f32),
	render: proc(model: $mdl),
	settings: WindowSettings,
) where its.type_is_struct(M) &&
	its.type_is_struct(m) &&
	its.type_is_struct(md) &&
	its.type_is_struct(mdl) {

	rl.SetConfigFlags(settings.flags)
	rl.InitWindow(
		settings.width,
		settings.height,
		settings.title,
	);defer rl.CloseWindow()
	rl.InitAudioDevice();defer rl.CloseAudioDevice()
	rl.SetTargetFPS(settings.fps)

	init(model)

	for !rl.WindowShouldClose() {
		dt := rl.GetFrameTime()
		update(model, dt)

		rl.BeginDrawing()
		render(model^)
		rl.EndDrawing()

		free_all(context.temp_allocator)
	}

}
