class PostsController < ApplicationController

  def new
    @post = Post.new
    #@post.place_id = params["place_id"]
    @place = Place.find(params["place_id"])
    @post.place_id = @place.id
  end

  def create
      @post = Post.new(params["post"])
      @post.user_id = @current_user.id
      @post.save
      redirect_to "/places/#{@post.place.id}"
    
  end

  def edit
    @post = Post.find(params["id"])
  end

  def update
      @post = Post.find(params["id"])
      @post.update(params["post"])
      redirect_to "/places/#{@post.place.id}"
  end

  def destroy
      @post = Post.find(params["id"])
      @post.destroy
      redirect_to "/places/#{@post.place.id}"
  end

end
