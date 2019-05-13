class Application

	@@items = []

	def call(env)
		resp = Rack::Response.new
		req = Rack::Request.new(env)

		if req.path.match('items')
			item = @@items.find {|item| item.name == req.path.split('/')[2] }
			if item == nil
				resp.status = 400
				resp.write("Item not found")
			else
				resp.status = 200
				resp.write(item.price)
			end
		else
			resp.status = 404
			resp.write('Route not found.')
		end

		resp.finish
	end
end