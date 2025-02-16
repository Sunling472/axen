package axen

import json "core:encoding/json"
import fmt "core:fmt"
import math "core:math"
import linalg "core:math/linalg"
import mem "core:mem"
import os "core:os"
import rl "vendor:raylib"


// Constants

// Color Definitions
WHITE: Color : {255, 255, 255, 255} // White
BLACK: Color : {0, 0, 0, 255} // Black
RED: Color : {255, 0, 0, 255} // Red
GREEN: Color : {0, 255, 0, 255} // Green
BLUE: Color : {0, 0, 255, 255} // Blue
YELLOW: Color : {255, 255, 0, 255} // Yellow
CYAN: Color : {0, 255, 255, 255} // Cyan
MAGENTA: Color : {255, 0, 255, 255} // Magenta
ORANGE: Color : {255, 165, 0, 255} // Orange
PURPLE: Color : {128, 0, 128, 255} // Purple
BROWN: Color : {165, 42, 42, 255} // Brown
GRAY: Color : {128, 128, 128, 255} // Gray
LIGHTGRAY: Color : {211, 211, 211, 255} // Light Gray
DARKGRAY: Color : {169, 169, 169, 255} // Dark Gray
PINK: Color : {255, 192, 203, 255} // Pink
GOLD: Color : {255, 215, 0, 255} // Gold
SILVER: Color : {192, 192, 192, 255} // Silver
MAROON: Color : {128, 0, 0, 255} // Maroon
OLIVE: Color : {128, 128, 0, 255} // Olive
LIME: Color : {50, 205, 50, 255} // Lime
TEAL: Color : {0, 128, 128, 255} // Teal
NAVY: Color : {0, 0, 128, 255} // Navy
VIOLET: Color : {238, 130, 238, 255} // Violet
INDIGO: Color : {75, 0, 130, 255} // Indigo
TURQUOISE: Color : {64, 224, 208, 255} // Turquoise
PEACH: Color : {255, 218, 185, 255} // Peach
MINT: Color : {189, 252, 201, 255} // Mint
CORAL: Color : {255, 127, 80, 255} // Coral
LIGHTPINK: Color : {255, 182, 193, 255} // Light Pink
DARKORANGE: Color : {255, 140, 0, 255} // Dark Orange
DARKGREEN: Color : {0, 100, 0, 255} // Dark Green
DARKBLUE: Color : {0, 0, 139, 255} // Dark Blue
LAVENDER: Color : {230, 230, 250, 255} // Lavender
CRIMSON: Color : {220, 20, 60, 255} // Crimson
FUCHSIA: Color : {255, 0, 255, 255} // Fuchsia
LIGHTYELLOW: Color : {255, 255, 224, 255} // Light Yellow
LIGHTGREEN: Color : {144, 238, 144, 255} // Light Green
LIGHTBLUE: Color : {173, 216, 230, 255} // Light Blue
LIGHTCORAL: Color : {240, 128, 128, 255} // Light Coral
TOMATO: Color : {255, 99, 71, 255} // Tomato
SEASHELL: Color : {255, 228, 196, 255} // Seashell
HONEYDEW: Color : {240, 255, 240, 255} // Honeydew
MISTYROSE: Color : {255, 228, 225, 255} // Misty Rose
WHITESMOKE: Color : {245, 245, 245, 255} // White Smoke
AZURE: Color : {240, 255, 255, 255} // Azure
SANDYBROWN: Color : {244, 164, 96, 255} // Sandy Brown
SLATEGRAY: Color : {112, 128, 144, 255} // Slate Gray
KHAKI: Color : {240, 230, 140, 255} // Khaki
LIMEGREEN: Color : {50, 205, 50, 255} // Lime Green
MEDIUMSLATEBLUE: Color : {123, 104, 238, 255} // Medium Slate Blue
SADDLEBROWN: Color : {139, 69, 19, 255} // Saddle Brown
SLATEBLUE: Color : {106, 90, 205, 255} // Slate Blue
DODGERBLUE: Color : {30, 144, 255, 255} // Dodger Blue
DEEPSKYBLUE: Color : {0, 191, 255, 255} // Deep Sky Blue
MEDIUMPURPLE: Color : {147, 112, 219, 255} // Medium Purple
PALEVIOLETRED: Color : {219, 112, 147, 255} // Pale Violet Red
NAVAJOWHITE: Color : {255, 222, 173, 255} // Navajo White
GAINSBORO: Color : {220, 220, 220, 255} // Gainsboro
CHARTREUSE: Color : {127, 255, 0, 255} // Chartreuse
PLUM: Color : {221, 160, 221, 255} // Plum
ORCHID: Color : {218, 112, 214, 255} // Orchid
PEA: Color : {197, 227, 132, 255} // Pea
DARKSALMON: Color : {233, 150, 122, 255} // Dark Salmon
LIGHTSEAGREEN: Color : {32, 178, 170, 255} // Light Sea Green
MEDIUMAQUAMARINE: Color : {102, 205, 170, 255} // Medium Aquamarine
THISTLE: Color : {216, 191, 216, 255} // Thistle
LIGHTSTEELBLUE: Color : {176, 196, 222, 255} // Light Steel Blue
CADETBLUE: Color : {95, 158, 160, 255} // Cadet Blue
DARKCYAN: Color : {0, 139, 139, 255} // Dark Cyan
LAVENDERBLUSH: Color : {255, 240, 245, 255} // Lavender Blush
HOTPINK: Color : {255, 105, 180, 255} // Hot Pink
SILVERCHALICE: Color : {192, 192, 192, 255} // Silver Chalice
DARKOLIVEGREEN: Color : {85, 107, 47, 255} // Dark Olive Green
OLIVEGREEN: Color : {128, 128, 0, 255} // Olive Green
TAN: Color : {210, 180, 140, 255} // Tan
ROSYBROWN: Color : {188, 143, 143, 255} // Rosy Brown
REDVIOLET: Color : {207, 50, 119, 255} // Red Violet
MIDNIGHTBLUE: Color : {25, 25, 112, 255} // Midnight Blue
AQUAMARINE: Color : {127, 255, 212, 255} // Aquamarine
BRIGHTRED: Color : {255, 0, 0, 255} // Bright Red
DARKKHAKI: Color : {189, 183, 107, 255} // Dark Khaki
FIREBRICK: Color : {178, 34, 34, 255} // Firebrick
CORNFLOWERBLUE: Color : {100, 149, 237, 255} // Cornflower Blue

