require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'omniauth-oauth2'
require 'omniauth-google-oauth2'
require 'pry'

require 'erubis'
require 'pp'

set :erb, :escape_html => true

use OmniAuth::Builder do
  config = YAML.load_file 'config/config.yml'
  provider :google_oauth2, config['identifier'], config['secret']
end

enable :sessions
set :session_secret, '*&(^#234a)'

get '/' do
  %Q|<a href='/auth/google_oauth2'>Sign in with Google</a>|
end

get '/auth/:name/callback' do
  @auth = request.env['omniauth.auth']
  puts "params = #{params}"
  puts "@auth.class = #{@auth.class}"
  puts "@auth info = #{@auth['info']}"
  puts "@auth info class = #{@auth['info'].class}"
  puts "@auth info name = #{@auth['info'].name}"
  puts "@auth info email = #{@auth['info'].email}"
  #puts "-------------@auth----------------------------------"
  #PP.pp @auth
  #puts "*************@auth.methods*****************"
  #PP.pp @auth.methods.sort
  erb :index
end
