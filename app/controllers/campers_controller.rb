class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found
rescue_from ActiveRecord::RecordInvalid, with: :camper_invalid
def index
    render json: Camper.all, status: :ok
end

def show
 render json: Camper.find(params[:id])
end


def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
end



private

def camper_params
    params.permit(:name, :age, :camper_id)
end

def camper_not_found
    render json: {error: "Camper not found"}, status: :not_found
end

def camper_invalid
    render json: {error: "validation errors"}, status: 422
end
end
