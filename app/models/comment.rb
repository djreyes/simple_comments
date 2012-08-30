class Comment < ActiveRecord::Base
  attr_accessible :facebook_id, :hidden, :message, :fb_created_at
  
  validates :facebook_id, uniqueness: true
  
  belongs_to :user
  
  scope :hidden, where(hidden: true)
  scope :unhidden, where(hidden: false)
  
  def self.create_from_url(url = "http://graph.facebook.com/10150670321429236?fields=comments")
    require 'open-uri'
    require 'json'
    
    begin
      json_object = JSON.parse(open(url).read)
      failed = false
    rescue
      error_message = "failed to open URL"
    end
    
    if json_object
      json_object["comments"]["data"].each do |comment|
        if User.find_by_facebook_id(comment["from"]["id"]).nil?
          user = User.create(facebook_id: comment["from"]["id"], name: comment["from"]["name"])
        else
          user = User.find_by_facebook_id(comment["from"]["id"])
        end
      
        if self.find_by_facebook_id(comment["id"]).nil?
          user.comments.create(facebook_id: comment["id"], message: comment["message"], fb_created_at: comment["created_time"])
        end
      end
    end
  end
  
  def self.search(params = {})
    case params[:filter]
    when "hidden"
      results_list = Comment.hidden
    when "unhidden"
      results_list = Comment.unhidden
    else
      results_list = Comment.all
    end
    
    results_list.select { |i| i.message =~ /#{params[:search_term]}/i }
  end
  
end
