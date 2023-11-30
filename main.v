import net.http

fn main() {
	resp := http.get("https://google.com/") or {
		println('failed to fetch data from the server')
		return
	}
	println(resp)
	println(resp.body)
}
