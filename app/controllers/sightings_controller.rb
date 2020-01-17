class SightingsController < ApplicationController
    
    def index
        sightings = Sighting.all
        render json:
    SightingSerializer.new(sightings).to_serialized_json
    
    def show
        @sighting = Sighting.find(params[:id])
        render json: @sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
    SightingSerializer.new(sighting).to_serialized_json
    end
end


