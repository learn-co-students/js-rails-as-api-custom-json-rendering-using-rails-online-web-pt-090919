class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: @birds
    # produce array of bird objects and each object will only have id, name and species values
    # render json: birds, only: [:id, :name, :species]
    # All the keys except created_at and updated_at
      # only and except keywords are actually parameters of the to_json method
      # same as `render json: birds.to_json(except: [:created_at, :updated_at])`
    render json: birds, except: [:created_at, :updated_at]

  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    # Hash slice method returns a new hash with only the keys that are passed into `slice`.
    # won't work for an array of hashes 
    # render json: bird.slice(:id, :name, :species)  
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else #nil - falsey
      # if we were to send a request to an invalid endpoint
      # receive a response from the API instead of general HTTP error
      render json: { message: 'Bird not found' }
    end
  end
end