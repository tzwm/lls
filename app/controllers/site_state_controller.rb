class SiteStateController < ApplicationController
  def add_sign_in_user
    if SiteState.add_sign_in_user_count
      render json: {status: "success"}
    else
      render json: {status: "error"}
    end
  end

  def delete_sign_in_user
    if SiteState.delete_sign_in_user_count
      render json: {status: "success"}
    else
      render json: {status: "error"}
    end
  end

  def add_unsign_in_user
    if SiteState.add_unsign_in_user_count
      render json: {status: "success"}
    else
      render json: {status: "error"}
    end
  end

  def delete_unsign_in_user
    if SiteState.delete_unsign_in_user_count
      render json: {status: "success"}
    else
      render json: {status: "error"}
    end
  end

  def current_sign_in_user_count
    render json: {current_sign_in_user_count: SiteState.current_sign_user_count}
  end

  def current_unsign_in_user_count
    render json: {current_unsign_in_user_count: SiteState.current_unsign_user_count}
  end
end
