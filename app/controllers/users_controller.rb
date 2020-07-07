class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, except: [:created_at, :updated_at]
    end

    def new
        @user = User.new 
    end

    def create
        @user = User.find_or_create_by(user_params)
        if @user.valid?
            render json: @user, except: [:created_at, :updated_at]
         else
            render json: { error: @user.errors.full_messages }, status: :not_acceptable
         end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user, except: [:created_at, :updated_at]
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: @user, except: [:created_at, :updated_at]
    end

    private

    def user_params
        params.require(:user).permit(:firstN, :lastN, :zipcode)
    end
end

