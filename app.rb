# frozen_string_literal: true

class App
  def call(env)
    @env = env

    if request_path == "/time"
      response_time
    else
      response_not_found
    end
  end

  private

  def response_time
    [
        status,
        headers,
        body
    ]
  end

  def response_not_found
    [
        status_not_found,
        headers,
        body_not_found
    ]
  end

  def status_not_found
    404
  end

  def body_not_found
    ["Page not found."]
  end

  def body
    return ["\n"] unless format

    t = Time.now

    result = format
                 .sub('year',   t.year.to_s)
                 .sub('month',  t.month.to_s)
                 .sub('day',    t.day.to_s)
                 .sub('hour',   t.hour.to_s)
                 .sub('minute', t.min.to_s)
                 .sub('second', t.sec.to_s)

    ["#{result}\n"]
  end

  def format
    request_params_hash["format"]
  end

  def request_params_hash
    arr = request_params.split('=')
    Hash[*arr]
  end

  def request_path
    @env["REQUEST_PATH"]
  end

  def request_params
    @env["QUERY_STRING"]
  end

  def status
    200
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end
end
