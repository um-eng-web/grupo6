require_relative "ESSBet"
require_relative "Bookie"

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
		puts("\n")

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
		puts("\n")

		if(escolha==1) 
			menuLoginApostador()
		elsif(escolha==2)
			menuLoginBookie()
		elsif(escolha==3)
			menuInicial()
		elsif(escolha==0)
			puts("Obrigado! Volte sempre!")
		else
			puts("Escolha uma opção válida!")
			menuLogin()
		end
	end

	def menuLoginApostador()
		puts("Qual é o seu email ?")
		email = gets

		emailValido = false
		emailValido = @BetESS.verificaApostador(email)
		
		while(!emailValido)
			puts("Esse email não pertence a nenhum Apostador. Insira novamente o seu email")
			email = gets
			emailValido = @BetESS.verificaApostador(email)
		end 

		puts("Insira a password")
		pass = gets
		passwordValida= false
		passwordValida= @BetESS.verificaPassApostador(email,pass)

		while(!passwordValida)
			puts("Password incorreta, volte a inserir")
			pass = gets
			passwordValida= @BetESS.verificaPassApostador(email,pass)
		end 

		puts("Login com sucesso!")
		menuApostador(email)
		puts("\n")
	end

	def menuLoginBookie()
		puts("Qual é o seu email ?")
		email = gets

		emailValido = false
		emailValido = @BetESS.verificaBookie(email)
		
		while(!emailValido)
			puts("Esse email não pertence a nenhum Bookie. Insira novamente o seu email")
			email = gets
			emailValido = @BetESS.verificaBookie(email)
		end 

		puts("Insira a password")
		pass = gets
		passwordValida= false
		passwordValida= @BetESS.verificaPassBookie(email,pass)

		while(!passwordValida)
			puts("Password incorreta, volte a inserir")
			pass = gets
			passwordValida= @BetESS.verificaPassBookie(email,pass)
		end 

		puts("Login com sucesso!")
		menuBookie(email)
	end

	def menuRegistar()
		puts("Que tipo de utilizador vai ser ?")
		puts("1-Apostador")
		puts("2-Bookie")
		puts("3-Retroceder")
		puts("0-Sair")	
		escolha = gets.to_i
		puts("\n")
		
		if(escolha==1) 
			menuRegistaApostador()
		elsif(escolha==2)
			menuRegistaBookie()
		elsif(escolha==3)
			menuInicial()
		elsif(escolha==0)
			puts("Obrigado! Volte sempre!")
		else
			puts("Escolha uma opcao válida !")
			menuInicial()
		end
	end

	def menuRegistaApostador()
		puts("Qual o seu nome ?")
		nome = gets

		puts("Qual o seu email ?")
		emailValido = false
		email = gets
		emailValido = !@BetESS.verificaApostador(email)
		
		while(!emailValido)
			puts("Esse email já existe, escolha outro")
			email = gets
			emailValido = !@BetESS.verificaApostador(email)
		end 

		puts("Escolha uma password")
		pass1= gets
		puts("Confirme a password")
		pass2= gets
		passValida = pass1 == pass2

		while(!passValida)
			puts("Passords não são iguais. Por favor volte a inserir a password")
			pass1= gets
			puts("Confirme a password")
			pass2= gets
			passValida = pass1 == pass2
		end

		@BetESS.addApostador(email,nome,pass1)
		puts("Conta de Apostador criada com sucesso\n\n")
		puts("\n")
		menuInicial()

	end 

	def menuRegistaBookie()
		puts("Qual o seu nome ?")
		nome = gets

		puts("Qual o seu email ?")
		emailValido = false
		email = gets
		emailValido = !@BetESS.verificaBookie(email)
		
		while(!emailValido)
			puts("Esse email já existe, escolha outro")
			email = gets
			emailValido = !@BetESS.verificaBookie(email)
		end 

		puts("Escolha uma password")
		pass1= gets
		puts("Confirme a password")
		pass2= gets
		passValida = pass1 == pass2

		while(!passValida)
			puts("Passords não são iguais. Por favor volte a inserir a password")
			pass1= gets
			puts("Confirme a password")
			pass2= gets
			passValida = pass1 == pass2
		end

		@BetESS.addBookie(email,nome,pass1)
		puts("Conta de Bookie criada com sucesso\n\n")
		menuInicial()
		puts("\n")
		
	end 

	def menuApagarConta()
		puts("Que tipo de utilizador é ?")
		puts("1-Apostador")
		puts("2-Bookie")
		puts("3-Retroceder")
		puts("0-Sair")
		escolha = gets.to_i
		puts("\n")

		if(escolha==1) 
			menuApagarApostador()
		elsif(escolha==2)
			menuApagarBookie()
		elsif(escolha==3)
			menuInicial()
		elsif(escolha==0)
			puts("Obrigado! Volte sempre!")
		else
			puts("Escolha uma opção válida!")
			menuApagarConta()
		end
	end

	def menuApagarApostador()
		puts("Qual o email da conta que pretende apagar ?")
		emailValido = false
		email = gets
		emailValido = @BetESS.verificaApostador(email)
		
		while(!emailValido)
			puts("Esse email não é de nenhum Apostador, tente novamente")
			email = gets
			emailValido = @BetESS.verificaApostador(email)
		end 

		puts("Insira a password")
		pass = gets
		passwordValida= false
		passwordValida= @BetESS.verificaPassApostador(email,pass)

		while(!passwordValida)
			puts("Password incorreta, volte a inserir")
			pass = gets
			passwordValida= @BetESS.verificaPassApostador(email,pass)
		end 

		@BetESS.apagaApostador(email)
		puts("Conta apagada com sucesso! :(")
		menuInicial()
		puts("\n")
	end

	def menuApagarBookie()
		puts("Qual o email da conta que pretende apagar ?")
		emailValido = false
		email = gets
		emailValido = @BetESS.verificaBookie(email)
		
		while(!emailValido)
			puts("Esse email não é de nenhum Bookie, tente novamente")
			email = gets
			emailValido = @BetESS.verificaBookie(email)
		end 

		puts("Insira a password")
		pass = gets
		passwordValida= false
		passwordValida= @BetESS.verificaPassBookie(email,pass)

		while(!passwordValida)
			puts("Password incorreta, volte a inserir")
			pass = gets
			passwordValida= @BetESS.verificaPassBookie(email,pass)
		end 

		@BetESS.apagaBookie(email)
		puts("Conta apagada com sucesso! :(")
		menuInicial()
		puts("\n")
	end

	def menuApostador(email)
		puts("\nEscolha uma das seguintes opções:")
		puts("1-Ver Eventos para apostar")
		puts("2-Ver minhas apostas abertas")
		puts("3-Ver minhas apostas fechadas")
		puts("4-Ver saldo")
		puts("5-Depositar")
		puts("6-Apostar")
		puts("7-Retroceder")
		puts("0-Sair")
		escolha = gets.to_i
		puts("\n")

		if(escolha==1) 
			@BetESS.printEventList()
			menuApostador(email)
		elsif(escolha==2)
			@BetESS.printOpenedBetsFromUser(email)
			menuApostador(email)
		elsif(escolha==3)
			@BetESS.printClosedBetsFromUser(email)
			menuApostador(email)
		elsif(escolha==4)
			@BetESS.printCoins(email)
			menuApostador(email)
		elsif(escolha==5)
			puts("Quanto deseja depositar na sua conta?")
			montante=gets.to_f
			@BetESS.depositar(email,montante)
			puts("Depósito efetuado com sucesso")
			menuApostador(email)
		elsif(escolha==6)
			menuApostar(email)
		elsif(escolha==7)
			menuLogin()
		elsif(escolha==0)
			puts("Obrigado! Volte sempre!")
		else
			puts("Escolha uma opcao válida !")
			menuApostador(email)
		end

	end

	def menuApostar(email)
		puts("Qual o id do evento no qual quer apostar ?")
		id = gets.to_i

		eventoExiste = @BetESS.checkEventoAvailabeTcAoBet(id)
		while(!eventoExiste)
			puts("Esse id não corresponde a nenhum evento disponivel para apostar, por favor insira o id correto")
			id = gets.to_i
			eventoExiste = @BetESS.checkEventoAvailabeTcAoBet(id)
		end

		puts("Em qual dos resultados deseja apostar ? (1-X-2)")
		resultado = gets

		while(!(resultado=="1\n" || resultado=="2\n" || resultado=="X\n"))
			puts("Resultado Inválido. Insira um destes resultados (1,X,2)")
			resultado = gets
		end

		puts("Qual o montante que deseja apostar ?")
		montante = gets.to_f

		apostador=@BetESS.findApostador(email)

		if(apostador.betESScoins >= montante)
			@BetESS.betting(email,id,montante,resultado)	
			puts("Aposta colocada com sucesso !")
			menuApostador(email)
			puts("\n")
		else
			puts("SALDO INSUFICIENTE! Por favor realize um depósito para poder efetuar essa asposta")
			menuApostador(email)
			puts("\n")
		end
	end

	def menuBookie(email)
		puts("\nEscolha uma das seguintes opções:")
		puts("1-Ver eventos disponiveis")
		puts("2-Criar um evento")
		puts("3-Subscrever um evento")
		puts("4-Meus eventos criados")
		puts("5-Fechar um evento")
		puts("6-Alterar Odds de um evento")
		puts("7-Retroceder")
		puts("0-Sair")
		escolha = gets.to_i
		puts("\n")

		if(escolha==1) 
			@BetESS.printEventList()
			menuBookie(email)
		elsif(escolha==2)
			puts("Nome da equipa que joga em casa")
			equipa1=gets
			puts("Nome da equipa que joga fora")
			equipa2=gets
			puts("Odd da equipa que joga em casa")
			odd1=gets.to_f
			puts("Odd do empate")
			oddX=gets.to_f
			puts("Odd da equipa que joga fora")
			odd2=gets.to_f
			@BetESS.registaEvento(equipa1,equipa2,email,odd1,oddX,odd2)
			puts("Evento criado com sucesso!")
			menuBookie(email)
		elsif(escolha==3)
			puts("Qual o id do Evento ?")
			id = gets.to_i
			eventoExiste = @BetESS.checkEventoAvailabeTcAoBet(id)

			while(!eventoExiste)
				puts("Esse id não corresponde a nenhum evento disponivel para subscrever, por favor insira o id correto")
				id = gets.to_i
				eventoExiste = @BetESS.checkEventoAvailabeTcAoBet(id)
			end
			@BetESS.subscribeEvento(email,id)
			puts("Está agora a seguir o evento!")
			menuBookie(email)
		elsif(escolha==4)
			@BetESS.myEvents(email)
			menuBookie(email)
		elsif(escolha==5)
			puts("Qual o id do Evento ?")
			id = gets.to_i
			eventoExiste = @BetESS.checkEventoAvailabeTcAoBet(id)
			while(!eventoExiste)
				puts("Esse id não corresponde a nenhum evento disponivel para fechar, por favor insira o id correto")
				id = gets.to_i
				eventoExiste = @BetESS.checkEventoAvailabeTcAoBet(id)
			end
			
			puts("Qual o resultado ? (1-X-2)")
			resultado = gets
			while(!(resultado=="1\n" || resultado=="2\n" || resultado=="X\n"))
				puts("Resultado Inválido. Insira um destes resultados (1,X,2)")
				resultado = gets
			end

			@BetESS.fechaEvento(id, resultado)
			puts("Evento fechado com sucesso")
			menuBookie(email)
		elsif(escolha==6)
			puts("Qual o id do Evento ?")
			id = gets.to_i
			eventoExiste = @BetESS.checkEventoAvailabeTcAoBet(id)
			
			while(!eventoExiste)
				puts("Esse id não corresponde a nenhum evento disponivel para fechar, por favor insira o id correto")
				id = gets.to_i
				eventoExiste = @BetESS.checkEventoAvailabeTcAoBet(id)
			end

			puts("Nova odd da equipa da casa:")
			odd1=gets.to_f
			puts("Nova odd empate:")
			oddX=gets.to_f
			puts("Nova odd da equipa de fora:")
			odd2=gets.to_f
			@BetESS.actualizaOdd(id, odd1, odd2, oddX)
			menuBookie(email)
		elsif(escolha==7)
			menuLogin()
		elsif(escolha==0)
			puts("Obrigado! Volte sempre!")
		else
			puts("Escolha uma opcao válida !")
			menuBookie(email)
		end

	end


end


##Executar
menu= Menus.new()
menu.BetESS.addApostador("bruno@\n","Bruno Super Apostador\n","123\n")
menu.BetESS.addApostador("barak@\n","Barak Oboma\n","123\n")

menu.BetESS.addBookie("jose@\n","Jose Master Bookie\n","123\n")
menu.BetESS.addBookie("cr7@\n","Cristiano Reinaldo\n","123\n")

menu.BetESS.registaEvento("Benfica","Porto","jose@\n",1.5,2.0,4.0)
menu.BetESS.registaEvento("Braga","Guimaraes","cr7@\n",1.25,2.2,3.76)
menu.BetESS.registaEvento("Rio Ave","Estoril","jose@\n",1.45,3.5,6.74)
menu.menuInicial()