// Structs
Texture2D :: rl.Texture2D

Color :: rl.Color

Rectangle :: rl.Rectangle

Entity2D :: struct {
	pos:   Vector2,
	size:  Vector2,
	color: Color,
	speed: f32,
}

Animation :: struct {
	texture:       Texture2D,
	frame_width:   f32,
	frame_height:  f32,
	num_frame:     f32,
	frame_time:    f32,
	current_frame: f32,
	elapsed_time:  f32,
	start_frame:   f32,
	end_frame:     f32,
}

Camera2D :: rl.Camera2D

Vector2 :: rl.Vector2

Font :: rl.Font

Sound :: rl.Sound

Music :: rl.Music

// Enums
Keys :: enum (u32) {
	NULL          = u32(rl.KeyboardKey.KEY_NULL),
	A             = u32(rl.KeyboardKey.A),
	B             = u32(rl.KeyboardKey.B),
	C             = u32(rl.KeyboardKey.C),
	D             = u32(rl.KeyboardKey.D),
	E             = u32(rl.KeyboardKey.E),
	F             = u32(rl.KeyboardKey.F),
	G             = u32(rl.KeyboardKey.G),
	H             = u32(rl.KeyboardKey.H),
	I             = u32(rl.KeyboardKey.I),
	J             = u32(rl.KeyboardKey.J),
	K             = u32(rl.KeyboardKey.K),
	L             = u32(rl.KeyboardKey.L),
	M             = u32(rl.KeyboardKey.M),
	N             = u32(rl.KeyboardKey.N),
	O             = u32(rl.KeyboardKey.O),
	P             = u32(rl.KeyboardKey.P),
	Q             = u32(rl.KeyboardKey.Q),
	R             = u32(rl.KeyboardKey.R),
	S             = u32(rl.KeyboardKey.S),
	T             = u32(rl.KeyboardKey.T),
	U             = u32(rl.KeyboardKey.U),
	V             = u32(rl.KeyboardKey.V),
	W             = u32(rl.KeyboardKey.W),
	X             = u32(rl.KeyboardKey.X),
	Y             = u32(rl.KeyboardKey.Y),
	Z             = u32(rl.KeyboardKey.Z),
	LEFT_BRACKET  = u32(rl.KeyboardKey.LEFT_BRACKET),
	RIGHT_BRACKET = u32(rl.KeyboardKey.RIGHT_BRACKET),
	BACKSLASH     = u32(rl.KeyboardKey.BACKSLASH),
	BACKSPACE     = u32(rl.KeyboardKey.BACKSPACE),
	GRAVE         = u32(rl.KeyboardKey.GRAVE),
	SPACE         = u32(rl.KeyboardKey.SPACE),
	ESCAPE        = u32(rl.KeyboardKey.ESCAPE),
	LSHIFT        = u32(rl.KeyboardKey.LEFT_SHIFT),
	ENTER         = u32(rl.KeyboardKey.ENTER),
	UP            = u32(rl.KeyboardKey.UP),
	DOWN          = u32(rl.KeyboardKey.DOWN),
	LEFT          = u32(rl.KeyboardKey.LEFT),
	RIGHT         = u32(rl.KeyboardKey.RIGHT),
	TAB           = u32(rl.KeyboardKey.TAB),
	F1            = u32(rl.KeyboardKey.F1),
	F2            = u32(rl.KeyboardKey.F2),
	F3            = u32(rl.KeyboardKey.F3),
	F4            = u32(rl.KeyboardKey.F4),
	F5            = u32(rl.KeyboardKey.F5),
	F6            = u32(rl.KeyboardKey.F6),
	F7            = u32(rl.KeyboardKey.F7),
	F8            = u32(rl.KeyboardKey.F8),
	F9            = u32(rl.KeyboardKey.F9),
	F10           = u32(rl.KeyboardKey.F10),
	F11           = u32(rl.KeyboardKey.F11),
	F12           = u32(rl.KeyboardKey.F12),
}

