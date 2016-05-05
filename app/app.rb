ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
	enable :sessions
	set :session_secret, 'super secret'

	get '/' do
		erb :signup
	end

	post '/signup' do
		user = User.new(email: params[:email])
		user.password = params[:password]
		user.save
		session[:user_id] = user.id
		redirect '/links'
	end

  get '/links' do
  	if session[:user_id]
  	  @logged_in_user = User.get(session[:user_id]).email
    end
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
  	erb :'links/new'
  end

  post '/links' do
  	link = Link.new(url: params[:url], title: params[:title])
  	params[:tag].split(/,\s*/).each do |input_tag|
	  	tag = Tag.first_or_create(tag: input_tag)
	    link.tags << tag
  	end
    link.save
  	redirect '/links'
  end

  get '/tags/:tag_filter' do
    tag = Tag.first(tag: params[:tag_filter])
    @links = tag.links
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
