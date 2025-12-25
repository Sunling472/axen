package axen

import its "base:intrinsics"
import rl "vendor:raylib"
import clay "libs/clay-odin"

WindowSettings :: struct {
	width:  i32,
	height: i32,
	title:  cstring,
	fps:    i32,
	flags:  rl.ConfigFlags,
}

Settings :: struct {
	window: WindowSettings,
	layout: clay.ClayArray(clay.RenderCommand)
}

run :: proc(
	model: ^$M,
	init: proc(model: ^M),
	update: proc(model: ^M, dt: f32),
	render: proc(model: M),
	settings: Settings,
) where its.type_is_struct(M) {

	minMemorySize: c.size_t = cast(c.size_t)clay.MinMemorySize()
    memory := make([^]u8, minMemorySize)
    arena: clay.Arena = clay.CreateArenaWithCapacityAndMemory(minMemorySize, memory)
    clay.Initialize(arena, {cast(f32)rl.GetScreenWidth(), cast(f32)rl.GetScreenHeight()}, { handler = errorHandler })
    clay.SetMeasureTextFunction(measure_text, nil)

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

		clay.SetPointerState(transmute(clay.Vector2)rl.GetMousePosition(), rl.IsMouseButtonDown(rl.MouseButton.LEFT))
        clay.UpdateScrollContainers(false, transmute(clay.Vector2)rl.GetMouseWheelMoveV(), rl.GetFrameTime())
        clay.SetLayoutDimensions({cast(f32)rl.GetScreenWidth(), cast(f32)rl.GetScreenHeight()})
		
		rl.BeginDrawing()
		clay_raylib_render(settings.layout)
		render(model^)
		rl.EndDrawing()

		free_all(context.temp_allocator)
	}

}
