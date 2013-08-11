class User
	attr_accessor :name, :email

	def initialize(attributes = {})
		@name = attributes[:name]
		@email = attributes[:email]
	end

	def formatted_email #call the method 'formatted_email' to output in the correct format
		"#{@name} <#{@email}>"
	end

end