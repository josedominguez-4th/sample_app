require 'acts_as_ferret'

class Micropost < ActiveRecord::Base
  acts_as_ferret

  self.per_page = 5

  attr_accessible :content

  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
 
  default_scope :order => "microposts.created_at DESC" 
  
  def self.from_users_followed_by(user)
      followed_ids = user.following.map(&:id).join(", ")
      where("user_id IN (#{followed_ids}) OR user_id = ?", user) 
  end
  
  def self.search_from_users_followed_by(user, words)
      followed_ids = user.following.map(&:id).join(", ")
      followed_ids.concat(", " + user.id.to_s)
      where("content LIKE ? AND user_id IN (#{followed_ids})", "%#{words}%") 
  end
end 