MouseButtons :: enum (u32) {
	LEFT   = u32(rl.MouseButton.LEFT),
	MIDDLE = u32(rl.MouseButton.MIDDLE),
	RIGHT  = u32(rl.MouseButton.RIGHT),
}

CollisionSide :: enum {
	None,
	Top,
	Bottom,
	Left,
	Right,
}

ConfigFlags :: rl.ConfigFlags

// Procedures
is_window_minimized :: proc() -> bool {
	return rl.IsWindowMinimized()
}

is_window_maximized :: proc() -> bool {
	return rl.IsWindowMaximized()
}

is_window_focused :: proc() -> bool {
	return rl.IsWindowFocused()
}

is_window_fullscreen :: proc() -> bool {
	return rl.IsWindowFullscreen()
}

is_window_hidden :: proc() -> bool {
	return rl.IsWindowHidden()
}

is_window_ready :: proc() -> bool {
	return rl.IsWindowReady()
}

is_window_state :: proc(flags: ConfigFlags) -> bool {
	return rl.IsWindowState(flags)
}

set_window_state :: proc(flags: ConfigFlags) {
	rl.SetWindowState(flags)
}

set_target_fps :: proc(fps: i32) {
	rl.SetTargetFPS(fps)
}

set_exit_key :: proc(key: Keys) {
	rl.SetExitKey(rl.KeyboardKey(key))
}

get_fps :: proc() -> i32 {
	return rl.GetFPS()
}

get_delta :: proc() -> f32 {
	return rl.GetFrameTime()
}

get_time :: proc() -> f64 {
	return rl.GetTime()
}

clear_window_state :: proc(flags: ConfigFlags) {
	rl.ClearWindowState(flags)
}

toggle_fullscreen :: proc() {
	rl.ToggleFullscreen()
}

toggle_borderless :: proc() {
	rl.ToggleBorderlessWindowed()
}

maximize_window :: proc() {
	rl.MaximizeWindow()
}

minimize_window :: proc() {
	rl.MinimizeWindow()
}

restore_window :: proc() {
	rl.RestoreWindow()
}

wait_time :: proc(seconds: f64) {
	rl.WaitTime(seconds)
}

