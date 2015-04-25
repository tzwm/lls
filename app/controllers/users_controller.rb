class UsersController < ApplicationController
  before_action :authenticate_user!

  def add_sign_in_time
    return if params[:sign_in_time].blank?

    sign_in_time = params[:sign_in_time].to_i
    current_user.sign_in_time += sign_in_time
    if current_user.save
      render json: {status: "success"}
    else
      render json: {status: "error"}
    end

  end
end
