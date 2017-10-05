class User < ApplicationRecord
  # callback method, gets invoked before object is saved to database
  # email.downcase! equivelent to self.email = email.downcase
  before_save { email.downcase! }
  validates :name, presence: true , length: { maximum: 50 }
  #validates is a method
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #weakness: allows adresses containing consecutive dots
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  #rails method that adds the ability to save a securely hashed password_digest attribute to db
  #a pair of virtual attributes (password and password_confirmation), including prescence validations 
  #upon object creation and a validation requiring they match, and and authentcate method that returns 
  #the user when that password is correct (false otherwise)
  #CORRESPONDING MODEL MUST HAVE attribuite password_digest
  #hashed password == password digest
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end

