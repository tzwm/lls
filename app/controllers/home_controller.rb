class HomeController < ApplicationController
  def index
    @sign_in_user_count = SiteState.current_sign_user_count
    @unsign_in_user_count = SiteState.current_unsign_user_count
  end
end
