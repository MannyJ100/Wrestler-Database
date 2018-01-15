require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/wrestler.rb'
require_relative './controllers/wrestlers_controller.rb'
require 'pry'

use Rack::Reloader

use Rack::MethodOverride

run WrestlersController