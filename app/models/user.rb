class User < ActiveRecord::Base
  attr_accessible :facebook_id, :name
  
  validates :facebook_id, uniqueness: true
  
  has_many :comments
end
