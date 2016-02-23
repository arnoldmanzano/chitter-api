ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class ChitterApi < Sinatra::Base
  get '/' do
    'Hello ChitterApi!'
  end

  get '/peeps' do
    content_type :json
    Peep.all.to_json
  end

  run! if app_file == $PROGRAM_NAME
end
