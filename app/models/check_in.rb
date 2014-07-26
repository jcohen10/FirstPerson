class CheckIn < ActiveRecord::Base
  include CheckInsHelper

	belongs_to :user
	belongs_to :location

  after_create :check_in_xp

  # validates_with :distance_and_time

  # def distance_and_time
  #   if distance_since_last_checkin < 500 || time_since_last_checkin < 3600 # seconds
  #     errors.add(:location, "You're too close to your last checkin, go to a new location or wait an hour")
  #   end
  # end

end