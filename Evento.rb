require_relative "Odd"
require_relative "Apostador"
require_relative "Subject"
require_relative "Aposta"
require_relative "Bookie"

class Evento
	attr_accessor :resultado, :equipa1, :equipa2, :dataEvento, :listaApostas, :isOpen, :odds, :id, :creatorEmail, :ttMoney
	include Subject
	def initialize(equipa1="",equipa2="",dataEvento,bookie, id, odd, creatorEmail)
		@equipa1, @equipa2, @dataEvento = equipa1, equipa2, dataEvento
		@id = id
		@ttMoney = 0;
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

	def notify(sub)
		fevento = "fevento"
		odd = "odd"
		if(sub==fevento)
			for aposta in @listaApostas
				premio = 0
				if aposta.resultado == @resultado
					if aposta.resultado == "1\n"
						premio = aposta.montante * aposta.oddFixada.odd1
					elsif aposta.resultado == "2\n"
						premio = aposta.montante * aposta.oddFixada.odd2
					elsif aposta.resultado == "X\n"
						premio = aposta.montante * aposta.oddFixada.oddX	
					end
					aposta.status = "Won :("
					aposta.viewAposta
					puts("ola")
					
				else
					aposta.status = "Lost :)"
					@ttMoney = @ttMoney+aposta.montante
				end
				aposta.apostador.updateObserver(premio)
				aposta.apostador.betESScoins = aposta.apostador.betESScoins + premio
			end
			for bookie in @listaBookies
				bookie.updateObserver("Evento #{id} fechou")
			end

		elsif (sub==odd)
			for aposta in @listaApostas
					aposta.apostador.updateObserver("As odds mudaram")
			end
			for bookie in @listaBookies
				bookie.updateObserver("As odds mudaram")
			end
		end
			
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

