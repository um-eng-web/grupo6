class Evento
	def initialize(equipa1="",equipa2="",dataEvento,bookie, id, odd, creatorEmail)
		attr_accessor :resultado, :equipa1, :equipa2, :dataEvento, :listaApostas, :isOpen, :odds, :id, :creatorEmail
		@equipa1, @equipa2, @dataEvento = equipa1, equipa2, dataEvento
		@id = id
		@resultado = 'Não aconteceu ainda'
		@dataEvento = dataEvento
		@listaApostas = Array.new()
		@listaBookies = Array.new()
		@listaBookies.push(bookie)
		@isOpen = true
		@odds = odd
		@creatorEmail = creatorEmail
	end

	def fechaEvento(resultado_final)
		@resultado = resultado_final
		@isOpen = false
		notifySubject("fevento")
		return true
	end

	def addBookie(bookie)
		@listaBookies.push(bookie)
	end

	def registaAposta(aposta)
		@listaApostas.push(aposta)
	end

	def printListaApostas
		for aposta in @listaApostas
			aposta.view
		end
	end

	def actualizaOdd(odd1, oddx, odd2)
		@odds.odd1 = odd1
		@odds.oddX = oddx
		@odds.odd2 = odd2
		notifySubject("odd")
		return true
	end
    
    def viewEvento
    	puts("ID: #{@id}")
        puts("Casa: #{@equipa1}")
        puts("Fora: #{@equipa2}")
        odds.viewOdd()
        puts("Resultado: #{@resultado}")
        puts("Data criação: #{@dataEvento}")
        puts("Bookie responsável: #{@creatorEmail}")   
    end

    def viewApostas
    	for aposta in @listaApostas
    		aposta.viewAposta
    	end
    end
end



