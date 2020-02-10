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
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end
end