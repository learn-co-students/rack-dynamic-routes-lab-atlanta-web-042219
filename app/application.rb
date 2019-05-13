class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match == (/<ITEM NAME>/)
      item = req.path.split("/<ITEM NAME>")
        if Item.all.include?("#{item}")
          resp.write "#{item.price}"
        else
          resp.write "We don't have that item"
          resp.status = 400
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
