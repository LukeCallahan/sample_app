class Micropost < ActiveRecord::Base

	belongs_to: user
	default_scope -> { order('created_at DESC') }
	# it seems like scope is the constraint or filter method. 
	#So if I want to filter my data, I will work with the sscope. 
	#I wonder how to get user inputted scope...

	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true
	
end
