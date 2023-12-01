module main

import net.http

struct MockHttpClient {
}

fn (m &MockHttpClient) get(url string) !http.Response {
	return http.new_response(http.ResponseConfig{
		body: 'beep'
	})
}

fn test_send() {
	client := MockHttpClient{}
	response := send(client, 'beep')!
	assert response.body == 'beep'
}
