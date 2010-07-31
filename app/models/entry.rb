class Entry < ActiveRecord::Base
  belongs_to :user
  
  validates :content, :length => { :minimum => 1 }
end
