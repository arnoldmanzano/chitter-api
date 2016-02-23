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

  get '/peeps/:id' do
    content_type :json
    peep = Peep.get(params[:id])
    return status 404 if peep.nil?
    peep.to_json
  end

  get '/peeps/user/:id' do
    content_type :json
    user = User.get(params[:id])
    return status 404 if user.nil? || user.peeps.nil?
    user.peeps.to_json
  end

  post '/peeps' do
    user = User.get(params[:user_id])
    return status 500 if user.nil?
    user.peeps.create(
      message: params[:message],
      datetime: Time.now)
    return status 201
  end

  get '/users' do
    content_type :json
    User.all.to_json(exclude: [:password_digest])
  end

  get '/users/:id' do
    content_type :json
    user = User.get(params[:id])
    return status 404 if user.nil?
    user.to_json
  end

  post '/users' do
    user = User.new(
      username: params[:username],
      email: params[:email],
      name: params[:name],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    if user.save
      return status 201
    else
      return status 500
    end
  end

  run! if app_file == $PROGRAM_NAME
end
