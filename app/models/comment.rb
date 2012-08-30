class Comment < ActiveRecord::Base
  attr_accessible :facebook_id, :hidden, :message
end
