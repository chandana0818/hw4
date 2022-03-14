class PostsController < ApplicationController

  def new
    @post = Post.new
    #@post.place_id = params["place_id"]
    @place = Place.find(params["place_id"])
    @post.place_id = @place.id
  end

  def create
    if @current_user
      @post = Post.new(params["post"])
      @post.user_id = @current_user.id
      @post.save
      redirect_to "/places/#{@post.place.id}"
    else
      flash[:notice] = "Login first."
      redirect_to "/sessions/new"
    end
    
  end

end