class ESSBet
	
	attr_accessor :users, :bookies, :eventos, :name, :totalMoney, :id

	def initialize(name="Bet House")
		@totalMoney = 10000.0
		@name = name 
		@users = Hash.new('User não existe')
		@bookies = Hash.new('Bookie não existe')
		@eventos = Hash.new('Evento não existe')
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

	


end