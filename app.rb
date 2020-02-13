require 'sinatra/base'
require './lib/bookmark'


class Webapp < Sinatra::Base
  enable :sessions
  get '/' do
    'Hello world!'
  end
  

  get '/bookmarks' do
    # print the ENVIROMENT variable--Sinatra is built on a technology called Rack. Rack provides Sinatra with a built-in variable, ENV. It's available anywhere in Sinatra.
    # p ENV
    
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

    get '/bookmarks/new'do
    erb :new
    end

    post '/bookmarks/new' do
      # p " you just added bastard"
      # p params #bubble-------changing to below codes
      #we are refactoring code below--------------
      # url = params['url']
      # connection = PG.connect(dbname: 'bookmark_test')
      # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
      # redirect '/bookmarks'
      Bookmark.create(url: params[:url],title: params[:title])
      redirect '/bookmarks'
    end

end