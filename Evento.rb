class Evento
	def initialize(equipa1="",equipa2="",bookie, id, odd)
		@equipa1, @equipa2, @dataEvento = equipa1, equipa2, dataEvento
		@id = id
		@listaApostas = Array.new()
		@listaBookies = Array.new()
		@listaBookies.push(bookie)
		@isOpen = true
		@odds = odd
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
    
    def viewEvento
    	puts("ID: #{@id}")
        puts("Casa: #{@equipa1}")
        puts("Fora: #{@equipa2}")
        odds.viewOdd()
        puts("Resultado: #{@resultado}")
        puts("Data criação: #{@dataEvento}")
        puts("Bookie responsável: #{@creatorEmail}")   
    end
end



