class UserProfile < ActiveRecord::Base
  belongs_to :user
  validates  :user_id, presence: true
  validates  :area, length:{maximum:10}
  validates  :bio, length:{maximum:50}
end
