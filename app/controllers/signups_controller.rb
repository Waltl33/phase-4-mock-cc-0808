class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :signup_invalid

    def index
        render json: Signup.all
    end

    def show
        render json: Signup.find(params[:id])
    end
      
    def create
      render json: Signup.create!(signup_params)
    end
      
      
      
        private
      
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
    def signup_invalid
        render json: {error: "validation errors"}, status: 422
    end
end
