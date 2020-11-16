class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_secure_password
  
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email((email.strip).downcase)
    if user && user.authenticate(password)
      return user
    else 
      return nil
    end
  end

end
