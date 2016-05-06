require 'bcrypt'

class User
	include BCrypt
  include DataMapper::Resource
    
  property :id,   		Serial 
  property :email,  	String
  property :password_hash, 	Text
  #attr_accessor :password_confirmation

  #validates_confirmation_of :password_hash

 	def password=(actual_password)
 		@password = Password.create(actual_password)
   	self.password_hash = @password
  end
end
