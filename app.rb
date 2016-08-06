require 'sinatra'

class MyApp < Sinatra::Base
  get '/' do
    'Hello, Sinatra'
  end

  get '/error' do
    [500, 'Error occurred']
  end

  get '/slow' do
    sleep 10
    'Slow response'
  end
end
