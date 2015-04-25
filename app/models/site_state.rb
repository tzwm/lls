class SiteState < ActiveRecord::Base
  STATE_TYPE = {
    sign_in_user_count: "sign_in_user_count",
    unsign_in_user_count: "unsign_in_user_count"
  }

  def self.add_sign_in_user_count
    ss = find_user_count :sign_in_user_count
    ss.value = (ss.value.to_i + 1).to_s
    ss.save
  end

  def self.delete_sign_in_user_count
    ss = find_user_count :sign_in_user_count
    ss.value = (ss.value.to_i - 1).to_s
    ss.save
  end

  def self.add_unsign_in_user_count
    ss = find_user_count :unsign_in_user_count
    ss.value = (ss.value.to_i + 1).to_s
    ss.save
  end

  def self.delete_unsign_in_user_count
    ss = find_user_count :unsign_in_user_count
    ss.value = (ss.value.to_i - 1).to_s
    ss.save
  end

  private

  def self.find_user_count type
    ss = SiteState.find_or_initialize_by(state_name: SiteState::STATE_TYPE[type])
    ss.value = "0" if ss.value.blank?
    ss
  end
end
