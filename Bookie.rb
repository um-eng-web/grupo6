class Bookie

	def initialize(email, name)
		@email = email
		@name = name
	end

	def viewBookie()
		puts("Nome: #{@name}")
		puts("Email: #{@email}")
	end
end