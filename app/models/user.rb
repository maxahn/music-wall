require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  has_many :likes
  validates :username, presence: true, uniqueness: true, length: {minimum: 2}
  validates :email, presence: true, uniqueness:true
  validates :password_hash, presence: true
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
