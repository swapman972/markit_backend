class TrainsController < ApplicationController
    def index
        trains = Train.all
        render json: trains, except: [:created_at, :updated_at]
    end
end
