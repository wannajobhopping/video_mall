class User < ApplicationRecord
  before_create :encrypt_password


  

  private

  def encrypt_password
    self.passowrd = Digest::SHA1.hexdigest("qidftmw#{self.password}mdsfjiw")
  end
end
