require 'socket'

class WebSocketServer

	def initialize(options = {path: '/', port: 4567, host: 'localhost'})
		@path, port, host = options[:path], options[:port], options[:host]
		@tcp_server = TCPServer.new(host, port)
	end

	def accept
		socket = @tcp_server.accept
		send_handshake(socket) && WebSocketConnection.new(socket)
	end


	private

	def send_hand_shake(socket)
		request_line = socket.gets
		header = get_header(socket)
		# ...
	end

	#this gets the header by recursively reading each line offered by the socket

	def get_header(socket, header = "")
		(line = socket.gets) == "rn" ? header : get_header(socket, header + line)
	end

end
