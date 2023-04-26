class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
    activity = Activity.all
    render json: activity
  end

  def destroy
    activity = Activity.find_by(id: params[:id])
    if activity
      activity.destroy
      # render json: activity, status: :deleted
    else
      render json: { error: "Activity not found" }, status: :not_found
    end
  end
end
