require 'bcrypt'

class User
	include BCrypt
  include DataMapper::Resource
    
  property :id,   		Serial 
  property :email,  	String, required: true
  property :password_hash, 	Text
  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address

 	def password=(actual_password)
 		@password = Password.create(actual_password)
   	self.password_hash = @password
  end
end
