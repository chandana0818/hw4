class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    if @current_user
      @place = Place.find(params["id"])
    else
      flash[:notice] = "Login first."
      redirect_to "/sessions/new"
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params["place"])
    @place.save
    redirect_to "/places"
  end



end



  