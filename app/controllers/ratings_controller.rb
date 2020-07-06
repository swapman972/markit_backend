class RatingsController < ApplicationController
    def index
        ratings = Rating.all
        render json: ratings, except: [:created_at, :updated_at]
    end

    def new
        @rating = Rating.new 
    end

    def create
        @rating = Rating.create(rating_params)
        render json: @rating, except: [:created_at, :updated_at]
    end

    def rating_params
        params.require(:rating).permit!
    end
end