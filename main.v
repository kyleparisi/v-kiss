module main

import net.http

interface IHttpClient {
	get(string) !http.Response
}

struct HttpClient {}

fn (h &HttpClient) get(url string) !http.Response {
	return http.get(url)
}

fn send(client IHttpClient, url string) !http.Response {
	response := client.get(url)!
	return response
}

fn main() {
	client := HttpClient{}
	response := send(client, 'https://kyleparisi.com')!
	println(response)
}
