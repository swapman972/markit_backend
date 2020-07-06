class EventsController < ApplicationController
    def index
        events = Event.all
        render json: events, except: [:created_at, :updated_at]
    end

    def show
        event = Event.find(params[:id])
        render json: event.as_json.merge({
            likes: (event.ratings.count)
        }), except: [:created_at, :updated_at]
    end

    def new
        @event = Event.new 
    end

    def create
        @event = Event.create(event_params)
        render json: @event, except: [:created_at, :updated_at]
    end
    
    private 

    def event_params
        params.require(:event).permit!
    end

end
