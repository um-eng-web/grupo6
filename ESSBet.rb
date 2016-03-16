require_relative "Apostador"
require_relative "Bookie"
require_relative "Odd"
require_relative "Evento"
require_relative "Aposta"

class ESSBet
	
	attr_accessor :users, :bookies, :eventos, :name, :totalMoney, :id

	def initialize(name="Bet House")
		@totalMoney = 10000.0
		@name = name 
		@users = Hash.new()
		@bookies = Hash.new()
		@eventos = Hash.new()
		@id = 0

	end

	def verificaApostador(email)
		listaApostadores = users.keys
		for apostador in listaApostadores
			if apostador.email == email
				return true
			end
		end
		return false
	end

	def verificaBookie(email)
		listaBookies = bookies.keys
		for bookie in listaBookies
			if bookie.email == email
				return true
			end
		end
		return false
	end

	def findApostador(email)
		listaApostadores = users.keys
		for apostador in listaApostadores
			if apostador.email == email
				return apostador
			end
		end
		return "NE"
	end

	def findBookie(email)
		listaBookies = bookies.keys
		for bookie in listaBookies
			if bookie.email == email
				return bookie
			end
		end
		return "NE"
	end

	def findEvento(id)
		listaEventos = @eventos.values
		for evento in listaEventos
			if evento.id == id
				return evento
			end
		end
		return "NE"
	end

	def checkEventoAvailabeTcAoBet(id)
		listaEventos = @eventos.values
		for evento in listaEventos
			if ((evento.id == id) && evento.isOpen)
				return true
			end
		end
		return false
	end

	def addApostador(email, nome, password)
		apostador = Apostador.new(email,0,nome)
		@users[apostador] = password
	end

	def addBookie(email, nome, password)
		bookie = Bookie.new(email,nome)
		@bookies[bookie] = password
	end

	def viewESSBet()
		puts("Nome: #{@name}")
		puts("Eventos: #{@eventos}")
		puts("Dinheiro total: #{@totalMoney}")
		puts("Users #{@users.keys}")
		puts("Bookies #{bookies.keys}")
	end

	def actualizaOdd(id, odd1, odd2, oddX)
		evento = findEvento(id)
		evento.actualizaOdd(odd1,odd2,oddX)
	end

	def fechaEvento(id, resultado)
		findEvento(id).fechaEvento(resultado)
		@totalMoney = @totalMoney+findEvento(id).ttMoney
	end


	def registaEvento(equipa1,equipa2,email, odd1, oddx, odd2)
		listaBookies = bookies.keys
		for bookie in listaBookies
			
			if bookie.email == email
				@id = @id+1
				time = Time.now
				oddz = Odd.new(odd1, oddx, odd2)
				evento = Evento.new(equipa1,equipa2,time,bookie,@id, oddz, email)
				@eventos[@id] = evento
			end
		end
	end

	def subscribeEvento(email, id)
		bookie = findBookie(email)
		evento = findEvento(id)
		evento.addBookie(bookie)
	end


	def deleteApostador(email)
		listaApostadores = users.keys
		for apostador in listaApostadores
			if apostador.email == email
				@users.delete(apostador)
			end
		end
	end

	def verificaPassApostador(email, pass)
		listaApostadores = users.keys
		for apostador in listaApostadores
			if apostador.email == email
				return pass == @users[apostador]
			end
		end
	end

	def verificaPassBookie(email, pass)
		listaBookies = bookies.keys
		for bookie in listaBookies
			if bookie.email == email
				return pass == @bookies[bookie]
			end
		end
	end

	def printEventList()
		boolean = false
		listaEventos = @eventos.values
		for evento in listaEventos
			if evento.isOpen
				boolean=true
				evento.viewEvento
			end
		end

		if(!boolean)
			puts("Não há eventos disponiveis")
		end
	end

	def printOpenedBetsFromUser(email)
		listaApostadores = users.keys
		for apostador in listaApostadores
			if apostador.email == email
				apostador.verApostasAbertasUtilizador()
			end
		end
	end

	def printClosedBetsFromUser(email)
		listaApostadores = users.keys
		for apostador in listaApostadores
			if apostador.email == email
				apostador.verApostasFechadasUtilizador()
			end
		end
	end

	def printCoins(email)
		listaApostadores = users.keys
		for apostador in listaApostadores
			if apostador.email == email
				saldo = apostador.betESScoins
				puts("Coins: #{saldo}")
			end
		end
	end

	def betting(email, id, montante, resultado)
		listaApostadores = users.keys
		for apostador in listaApostadores
			if apostador.email == email
				oddFixada = @eventos[id].odds.clone
				aposta = Aposta.new(@eventos[id].id, @eventos[id].equipa1, @eventos[id].equipa2, apostador, montante, resultado, oddFixada, Time.now)
				@eventos[id].registaAposta(aposta)
				apostador.betESScoins = apostador.betESScoins - montante
				apostador.listaApostas.push(aposta)
			end
		end
	end

	def depositar(email,montante)
		apostador=findApostador(email)
		if(!(apostador=="NE"))
			apostador.betESScoins= apostador.betESScoins + montante
		end
	end

	def apagaApostador(email)
		apostador=findApostador(email)
		if(!(apostador=="NE"))
			@users.delete(apostador)
		end
	end

	def apagaBookie(email)
		bookie=findBookie(email)
		if(!(bookie=="NE"))
			@bookies.delete(bookie)
		end
	end

	def myEvents(email)
		boolean = false
		listaEventos = @eventos.values
		for evento in listaEventos
			if(evento.creatorEmail == email) 
				boolean = true
				evento.viewEvento()
			end
		end
		if(!boolean) 
			puts("Ainda não criou eventos")
		end
	end


end