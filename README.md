![logo](logo.png)

### This is a fork of the Nexa library, the repository of which is deleted, apparently.

The library serves as a wrapper for Raylib, making it even easier to use.

It uses the `init -> update -> render` architecture, and each procedure is passed the general structure of the model, which can contain any fields. This allows you to transfer data between procedures.
Here is a minimal example:


```odin

package axen_example

import ax "libs/axen"

Model :: struct {
	settings: ax.WindowSettings
  ...<your any fields>
}

init :: proc(m: ^Model) {}

update :: proc(m: ^Model, dt: f32) {}

render :: proc(m: Model) {}

main :: proc() {
	m: Model

	m.settings = ax.WindowSettings {
		width = 1280,
		height = 720,
		title = "Axen Example",
		fps = 60,
		flags = {.VSYNC_HINT, .WINDOW_RESIZABLE, .MSAA_4X_HINT},
	}

	ax.run(&m, init, update, render, m.settings)
}

```

### Counter
```odin

package axen_counter

import "core:fmt"
import st "core:strings"
import ax "libs/axen"

Model :: struct {
	settings: ax.WindowSettings,
	counter: Counter
}

Counter :: struct {
	value: int,
	size: i32,
	pos: [2]i32,
	format: string,
	color: ax.Color
}

init_counter :: proc(c: ^Counter) {
	c.value = 0
	c.size = 30
	c.pos = {100, 100}
	c.format = "Count: %d"
	c.color = ax.WHITE
}

update_counter :: proc(c: ^Counter) {
	if ax.is_key_pressed(.ENTER) {
		c.value += 1
	}
	if ax.is_key_pressed(.BACKSPACE) {
		c.value -= 1
	}
}

render_counter :: proc(c: Counter) {
	ax.render_text(
		text = st.clone_to_cstring(fmt.aprintf(c.format, c.value)),
		x = c.pos.x,
		y = c.pos.y,
		font_size = c.size,
		color = c.color
	)
	ax.render_text(
		text = "Press ENTER for add count\nPress BACSPACE for dec count",
		x = 100,
		y = 200,
		font_size = c.size,
		color = c.color
	)
}

init :: proc(m: ^Model) {
	init_counter(&m.counter)
}

update :: proc(m: ^Model, dt: f32) {
	update_counter(&m.counter)
}

render :: proc(m: Model) {
	ax.clear_screen(ax.BLACK)
	render_counter(m.counter)
}

main :: proc() {
	m: Model

	m.settings = ax.WindowSettings {
		width = 1280,
		height = 720,
		title = "Axen Example",
		fps = 60,
		flags = {.VSYNC_HINT, .WINDOW_RESIZABLE, .MSAA_4X_HINT}
	}

	ax.run(&m, init, update, render, m.settings)
}
```
