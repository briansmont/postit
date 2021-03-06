class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :user
  
  
  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :user, presence: true
  
  
end
