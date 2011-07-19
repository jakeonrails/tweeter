class Status < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user_id
  
  validates_length_of :body, :in => 1..140
end
