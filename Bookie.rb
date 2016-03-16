require_relative 'Observer'

class Bookie
	attr_accessor :email, :name
	include Observer

	def initialize(email, name)
		@email = email
		@name = name
	end

	def viewBookie()
		puts("Nome: #{@name}")
		puts("Email: #{@email}")
	end

	def update(notificationBookie)
		puts("Bookie: #{@name}#{notificationBookie}")
		puts("\n");
	end
end