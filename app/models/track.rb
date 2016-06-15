class Track < ActiveRecord::Base
  validates :song_title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :posted_by, presence: true
  has_many :likes
end
