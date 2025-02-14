### This is a fork of the Nexa library, the repository of which is deleted, apparently.

The library serves as a wrapper for Raylib, making it even easier to use.

It uses the `init -> update -> render` algorithm, and each procedure is passed the general structure of the model, which can contain any fields. This allows you to transfer data between procedures.
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
