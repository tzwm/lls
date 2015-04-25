class SiteState < ActiveRecord::Base
  STATE_TYPE = {
    sign_in_user_count: "sign_in_user_count",
    unsign_in_user_count: "unsign_in_user_count"
  }

  def self.current_sign_user_count
    ss = SiteState.where(state_name: SiteState::STATE_TYPE[:sign_in_user_count]).first
    ss.blank? ? 0 : ss.value.to_i
  end

  def self.current_unsign_user_count
    ss = SiteState.where(state_name: SiteState::STATE_TYPE[:unsign_in_user_count]).first
    ss.blank? ? 0 : ss.value.to_i
  end

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
