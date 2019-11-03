class User < ActiveRecord::Base

   has_many :flashcards
   has_secure_password
end
