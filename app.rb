require 'sinatra/base'



class Bookmark < Sinatra::Base
  enable :sessions
# get '/' do
#   'Testing infrastructure working!'
# end
  get '/' do
    erb :index
  end
end