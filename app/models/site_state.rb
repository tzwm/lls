class SiteState < ActiveRecord::Base
  STATE_TYPE = {
    sign_in_user_count: "sign_in_user_count",
    unsign_in_user_count: "unsign_in_user_count"
  }
end
