require 'sinatra/base'

class ChitterApi < Sinatra::Base
  get '/' do
    'Hello ChitterApi!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
