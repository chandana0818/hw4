class PlacesController < ApplicationController

  def index
    @places = Place.where({user_id: session[:user_id]})
    
  end

  def show
    
    @place = Place.find(params["id"])
    
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params["place"])
    @place.user_id = @current_user.id
    @place.save
    redirect_to "/places"
  end

  def edit
      @place = Place.find(params["id"])
  end

  def update
      @place = Place.find(params["id"])
      @place.update(params["place"])
      redirect_to "/places"
  end

  def destroy
      @place = Place.find(params["id"])
      @place.destroy
      redirect_to "/places"
  end

end



  