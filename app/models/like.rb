class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  validates :track_id, presence: true
  validates :user_id, presence: true
  
end
