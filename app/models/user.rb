class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
  validates :password, presence: true, confirmation: true, length: { minimum: 4 }
  validates :name, presence: true

  

  private

  def encrypt_password
    self.password = Digest::SHA1.hexdigest("qidftmw#{self.password}mdsfjiw")
  end
end
