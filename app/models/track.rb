class Track < ActiveRecord::Base
  validates :song_title, presence: true, uniqueness: true
  validates :author, presence: true
end
