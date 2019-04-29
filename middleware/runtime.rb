# frozen_string_literal: true

class Runtime
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now

    status, headers, body = @app.call(env)
    headers['X-Runtime'] = format('%fs', (Time.now - start_time))

    [status, headers, body]
  end
end
