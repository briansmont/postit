class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :topics
  has_many :posts
  has_many :comments
  
  after_initialize {self.role ||= :standard}
  enum role: [:standard, :premium, :admin]
  
end
