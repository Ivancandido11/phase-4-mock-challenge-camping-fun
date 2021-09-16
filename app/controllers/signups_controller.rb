class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  def create
    signup = Signup.create!(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
    activity = signup.activity
    render json: activity, status: :created
  end

private

  def render_invalid_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
