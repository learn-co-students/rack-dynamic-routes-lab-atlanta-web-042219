class Application
  @@items = [Item.new("Figs",3.42), Item.new("Pears",0.99)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/")
        if @@items.find {|it| it.name == item}
          resp.write "#{item.price}"
          resp.status = 200
        else
          resp.write "Item not found"
          resp.status = 400
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