get_screen_width :: proc() -> f32 {
	width := rl.GetScreenWidth()
	return f32(width)
}

get_screen_height :: proc() -> f32 {
	height := rl.GetScreenHeight()
	return f32(height)
}

get_mouse_position :: proc() -> Vector2 {
	return rl.GetMousePosition()
}

load_texture :: proc(file_path: cstring) -> Texture2D {
	texture := rl.LoadTexture(file_path)

	return texture
}

load_font :: proc(font_path: cstring, font_size: i32) -> Font {
	font := rl.LoadFontEx(font_path, font_size, nil, 250)

	return font
}

get_key_pressed :: proc() -> Keys {
	return Keys(rl.GetKeyPressed())
}

is_key_down :: proc(key: Keys) -> bool {
	return rl.IsKeyDown(rl.KeyboardKey(key))
}

is_key_up :: proc(key: Keys) -> bool {
	return rl.IsKeyUp(rl.KeyboardKey(key))
}

is_key_pressed :: proc(key: Keys) -> bool {
	return rl.IsKeyPressed(rl.KeyboardKey(key))
}

is_key_pressed_repeat :: proc(key: Keys) -> bool {
	return rl.IsKeyPressedRepeat(rl.KeyboardKey(key))
}

is_key_released :: proc(key: Keys) -> bool {
	return rl.IsKeyReleased(rl.KeyboardKey(key))
}

is_mouse_button_down :: proc(button: MouseButtons) -> bool {
	return rl.IsMouseButtonDown(rl.MouseButton(button))
}

is_mouse_button_up :: proc(button: MouseButtons) -> bool {
	return rl.IsMouseButtonUp(rl.MouseButton(button))
}

is_mouse_button_pressed :: proc(button: MouseButtons) -> bool {
	return rl.IsMouseButtonPressed(rl.MouseButton(button))
}

is_mouse_button_released :: proc(button: MouseButtons) -> bool {
	return rl.IsMouseButtonReleased(rl.MouseButton(button))
}

is_collision_rect :: proc(rect1, rect2: Rectangle) -> bool {
	return rl.CheckCollisionRecs(rect1, rect2)
}

is_entity_collision2d :: proc(e1, e2: Entity2D) -> bool {
	r1 := Rectangle {
		width  = e1.size.x,
		height = e1.size.y,
		x      = e1.pos.x,
		y      = e1.pos.y,
	}
	r2 := Rectangle {
		width  = e2.size.x,
		height = e2.size.y,
		x      = e2.pos.x,
		y      = e2.pos.y,
	}
	return is_collision_rect(r1, r2)
}

get_collision_side :: proc(e1, e2: Entity2D) -> CollisionSide {
	if is_entity_collision2d(e1, e2) {
		overlap_left := e1.pos.x + e1.size.x - e2.pos.x
		overlap_right := e2.pos.x + e2.size.x - e1.pos.x
		overlap_top := e1.pos.y + e1.size.y - e2.pos.y
		overlap_bottom := e2.pos.y + e2.size.y - e1.pos.y

		min_overlap_x := min(overlap_left, overlap_right)
		min_overlap_y := min(overlap_top, overlap_bottom)

		// Compare the smallest overlap on the X and Y axes
		if min_overlap_x < min_overlap_y {
			if overlap_left > 0 && overlap_right > e2.size.x {
				return .Right
			} else {
				return .Left
			}
		} else {
			if overlap_top > 0 && overlap_bottom > e2.size.y {
				return .Top
			} else {
				return .Bottom
			}
		}
	}
	return .None
}

get_collision_rect :: proc(rec1, rec2: Rectangle) -> Rectangle {
	return rl.GetCollisionRec(rec1, rec2)
}

get_collision_entity2d :: proc(e1, e2: Entity2D) -> Rectangle {
	rect1 := Rectangle {
		width  = e1.size.x,
		height = e1.size.y,
		x      = e1.pos.x,
		y      = e1.pos.y,
	}
	rect2 := Rectangle {
		width  = e2.size.x,
		height = e2.size.y,
		x      = e2.pos.x,
		y      = e2.pos.y,
	}

	return get_collision_rect(rect1, rect2)
}

load_sound :: proc(sound: cstring) -> Sound {
	return rl.LoadSound(sound)
}

