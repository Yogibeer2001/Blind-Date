class User < ActiveRecord::Base

has_one :preference
has_secure_password
validates :email, presence: true, uniqueness: true
validates :username, presence: true, uniqueness: true
validates :age, presence: true
validates :gender, presence: true
validates :location, presence: true

end
