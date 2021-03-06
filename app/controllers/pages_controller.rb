class PagesController < ApplicationController
	#backend code for pages/index
  def index
  end

  	#backend code for pages/home
  def home
  	@posts = Post.all
    @newPost = Post.new
  end

  	#backend code for pages/profile
  def profile
  	#grab the username from the url as :id
  	if (User.find_by_username(params[:id]))
  		@username = params[:id]
	  else
	  	#no encuentra un carajo en el username
	  	redirect_to root_path, :notice=> "User not found!"
	  end

	  @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]))

	  @newPost = Post.new

    @toFollow = User.all.last(5)

  end

  	#backend code for pages/explore
  def explore
  	@posts = Post.all
    @newPost = Post.new
    @toFollow = User.all.last(5)
  end
end
