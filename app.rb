require 'sinatra'
require 'sinatra/reloader'
require 'json'

require_relative 'models.rb'
require_relative 'helpers.rb'

unless ENV['RACK_ENV'] == 'production'
  also_reload './models.rb'
  also_reload './helpers.rb'
end

helpers do
  include Helpers
end

before /\.json/ do
  content_type 'application/json'
end

get '/users.json' do
  {users: User.all }.to_json
end

post '/users.json' do
  User.create(data['user']).to_json
end

get '*' do
  erb :'index'
end
