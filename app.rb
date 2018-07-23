require 'sinatra'

class MyApp < Sinatra::Base
  get "/" do
    [200, req_info("GET").to_json]
  end

  post "/" do
    [200, req_info("POST").to_json]
  end

  get "/400" do
    [400, req_info("clienet error").to_json]
  end

  get "/500" do
    [500, req_info("server error").to_json]
  end

  get "/slow" do
    sleep 5
    [200, req_info("slow response").to_json]
  end

  def req_info(message = "")
    {
      message: message,
      method: request.request_method,
      path: request.path_info,
      query_string: request.query_string,
      body: request.body
    }
  end
end
