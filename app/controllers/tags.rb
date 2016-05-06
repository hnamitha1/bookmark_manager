class BookmarkManager < Sinatra::Base
	get '/tags/:tag_filter' do
	  tag = Tag.first(tag: params[:tag_filter])
	  @links = tag.links
	  erb :'links/index'
	end
end