server = WebsocketServer.new

loop do
	Thread.new(server.accept) do |conn|
		puts "COnnected"
		while (message = connection.recv)
			puts "Received #{message}"
			conn.send("Received #{message}. Thanks!")
		end
	end
end
