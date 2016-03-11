class Menus
	attr_accessor :BetESS
	def initialize()
		@BetESS =ESSBet.new("BetESS")
	end

	def menuInicial()
		puts("Bem vindo ao BetESS:")
		puts("1-Login")
		puts("2-Registar")
		puts("3-Apagar conta")
		puts("0-Sair")
		escolha = gets.to_i

		if(escolha==1) 
			menuLogin()
		elsif(escolha==2)
			menuRegistar()
		elsif(escolha==3)
			menuApagarConta()
		elsif(escolha==0)
			puts("Obrigado! Volte sempre!")
		else
			puts("Escolha uma opção válida!")
			menuInicial()
		end
	end

	def menuLogin()
		puts("Que tipo de utilizador é ?")
		puts("1-Apostador")
		puts("2-Bookie")
		puts("3-Retroceder")
		puts("0-Sair")

		escolha = gets.to_i

		if(escolha==1) 
			#menuLoginApostador()
		elsif(escolha==2)
			#menuLoginBookie()
		elsif(escolha==3)
			menuInicial()
		elsif(escolha==0)
			puts("Obrigado! Volte sempre!")
		else
			puts("Escolha uma opção válida!")
			menuLogin()
		end
	end

	def menuRegistar()
		puts("Que tipo de utilizador vai ser ?")
		puts("1-Apostador")
		puts("2-Bookie")
		puts("3-Retroceder")
		puts("0-Sair")
		
		escolha = gets.to_i
		
		if(escolha==1) 
			#menuRegistaApostador()
		elsif(escolha==2)
			#menuRegistaBookie()
		elsif(escolha==3)
			menuInicial()
		elsif(escolha==0)
			puts("Obrigado! Volte sempre!")
		else
			puts("Escolha uma opcao válida !")
			menuInicial()
		end
	end

		def menuApagarConta()
		puts("Que tipo de utilizador é ?")
		puts("1-Apostador")
		puts("2-Bookie")
		puts("3-Retroceder")
		puts("0-Sair")

		escolha = gets.to_i

		if(escolha==1) 
			#menuApagarApostador()
		elsif(escolha==2)
			#menuApagarBookie()
		elsif(escolha==3)
			menuInicial()
		elsif(escolha==0)
			puts("Obrigado! Volte sempre!")
		else
			puts("Escolha uma opção válida!")
			menuApagarConta()
		end
	end
end

##Executar
menu= Menus.new()