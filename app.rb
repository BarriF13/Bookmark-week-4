require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './lib/bookmark'
require_relative './lib/comment'
require_relative './lib/database_connection_setup'



class Webapp < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

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
      flash[:notice] = "Please submit a valid URL" unless Bookmark.create(url: params[:url], title: params[:title])
      redirect '/bookmarks'
    end

    delete '/bookmarks/:id' do
      #let's print out the form params
      Bookmark.delete(id: params[:id])
      redirect '/bookmarks'
    end

    get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
    end

    patch '/bookmarks/:id' do
      Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
      redirect '/bookmarks'
    end
    # Setting up the comments
    get '/bookmarks/:id/comments/new' do
      @bookmark_id = params[:id]
      erb :'comments/new'
    end
  
    post '/bookmarks/:id/comments' do
      Comment.create(bookmark_id: params[:id], text: params[:comment])
      redirect '/bookmarks'
    end

    run! if app_file == $0
end