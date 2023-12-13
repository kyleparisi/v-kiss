import gg

const velocity = 3
const image_hw = 100
const image_padding = 10

struct AppState {
mut:
	gg    &gg.Context = unsafe { nil }
	x     int
	y     int
	dy    int
	dx    int
	image gg.Image
}

fn (mut state AppState) draw() {
	size := gg.window_size()
	state.x += state.dx
	state.y += state.dy
	// state.gg.draw_rounded_rect_filled(state.x, state.y, 10, 10, 0, gx.rgb(143, 130, 119))
	state.gg.draw_image(state.x, state.y, image_hw, image_hw, state.image)
	if state.x <= -image_padding {
		state.dx = velocity
	}
	if state.y <= -image_padding {
		state.dy = velocity
	}
	if state.x >= size.width - image_hw + image_padding {
		state.dx = -velocity
	}
	if state.y >= size.height - image_hw + image_padding {
		state.dy = -velocity
	}
}

// gg callbacks:
fn graphics_frame(mut state AppState) {
	state.gg.begin()
	state.draw()
	state.gg.end()
}

fn main() {
	mut state := &AppState{
		x: 10
		y: 10
		dx: velocity
		dy: velocity
	}
	state.gg = gg.new_context(
		width: 800
		height: 600
		create_window: true
		window_title: 'dVd'
		frame_fn: graphics_frame
		user_data: state
	)
	state.image = state.gg.create_image('logo.png')!
	state.gg.run()
}
