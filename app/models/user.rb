require 'bcrypt'

class User
	include BCrypt
  include DataMapper::Resource
    
  property :id,   		Serial 
  property :email,  	String
  property :password_hash, 	Text
  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password

 	def password=(actual_password)
 		@password = Password.create(actual_password)
   	self.password_hash = @password
  end
end
