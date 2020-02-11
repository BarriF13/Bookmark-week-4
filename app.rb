require 'sinatra/base'
require './lib/bookmark'


class Webapp < Sinatra::Base
  enable :sessions
# get '/' do
#   'Testing infrastructure working!'
# end
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    # print the ENVIROMENT variable--Sinatra is built on a technology called Rack. Rack provides Sinatra with a built-in variable, ENV. It's available anywhere in Sinatra.
    # p ENV
    
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end
end