play_sound :: proc(audio: Sound) {
	rl.PlaySound(audio)
}

load_music_stream :: proc(music_path: cstring) -> Music {
	return rl.LoadMusicStream(music_path)
}

update_music_stream :: proc(music: Music) {
	rl.UpdateMusicStream(music)
}

play_music_stream :: proc(music: Music) {
	rl.PlayMusicStream(music)
}

stop_music_stream :: proc(music: Music) {
	rl.StopMusicStream(music)
}

pause_music_stream :: proc(music: Music) {
	rl.PauseMusicStream(music)
}

resume_music_track :: proc(music: Music) {
	rl.ResumeMusicStream(music)
}

stop_sound :: proc(audio: Sound) {
	rl.StopSound(audio)
}

create_animation :: proc(
	texture: Texture2D,
	frame_width, frame_height, num_frames: f32,
	frame_time: f32,
	start_frame, end_frame: f32,
) -> ^Animation {
	animation := new(Animation)
	if animation == nil {
		return nil
	}

	animation.texture = texture
	animation.frame_width = frame_width
	animation.frame_height = frame_height
	animation.num_frame = num_frames
	animation.frame_time = frame_time
	animation.current_frame = start_frame
	animation.elapsed_time = 0.0
	animation.start_frame = start_frame
	animation.end_frame = end_frame

	return animation
}

run_animation :: proc(anim: ^Animation, dt: f32, looped: bool) {
	anim.elapsed_time += dt

	if anim.elapsed_time >= anim.frame_time {
		anim.elapsed_time -= anim.frame_time
		anim.current_frame += 1

		if anim.current_frame > anim.end_frame {
			if looped {
				anim.current_frame = anim.start_frame
			} else {
				anim.current_frame = anim.end_frame
			}
		}
	}
}

render_animation :: proc(
	anim: ^Animation,
	dest_x, dest_y: f32,
	rotation: f32,
	flip_x, flip_y: bool,
) {
	source := Rectangle {
		x      = anim.current_frame * anim.frame_width,
		y      = 0,
		width  = anim.frame_width,
		height = anim.frame_height,
	}

	if flip_x {
		source.width *= -1
	} else if flip_y {
		source.height *= -1
	}

	dest := Rectangle {
		x      = dest_x,
		y      = dest_y,
		width  = anim.frame_width,
		height = anim.frame_height,
	}

	rl.DrawTexturePro(
		anim.texture,
		source,
		dest,
		Vector2{0, 0},
		rotation,
		WHITE,
	)
}
reset_animation :: proc(anim: ^Animation) {
	anim.current_frame = anim.start_frame
	anim.elapsed_time = 0.0
}

render_texture :: proc(
	tex: Texture2D,
	tex_x, tex_y: f32,
	rotation: f32,
	flip_x: bool,
	flip_y: bool,
) {
	origin_x: f32 = f32(tex.width) / 2
	origin_y: f32 = f32(tex.height) / 2

	scale_x: f32
	if flip_x {
		scale_x = -1.0
	} else {
		scale_x = 1.0
	}

	scale_y: f32
	if flip_y {
		scale_y = -1.0
	} else {
		scale_y = 1.0
	}

	rl.DrawTexturePro(
		tex,
		rl.Rectangle{0, 0, f32(tex.width), f32(tex.height)}, // Source rectangle (entire texture)
		rl.Rectangle {
			tex_x,
			tex_y,
			f32(tex.width) * scale_x,
			f32(tex.height) * scale_y,
		}, // Destination rectangle
		rl.Vector2{origin_x, origin_y}, // Rotation origin (center of the texture)
		rotation,
		WHITE,
	)
}

render_sub_texture :: proc(
	tex: Texture2D,
	src_rect, dest_rect: Rectangle,
	rotation: f32,
	flip_x: bool,
	flip_y: bool,
) {
	origin_x: f32 = f32(tex.width) / 2
	origin_y: f32 = f32(tex.height) / 2

	scale_x: f32
	if flip_x {
		scale_x = -1.0
	} else {
		scale_x = 1.0
	}

	scale_y: f32
	if flip_y {
		scale_y = -1.0
	} else {
		scale_y = 1.0
	}

	rl.DrawTexturePro(
		tex,
		src_rect,
		dest_rect,
		Vector2{origin_x, origin_y},
		rotation,
		WHITE,
	)
}

