class User < ApplicationRecord

  before_save :hash_field

  private
  def hash_field
    p self.password
    self.password = Digest::MD5.hexdigest(self.password)
    self.confirm_password = Digest::MD5.hexdigest(self.confirm_password)
  end
end
