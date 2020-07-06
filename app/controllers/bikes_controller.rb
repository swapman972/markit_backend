class BikesController < ApplicationController
    def index
        bikes = Bike.all
        render json: bikes, except: [:created_at, :updated_at]
    end
end
