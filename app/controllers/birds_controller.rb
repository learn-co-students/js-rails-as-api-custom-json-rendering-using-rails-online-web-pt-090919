class BirdsController < ApplicationController
  def index
    birds = Bird.all
    #render json: birds
    # render json: birds, except: [:created_at, :updated_at] - EVerything except created and updated at.
    render json: birds, only: [:id, :name, :species] # leaves out updated and created at out.
  end

  def show
   bird = Bird.find_by(id: params[:id])
   render json: {id: bird.id, name: bird.name, species: bird.species } # leaves out updated and created at out.
  end

end