render_text :: proc(text: cstring, x, y, font_size: i32, color: Color) {
	rl.DrawText(text, x, y, font_size, color)
}

render_text_ex :: proc(
	font: Font,
	text: cstring,
	font_size: f32,
	spacing: f32,
	color: Color,
	x, y: f32,
) {
	rl.DrawTextEx(font, text, Vector2{x, y}, font_size, spacing, color)
}

render_rect_filled :: proc(x, y, width, height: f32, color: Color) {
	rl.DrawRectangle(i32(x), i32(y), i32(width), i32(height), color)
}

render_rect_filled_v :: proc(pos, size: Vector2, color: Color) {
	rl.DrawRectangleV(pos, size, color)
}

render_rect_pro :: proc(
	rect: Rectangle,
	origin: Vector2,
	rotate: f32,
	color: Color,
) {
	rl.DrawRectanglePro(rect, origin, rotate, color)
}

render_rect_line :: proc(x, y, width, height: f32, color: Color) {
	rl.DrawRectangleLines(i32(x), i32(y), i32(width), i32(height), color)
}

render_entity2d :: proc(e: Entity2D) {
	render_rect_filled_v(e.pos, e.size, e.color)
}

render_circle_line :: proc(center_x, center_y, radius: f32, color: Color) {
	rl.DrawCircleLines(i32(center_x), i32(center_y), radius, color)
}

render_circle_filled :: proc(center_x, center_y, radius: f32, color: Color) {
	rl.DrawCircle(i32(center_x), i32(center_y), radius, color)
}

render_line :: proc(x1, y1, x2, y2: f32, color: Color) {
	rl.DrawLine(i32(x1), i32(y1), i32(x2), i32(y2), color)
}

clear_screen :: proc(color: Color) {
	rl.ClearBackground(color)
}

rad_to_deg :: proc(radians: f32) -> f32 {
	return radians * (180.0 / math.PI)
}

deg_to_rad :: proc(degrees: f32) -> f32 {
	return degrees * (math.PI / 180.0)
}

apply_camera :: proc(cam: Camera2D) {
	rl.BeginMode2D(cam)
}

end_camera :: proc() {
	rl.EndMode2D()
}

camera_follow :: proc(cam: ^Camera2D, target_x, target_y: f32) {
	cam.target = Vector2{target_x, target_y}
}

camera_follow_lerp :: proc(
	cam: ^Camera2D,
	target_x, target_y, lerp_amount: f32,
) {
	desired_target := Vector2 {
		target_x - (f32(rl.GetScreenWidth()) / 2) / cam.zoom,
		target_y - (f32(rl.GetScreenHeight()) / f32(1.5)) / cam.zoom,
	}

	cam.target.x += (desired_target.x - cam.target.x) * lerp_amount
	cam.target.y += (desired_target.y - cam.target.y) * lerp_amount
}

clamp_camera :: proc(cam: ^Camera2D, world_width, world_height: f32) {
	half_screen_width := (f32(rl.GetScreenWidth()) / 2) / cam.zoom
	half_screen_height := (f32(rl.GetScreenHeight()) / 2) / cam.zoom

	cam.target.x = max(
		half_screen_width,
		min(cam.target.x, world_width - half_screen_width),
	)
	cam.target.y = max(
		half_screen_height,
		min(cam.target.y, world_height - half_screen_height),
	)
}

clamp_camera_target :: proc(
	cam: ^Camera2D,
	target_x, target_y, world_width, world_height: f32,
) {
	half_screen_width := (f32(rl.GetScreenWidth()) / (2 * cam.zoom))
	half_screen_height := (f32(rl.GetScreenHeight()) / (2 * cam.zoom))

	cam.target.x = max(
		half_screen_width,
		min(target_x, world_width - half_screen_width),
	)
	cam.target.y = max(
		half_screen_height,
		min(target_y, world_height - half_screen_height),
	)
}

disable_cursor :: proc() {
	rl.HideCursor()
}

clamp_mouse :: proc() {
	rl.DisableCursor()
}

close_window :: proc() {
	os.exit(0)
}

