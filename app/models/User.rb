class User < ActiveRecord::Base
  validates :username, presence: true,
            uniqueness: {case_sensitive:false},# making case_sensitive false ensures that both 
#    apital and small letter as thesame so that you can enter thesame value irrespevtive their case
            length: {minimum: 3, maximum: 25}
   VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true,
         uniqueness: {case_sensitive: false},
         format: { with: VALID_EMAIL_REGEX}
end