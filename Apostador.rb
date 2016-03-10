class Apostador
	def initialize(email, betESScoins, name)
		@email = email
		@betESScoins = betESScoins
		@name = name
        @listaApostas = Array.new()
        
	end

	def viewApostador()
		puts("Nome: #{@name}")
		puts("Coins: #{@betESScoins}")
		puts("Email: #{@email}")
        
	end
    
end