# frozen_string_literal: true

class App
  def call(env)
    @request = Rack::Request.new(env)

    if @request.path == "/time"
      response_time
    else
      response_not_found
    end
  end

  private

  def response_time
    response = Rack::Response.new
    response.write(AppTime.current(format))
    response['Content-Type'] = 'text/plain'
    response.status = 200
    response.finish
  end

  def response_not_found
    response = Rack::Response.new
    response.write("Page not found.")
    response['Content-Type'] = 'text/plain'
    response.status = 404
    response.finish
  end

  def format
    @request["format"]
  end
end
